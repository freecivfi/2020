RULESET_NAME=fi2020
BASE_DIR=$(abspath ..)
SRC_DIR=$(abspath ${BASE_DIR}/ruleset)
DATA_FILE=$(abspath ${BASE_DIR}/data.json)

all: build build-subdirs

build: ${RULESET_NAME}.serv

${RULESET_NAME}:
	mkdir ./${RULESET_NAME}

${RULESET_NAME}/Makefile: Makefile ${RULESET_NAME}
	cp -f Makefile ./${RULESET_NAME}/Makefile

build-subdirs: ${RULESET_NAME}/Makefile
	$(MAKE) -C ./${RULESET_NAME} build-ruleset BASE_DIR=${BASE_DIR}

${RULESET_NAME}.serv: ${SRC_DIR}/${RULESET_NAME}.serv
	jinja -d ${DATA_FILE} -o ${RULESET_NAME}.serv ${SRC_DIR}/${RULESET_NAME}.serv

build-ruleset: ai_effects.ruleset buildings.ruleset cities.ruleset effects.ruleset game.ruleset governments.ruleset nationlist.ruleset nations.ruleset styles.ruleset \
               techs.ruleset terrain.ruleset units.ruleset default.lua script.lua

%.ruleset: ${SRC_DIR}/${RULESET_NAME}/%.ruleset
	jinja -d ${DATA_FILE} -o $@ $<

%.lua: ${SRC_DIR}/${RULESET_NAME}/%.lua
	jinja -d ${DATA_FILE} -o $@ $<
