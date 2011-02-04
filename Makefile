# Compilation of SOT

ROOT                 = 	/home/nddang/src/sotpy
GITJRL               = 	ssh://git@github.com/jrl-umi3218
GITLAAS              = 	ssh://git@github.com/laas
GITSOFTS             =  ssh://softs.laas.fr/git/jrl/
INSTALL_PREFIX       =	/local/nddang/profiles/sotpy/install/unstable
OPENHRP3_HOME        =  /local/nddang/profiles/sotpy/install/stable/OpenHRP
BOOST_ROOT           =  /local/nddang/profiles/sotpy/install/stable
COMMON_CMAKE_OPTS    =  -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DBOOST_ROOT=${BOOST_ROOT} -DCMAKE_BUILD_TYPE=Debug

all: hpp_template_corba dynamic_graph dynamic_graph_python sot_core \
	sot_dynamic dynamic_graph_tutorial

build_all: \
	jrl_mathtools_configure jrl_mathtools \
	jrl_mal_configure jrl_mal \
	hpp_template_corba_configure hpp_template_corba \
	dynamic_graph_configure dynamic_graph \
	dynamic_graph_python_configure dynamic_graph_python \
	dynamic_graph_corba_configure dynamic_graph_corba \
	sot_core_configure sot_core \
	abstract_robot_dynamic_configure abstract_robot_dynamic \
	jrl_dynamic_configure jrl_dynamic \
	hrp2_dynamic_configure hrp2_dynamic \
	hrp2_10_configure hrp2_10 \
	hrp2_10_optimized_configure hrp2_10_optimized \
	hrp2_14_configure hrp2_14 \
	sot_dynamic_configure sot_dynamic \
	sot_openhrp_configure sot_openhrp \
	dynamic_graph_tutorial_configure dynamic_graph_tutorial

jrl_mal:
	cd ${ROOT}/jrl-mal/_build; make install

jrl_mathtools:
	cd ${ROOT}/jrl-mathtools/_build; make install

hpp_template_corba:
	cd ${ROOT}/hpp-template-corba/_build; make install

dynamic_graph:
	cd ${ROOT}/dynamic-graph/_build; make install

dynamic_graph_python:
	cd ${ROOT}/dynamic-graph-python/_build; make install

dynamic_graph_corba:
	cd ${ROOT}/dynamic-graph-corba/_build; make install

sot_core:
	cd ${ROOT}/sot-core/_build; make install

abstract_robot_dynamic:
	cd ${ROOT}/abstract-robot-dynamics/_build; make install


jrl_dynamic:
	cd ${ROOT}/jrl-dynamics/_build; make install


hrp2_dynamic:
	cd ${ROOT}/hrp2Dynamics/_build; make install

hrp2_10:
	cd ${ROOT}/hrp2_10/_build; make install

hrp2_10_optimized:
	cd ${ROOT}/hrp2-10-optimized/_build; make install

hrp2_14:
	cd ${ROOT}/hrp2_14/_build; make install

sot_dynamic:
	cd ${ROOT}/sot-dynamic/_build; make install

sot_openhrp:
	cd ${ROOT}/sot-openhrp/_build; make install

dynamic_graph_tutorial:
	cd ${ROOT}/dynamic-graph-tutorial/_build; make install


checkout: jrl_mal_checkout jrl_mathtools_checkout			\
	hpp_template_corba_checkout dynamic_graph_checkout		\
	dynamic_graph_python_checkout dynamic_graph_corba_checkout	\
	sot_core_checkout hrp2_dynamic_checkout jrl_dynamic_checkout    \
	abstract_robot_dynamic_checkout hrp2_10_checkout hrp2_14_checkout\
	hrp2_10_optimized_checkout sot_dynamic_checkout sot_openhrp_checkout\
	dynamic_graph_tutorial_checkout

jrl_mal_checkout:
	cd ${ROOT}; git clone --recursive ${GITJRL}/jrl-mal

jrl_mathtools_checkout:
	cd ${ROOT}; git clone --recursive ${GITJRL}/jrl-mathtools

hpp_template_corba_checkout:
	cd ${ROOT}; git clone --recursive ${GITLAAS}/hpp-template-corba

dynamic_graph_checkout:
	cd ${ROOT}; git clone --recursive ${GITJRL}/dynamic-graph; \
	cd ${ROOT}/dynamic-graph; \
	git checkout -b topic/proto-command origin/topic/proto-command

dynamic_graph_python_checkout:
	cd ${ROOT}; git clone --recursive ${GITJRL}/dynamic-graph-python; \
	cd ${ROOT}/dynamic-graph-python; \
	git checkout -b topic/jrl-mal origin/topic/jrl-mal

dynamic_graph_corba_checkout:
	cd ${ROOT}; git clone --recursive ${GITLAAS}/dynamic-graph-corba

sot_core_checkout:
	cd ${ROOT}; git clone --recursive ${GITJRL}/sot-core; \
	cd ${ROOT}/sot-core; \
	git checkout -b topic/python origin/topic/python

