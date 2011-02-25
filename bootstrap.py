#! /usr/bin/env python

__author__ = "Duong Dang"
__version__ = "0.1"

import logging, sys, os
import re

class NullHandler(logging.Handler):
    def emit(self, record):
        pass

logger = logging.getLogger("bootstrap")
logger.addHandler(NullHandler())
logger.setLevel(logging.DEBUG)

def valid_var(s):
    return re.sub(r"\W", "_",s)

def main():
    import optparse
    parser = optparse.OptionParser(
        usage='\n\t%prog [options]',
        version='%%prog %s' % __version__)

    parser.add_option("-v", "--verbose",
                      action="store_true", dest="verbose", default=False,
                      help="be verbose")

    parser.add_option("-r", "--src-root",
                      action="store", type="str",
                      dest="src_root", default=os.path.abspath(os.path.dirname(__file__)),
                      help="root directory for source. Default to current directory")

    parser.add_option("--build-root",
                      action="store", type="str",
                      dest="build_root", 
                      help="root directory for builds. Default to SRC_ROOT")

    parser.add_option("-p", "--prefix",
                      action="store", type="str",
                      dest="prefix", default="/usr/local",
                      help="install prefix")

    parser.add_option("-l", "--package-list",
                      action="store", type="str",
                      dest="list", default="sotpylist",
                      help="package list, default : sotpylist")

    parser.add_option("-b", "--boost-root",
                      action="store", type="str",
                      dest="boost_root", default="",
                      help="boost prefix")

    parser.add_option("-o", "--output",
                      action="store", type="str",
                      dest="output", default="SRC_ROOT/Makefile",
                      help="output Makefile (default : SRC_ROOT/Makefile)")

    parser.add_option("--openhrp-home",
                      action="store", type="str",
                      dest="openhrp_home",
                      help="openhrp_home (mandaratory)")

    (options, args) = parser.parse_args(sys.argv[1:])
    if not options.openhrp_home:
        raise Exception("openhrphome option is mandatory. Please specify one!")

    if options.output == "SRC_ROOT/Makefile":
        options.output = os.path.join(options.src_root, "Makefile")

    options.list = options.list.replace(".py","")

    cfgs = __import__(options.list)

    global_vars = cfgs.global_vars
    cmake_opts  = cfgs.cmake_opts
    pkgs        = cfgs.pkgs
    if not options.build_root:
        options.build_root = options.src_root


    global_vars['SRC_ROOT'] = options.src_root
    global_vars['BUILD_ROOT'] = options.build_root
    global_vars['INSTALL_PREFIX'] = options.prefix
    global_vars['BOOST_ROOT'] = options.boost_root
    global_vars['OPENHRP3_HOME'] = options.openhrp_home

    s = "#Generated by bootstrap.py\n"

    for key, value in global_vars.items():
        s += "%-30s = %s\n"%(key,value)
    s += 2*"\n"

    s += "all:\\\n"
    for i,pkg in enumerate(pkgs):
        s += "    %s"%(valid_var(pkg[0]))
        if i < len(pkgs)-1:
            s += " \\\n"
    s += 2*"\n"

    s += "build_all:\\\n"
    for i,pkg in enumerate(pkgs):
        s += "    %s_configure %s"%(valid_var(pkg[0]),valid_var(pkg[0]))
        if i < len(pkgs)-1:
            s += " \\\n"
    s += 2*"\n"

    for action in ("checkout", "pull", "clean",
                   "very_clean", "update", "info"):

        s += "%s:\\\n"%action
        for i,pkg in enumerate(pkgs):
            s += "    %s_%s"%(valid_var(pkg[0]),action)
            if i < len(pkgs)-1:
                s += " \\\n"
        s += 2*"\n"

    for pkg in pkgs:
        name = pkg[0]
        alpha_name = valid_var(name)
        gituri = "%s/%s"%(pkg[1],name)
        branch = pkg[2]
        s += """%s:
\tcd ${BUILD_ROOT}/%s/_build; make install
"""%(alpha_name, name)
        cmake_opt = ""
        for key, value in cmake_opts.items():
            if re.match(r"%s"%key, name):
                cmake_opt += "%s "%value
        subs = { 'name' : name, 
                 'alpha_name' : alpha_name, 
                 'gituri' : gituri, 
                 'branch' : branch, 
                 'cmake_opt' : cmake_opt,
                 }

        # checkout
        if branch != 'master':
            s += """%(alpha_name)s_checkout:
\tcd ${SRC_ROOT}; git clone --recursive %(gituri)s; \\
\tcd ${SRC_ROOT}/%(name)s; \\
\tgit checkout -b %(branch)s origin/%(branch)s
"""%subs
        else:
            s += """%(alpha_name)s_checkout:
\tcd ${SRC_ROOT}; git clone --recursive %(gituri)s
"""%subs

        # pull
        s += """%(alpha_name)s_pull:
\tcd ${SRC_ROOT}/%(name)s/  && git pull && git submodule update
"""%subs

        # configure
        s += """%(alpha_name)s_configure:
\tmkdir -p ${BUILD_ROOT}/%(name)s/_build
\tcd ${BUILD_ROOT}/%(name)s/_build && cmake %(cmake_opt)s ${SRC_ROOT}/%(name)s
"""%subs

        # clean
        s += """%(alpha_name)s_clean:
\tcd ${BUILD_ROOT}/%(name)s/_build && make clean
"""%subs

        # info
        s += """%(alpha_name)s_info:
\tcd ${SRC_ROOT}/%(name)s/ &&\\
    branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \\(.*\)/\\1/'`;\\
    commit=`git rev-parse HEAD` ;\\
    diff=0;\\
    head_orig=`git rev-list ^HEAD origin/$$branch | wc -l`;\\
    if [ $$head_orig -gt 0 ]; then\\
        diff=-$$head_orig ;\\
    else\\
        orig_head=`git rev-list ^origin/$$branch HEAD | wc -l`;\\
        if [ $$head_orig -gt 0 ]; then\\
            diff=+$$head_orig ;\\
        fi;\\
    fi;\\
    printf "%%-25s %%-15s %%s %%s\\n" %(name)s $$branch $$commit $$diff
"""%subs


        # very_clean
        s += """%(alpha_name)s_very_clean:
\tcd ${BUILD_ROOT}/%(name)s/_build && rm -rf *
"""%subs

        # update
        s += """%(alpha_name)s_update:
\tcd ${SRC_ROOT}/%(name)s; git diff --quiet %(branch)s origin/%(branch)s -- || \\
\t(git pull && cd ${BUILD_ROOT}/%(name)s/_build && make install)
"""%subs
        s += 1*"\n"

    f = open(options.output,"w")
    f.write(s)
    f.close()



if __name__ == '__main__':
    main()
