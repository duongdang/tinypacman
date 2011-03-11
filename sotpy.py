
global_vars = { 'ROOT': '',
                'GITJRL':'ssh://git@github.com/jrl-umi3218',
                'GITLAAS':'ssh://git@github.com/laas',
                'GITSOFTS':'ssh://softs.laas.fr/git/jrl/',
                'INSTALL_PREFIX': '',
                'OPENHRP3_HOME':'',
                'BOOST_ROOT':'',
                }

cmake_opts = { ".*" : "-DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} "+
               "-DBOOST_ROOT=${BOOST_ROOT} -DCMAKE_BUILD_TYPE=Debug",
               "sot-.*": "-DPROJECT_VERSION=1.99",
               "dynamic-graph*": "-DPROJECT_VERSION=1.99",
               "sot-openhrp":"-DOPENHRP3_HOME=${OPENHRP3_HOME} -DOPENHRP_HOME=${OPENHRP3_HOME} -DHRP_ROBOT_SPEC=HRP2LAAS",
               "jrl-mal" : "-DSMALLMATRIX=jrl-mathtools"
               }

pkgs = [ ('jrl-mathtools',            '${GITJRL}',         'master'),
         ('jrl-mal' ,                 '${GITJRL}',         'topic/python'),
         ('hpp-template-corba',       '${GITLAAS}',        'master'),
         ('dynamic-graph',            '${GITJRL}',         'topic/proto-command'),
         ('dynamic-graph-python',     '${GITJRL}',         'topic/jrl-mal'),
         ('dynamic-graph-corba',      '${GITLAAS}',        'master'),
         ('sot-core',                 '${GITJRL}',         'topic/python'),
         ('abstract-robot-dynamics',  '${GITLAAS}',        'master'),
         ('jrl-dynamics',             '${GITJRL}',         'master'),
         ('hrp2Dynamics',             '${GITSOFTS}',       'master'),
         ('hrp2_10',                  '${GITSOFTS}',       'topic/python'),
         ('hrp2-10-optimized',        '${GITSOFTS}/robots','master'),
         ('hrp2_14',                  '${GITSOFTS}',       'master'),
         ('sot-dynamic',              '${GITJRL}',         'topic/python'),
         ('sot-openhrp',              '${GITJRL}',         'topic/python'),
         ('sot-motion-planner',       'git://github.com/thomas-moulard/', 'master'),
#         ('dynamic-graph-tutorial' ,  '${GITJRL}',         'master'),
         ]