abstract_robot_dynamic_checkout:
	cd ${ROOT}; git clone --recursive ${GITLAAS}/abstract-robot-dynamics

jrl_dynamic_checkout:
	cd ${ROOT}; git clone --recursive ${GITJRL}/jrl-dynamics

hrp2_dynamic_checkout:
	cd ${ROOT}; git clone --recursive ${GITSOFTS}/hrp2Dynamics


hrp2_10_checkout:
	cd ${ROOT}; git clone --recursive ${GITSOFTS}/hrp2_10

hrp2_10_optimized_checkout:
	cd ${ROOT}; git clone --recursive ${GITSOFTS}/robots/hrp2-10-optimized

hrp2_14_checkout:
	cd ${ROOT}; git clone --recursive ${GITSOFTS}/hrp2_14

sot_dynamic_checkout:
	cd ${ROOT}; git clone --recursive ${GITJRL}/sot-dynamic; \
	cd ${ROOT}/sot-dynamic; \
	git checkout -b topic/python origin/topic/python

sot_openhrp_checkout:
	cd ${ROOT}; git clone --recursive ${GITJRL}/sot-openhrp; \
	cd ${ROOT}/sot-openhrp; \
	git checkout -b topic/python origin/topic/python

dynamic_graph_tutorial_checkout:
	cd ${ROOT}; git clone --recursive ${GITJRL}/dynamic-graph-tutorial

clean: jrl_mal_clean jrl_mathtools_clean			\
	hpp_template_corba_clean dynamic_graph_clean		\
	dynamic_graph_python_clean dynamic_graph_corba_clean	\
	sot_core_clean hrp2_dynamic_clean jrl_dynamic_clean    \
	abstract_robot_dynamic sot_dynamic_clean sot_openhrp_clean\
	dynamic_graph_tutorial_clean


jrl_mal_clean:
	cd ${ROOT}/jrl-mal/_build; make clean

jrl_mathtools_clean:
	cd ${ROOT}/jrl-mathtools/_build; make clean

hpp_template_corba_clean:
	cd ${ROOT}/hpp-template-corba/_build; make clean

dynamic_graph_clean:
	cd ${ROOT}/dynamic-graph/_build; make clean

dynamic_graph_python_clean:
	cd ${ROOT}/dynamic-graph-python/_build; make clean

dynamic_graph_corba_clean:
	cd ${ROOT}/dynamic-graph-corba/_build; make clean

sot_core_clean:
	cd ${ROOT}/sot-core/_build; make clean

hrp2_dynamic_clean:
	cd ${ROOT}/hrp2Dynamics/_build; make clean

hrp2_10_clean:
	cd ${ROOT}/hrp2_10/_build; make clean

hrp2_10_optimized_clean:
	cd ${ROOT}/hrp2-10-optmized/_build; make clean

hrp2_14_clean:
	cd ${ROOT}/hrp2_14/_build; make clean

sot_dynamic_clean:
	cd ${ROOT}/sot-dynamic/_build; make clean

abstract_robot_dynamic_clean:
	cd ${ROOT}/jrl-dynamics/_build; make clean

jrl_dynamic_clean:
	cd ${ROOT}/abstract-robot-dynamics/_build; make clean

sot_openhrp_clean:
	cd ${ROOT}/sot-openhrp/_build; make clean

dynamic_graph_tutorial_clean:
	cd ${ROOT}/dynamic-graph-tutorial/_build; make clean

very_clean: jrl_mal_very_clean jrl_mathtools_very_clean			\
	hpp_template_corba_very_clean dynamic_graph_very_clean		\
	dynamic_graph_python_very_clean dynamic_graph_corba_very_clean	\
	sot_core_very_clean hrp2_dynamic_very_clean jrl_dynamic_very_clean    \
	abstract_robot_dynamic sot_dynamic_very_clean sot_openhrp_very_clean\
	dynamic_graph_tutorial_very_clean

jrl_mal_very_clean:
	cd ${ROOT}/jrl-mal/_build; rm -rf *

jrl_mathtools_very_clean:
	cd ${ROOT}/jrl-mathtools/_build; rm -rf *

hpp_template_corba_very_clean:
	cd ${ROOT}/hpp-template-corba/_build; rm -rf *

dynamic_graph_very_clean:
	cd ${ROOT}/dynamic-graph/_build; rm -rf *

dynamic_graph_python_very_clean:
	cd ${ROOT}/dynamic-graph-python/_build; rm -rf *

dynamic_graph_corba_very_clean:
	cd ${ROOT}/dynamic-graph-corba/_build; rm -rf *

sot_core_very_clean:
	cd ${ROOT}/sot-core/_build; rm -rf *

hrp2_dynamic_very_clean:
	cd ${ROOT}/hrp2Dynamics/_build; rm -rf *

