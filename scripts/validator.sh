#!/bin/bash

JAVA=$(which java);
VALIDATOR="/usr/local/lib/validator/validator.jar";
SCENARIOS="/usr/local/lib/validator/scenarios.xml";
REPOSITORY="/usr/local/lib/validator";
TESTFILE=${1};
OUTPUT_DIR=$(dirname ${TESTFILE});
RETURNCODE_FILE=$(echo ${TESTFILE} | sed 's/.xml$/-returncode.txt/g')

if [ -f ${TESTFILE} ]; then
  if ! [ -d ${OUTPUT_DIR} ]; then
    mkdir -p ${OUTPUT_DIR};
  fi

  rm -f ${RETURNCODE_FILE};

  ${JAVA} -jar ${VALIDATOR} -s ${SCENARIOS} -r ${REPOSITORY} -h -o ${OUTPUT_DIR} ${TESTFILE};

  echo $? > ${RETURNCODE_FILE};
fi
