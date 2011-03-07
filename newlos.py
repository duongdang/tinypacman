
global_vars = { 'ROOT': '',
                'GITJRL':'ssh://git@github.com/jrl-umi3218',
                'GITLAAS':'ssh://git@github.com/laas',
                'GITSOFTS':'ssh://softs.laas.fr/git/jrl/',
                'GITLOCAL':'file:///home/nddang/git',
                'INSTALL_PREFIX': '',
                'OPENHRP3_HOME':'',
                'BOOST_ROOT':'',
                }

cmake_opts = { ".*" : "-DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} "+
               "-DBOOST_ROOT=${BOOST_ROOT} -DCMAKE_BUILD_TYPE=Debug",
               "sot-.*": "-DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99",
               "dynamic-graph*": "-DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99",
               "jrl-mal" : "-DSMALLMATRIX=jrl-mathtools"
               }

autotools_opts = { ".*":"--prefix=${INSTALL_PREFIX}"}

pkgs = [  #('jrl-mathtools',            '${GITJRL}',         'master'),
          #('jrl-mal' ,                 '${GITJRL}',         'master'),
          #('abstract-robot-dynamics',  '${GITLAAS}',        'master'),          
          #('hrp2Dynamics',             '${GITSOFTS}',       'master'),
          #('jrl-dynamics',             '${GITJRL}',         'master'),
          ('hpp-template-corba',       '${GITLAAS}',        'master'),
          ('jrlCIR-giktask',           '${GITSOFTS}',       'master','autotools'),
          ('hpp-gik',                  '${GITLAAS}',  'master','cmake'),
          ('hpp-hik',                  '${GITSOFTS}/algo',  'master','autotools'),
          ('hpp-localstepper',         '${GITSOFTS}/algo',  'master','autotools'),
          ('hpp-los-server',           '${GITLOCAL}',       'master','autotools'),
          ('hpp-los-client',           '${GITLOCAL}',       'master','autotools'),
         ]