hrp2_10_very_clean:
	cd ${ROOT}/sot-dynamic/_build; rm -rf *

abstract_robot_dynamic_very_clean:
	cd ${ROOT}/abstract-robot-dynamics/_build; rm -rf *

jrl_dynamic_very_clean:
	cd ${ROOT}/jrl-dynamics/_build; rm -rf *

sot_dynamic_very_clean:
	cd ${ROOT}/sot-dynamic/_build; rm -rf *

sot_openhrp_very_clean:
	cd ${ROOT}/sot-openhrp/_build; rm -rf *

dynamic_graph_tutorial_very_clean:
	cd ${ROOT}/dynamic-graph-tutorial/_build; rm -rf *

configure: hpp_template_corba_configure \
	dynamic_graph_configure dynamic_graph_python_configure \
	dynamic_graph_corba_configure \
	sot_core_configure hrp2_dynamic_configure sot_dynamic_configure \
	sot_openhrp_configure \
	dynamic_graph_tutorial_configure

jrl_mal_configure:
	mkdir -p ${ROOT}/jrl-mal/_build
	cd ${ROOT}/jrl-mal/_build; cmake ${COMMON_CMAKE_OPTS} -DSMALLMATRIX=jrl-mathtools  ..

jrl_mathtools_configure:
	mkdir -p ${ROOT}/jrl-mathtools/_build
	cd ${ROOT}/jrl-mathtools/_build; cmake ${COMMON_CMAKE_OPTS} ..

hpp_template_corba_configure:
	mkdir -p ${ROOT}/hpp-template-corba/_build
	cd ${ROOT}/hpp-template-corba/_build; cmake ${COMMON_CMAKE_OPTS} ..

dynamic_graph_configure:
	mkdir -p ${ROOT}/dynamic-graph/_build
	cd ${ROOT}/dynamic-graph/_build; cmake ${COMMON_CMAKE_OPTS}  -DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99 ..

dynamic_graph_python_configure:
	mkdir -p ${ROOT}/dynamic-graph-python/_build
	cd ${ROOT}/dynamic-graph-python/_build; cmake ${COMMON_CMAKE_OPTS}  -DPROJECT_VERSION=1.99 ..

dynamic_graph_corba_configure:
	mkdir -p ${ROOT}/dynamic-graph-corba/_build
	cd ${ROOT}/dynamic-graph-corba/_build; cmake ${COMMON_CMAKE_OPTS} -DPROJECT_VERSION=1.99 ..

sot_core_configure:
	mkdir -p ${ROOT}/sot-core/_build
	cd ${ROOT}/sot-core/_build; cmake ${COMMON_CMAKE_OPTS} -DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99 ..

hrp2_dynamic_configure:
	mkdir -p ${ROOT}/hrp2Dynamics/_build
	cd ${ROOT}/hrp2Dynamics/_build; cmake ${COMMON_CMAKE_OPTS} -DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99 ..

hrp2_10_configure:
	mkdir -p ${ROOT}/hrp2_10/_build
	cd ${ROOT}/hrp2_10/_build; cmake ${COMMON_CMAKE_OPTS} -DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99 ..

hrp2_14_configure:
	mkdir -p ${ROOT}/hrp2_14/_build
	cd ${ROOT}/hrp2_14/_build; cmake ${COMMON_CMAKE_OPTS} -DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99 ..
hrp2_10_optimized_configure:
	mkdir -p ${ROOT}/hrp2-10-optimized/_build
	cd ${ROOT}/hrp2-10-optimized/_build; cmake ${COMMON_CMAKE_OPTS} -DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99 ..


sot_dynamic_configure:
	mkdir -p ${ROOT}/sot-dynamic/_build
	cd ${ROOT}/sot-dynamic/_build; cmake ${COMMON_CMAKE_OPTS} -DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99 ..

abstract_robot_dynamic_configure:
	mkdir -p ${ROOT}/abstract-robot-dynamics/_build
	cd ${ROOT}/abstract-robot-dynamics/_build; cmake ${COMMON_CMAKE_OPTS} -DCMAKE_VERBOSITY_LEVEL=100  ..

jrl_dynamic_configure:
	mkdir -p ${ROOT}/jrl-dynamics/_build
	cd ${ROOT}/jrl-dynamics/_build; cmake ${COMMON_CMAKE_OPTS} -DCMAKE_VERBOSITY_LEVEL=100  ..

sot_openhrp_configure:
	mkdir -p ${ROOT}/sot-openhrp/_build
	cd ${ROOT}/sot-openhrp/_build; cmake ${COMMON_CMAKE_OPTS} -DOPENHRP3_HOME=${OPENHRP3_HOME} -DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99 ..

dynamic_graph_tutorial_configure:
	mkdir -p ${ROOT}/dynamic-graph-tutorial/_build
	cd ${ROOT}/dynamic-graph-tutorial/_build; cmake ${COMMON_CMAKE_OPTS} -DPROJECT_VERSION=1.99 ..
