# Compilation of SOT

ROOT                 = 	/home/nddang/src/sotpy
GITJRL               = 	ssh://git@github.com/jrl-umi3218
GITLAAS              = 	ssh://git@github.com/laas
INSTALL_PREFIX       =	/local/nddang/profiles/sotpy/install/unstable
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
	sot_dynamic_configure sot_dynamic \
	sot_openhrp_configure sot_openhrp \
	dynamic_graph_tutorial_configure dynamic_graph_tutorial

jrl_mal:
	mkdir -p ${ROOT}/jrl-mal/_build;\
	cd ${ROOT}/jrl-mal/_build; make install

jrl_mathtools:
	cd ${ROOT}/jrl-mathtools/_build;\
	cd ${ROOT}/jrl-mathtools/_build; make install

hpp_template_corba:
	cd ${ROOT}/hpp-template-corba/_build;\
	cd ${ROOT}/hpp-template-corba/_build; make install

dynamic_graph:
	cd ${ROOT}/dynamic-graph/_build;\
	cd ${ROOT}/dynamic-graph/_build; make install

dynamic_graph_python:
	cd ${ROOT}/dynamic-graph-python/_build;\
	cd ${ROOT}/dynamic-graph-python/_build; make install

dynamic_graph_corba:
	cd ${ROOT}/dynamic-graph-corba/_build;\
	cd ${ROOT}/dynamic-graph-corba/_build; make install

sot_core:
	cd ${ROOT}/sot-core/_build;\
	cd ${ROOT}/sot-core/_build; make install

sot_dynamic:
	cd ${ROOT}/sot-dynamic/_build; make install

sot_openhrp:
	cd ${ROOT}/sot-openhrp/_build; make install

dynamic_graph_tutorial:
	cd ${ROOT}/dynamic-graph-tutorial/_build; make install


checkout: jrl_mal_checkout jrl_mathtools_checkout			\
	hpp_template_corba_checkout dynamic_graph_checkout		\
	dynamic_graph_python_checkout dynamic_graph_corba_checkout	\
	sot_core_checkout sot_dynamic_checkout sot_openhrp_checkout	\
	dynamic_graph_tutorial_checkout

jrl_mal_checkout:
	cd ${ROOT}; git clone --recursive ${GITJRL}/jrl-mal
	cd ${ROOT}/jrl-mal; git checkout -b topic/python origin/topic/python

jrl_mathtools_checkout:
	cd ${ROOT}; git clone --recursive ${GITJRL}/jrl-mathtools;

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


clean: hpp_template_corba_clean \
	dynamic_graph_clean dynamic_graph_python_clean \
	dynamic_graph_corba_clean sot_core_clean \
	sot_openhrp_clean \
	sot_dynamic_clean dynamic_graph_tutorial_clean

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

sot_dynamic_clean:
	cd ${ROOT}/sot-dynamic/_build; make clean

sot_openhrp_clean:
	cd ${ROOT}/sot-openhrp/_build; make clean

dynamic_graph_tutorial_clean:
	cd ${ROOT}/dynamic-graph-tutorial/_build; make clean

very_clean: hpp_template_corba_very_clean \
	dynamic_graph_very_clean dynamic_graph_python_very_clean \
	dynamic_graph_corba_very_clean \
	sot_core_very_clean sot_dynamic_very_clean \
	sot_openhrp_very_clean \
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

sot_dynamic_very_clean:
	cd ${ROOT}/sot-dynamic/_build; rm -rf *

sot_openhrp_very_clean:
	cd ${ROOT}/sot-openhrp/_build; rm -rf *

dynamic_graph_tutorial_very_clean:
	cd ${ROOT}/dynamic-graph-tutorial/_build; rm -rf *

configure: hpp_template_corba_configure \
	dynamic_graph_configure dynamic_graph_python_configure \
	dynamic_graph_corba_configure \
	sot_core_configure sot_dynamic_configure \
	sot_openhrp_configure \
	dynamic_graph_tutorial_configure

jrl_mal_configure:
	mkdir -p ${ROOT}/jrl-mal/_build
	cd ${ROOT}/jrl-mal/_build; cmake ${COMMON_CMAKE_OPTS} -DSMALLMATRIX=jrl-mathtools  ..

jrl_mathtools_configure:
	mkdir -p ${ROOT}/jrl-mathtools/_build
	cd ${ROOT}/jrl-mathtools/_build; cmake cmake  ..

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

sot_dynamic_configure:
	mkdir -p ${ROOT}/sot-dynamic/_build
	cd ${ROOT}/sot-dynamic/_build; cmake ${COMMON_CMAKE_OPTS} -DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99 ..

sot_openhrp_configure:
	mkdir -p ${ROOT}/sot-openhrp/_build
	cd ${ROOT}/sot-openhrp/_build; cmake ${COMMON_CMAKE_OPTS} -DOPENHRP3_HOME=${DEVEL_DIR}/stable/OpenHRP -DCMAKE_VERBOSITY_LEVEL=100 -DPROJECT_VERSION=1.99 ..

dynamic_graph_tutorial_configure:
	mkdir -p ${ROOT}/dynamic-graph-tutorial/_build
	cd ${ROOT}/dynamic-graph-tutorial/_build; cmake ${COMMON_CMAKE_OPTS} -DPROJECT_VERSION=1.99 ..
