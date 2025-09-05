#!/bin/bash
if [ "$#" -ne "1" ] || [ "$1" = "-h" -o "$1" = "-H" -o -z "${1#\-[hH][eE][lL][pP]}" ]; then
        cat << EOF
Usage:
     ${0} <Pfad zu XRechnung XML-Datei mit den Rechnungsdaten>
EOF
    exit 0
fi

# java Programmm
JAVA=$(which java);
# Valiator von hier: https://github.com/itplr-kosit/validator
# Pfad zum Speicherort anpassen, evtl. Link anlegen oder umbenennen
VALIDATOR="/usr/local/lib/validator/validator.jar";
# Scenarios von hier: https://github.com/itplr-kosit/validator-configuration-xrechnung
# Pfad zum Speicherort anpassen
SCENARIOS="/usr/local/lib/validator/scenarios.xml";
# Repository von hier: https://github.com/itplr-kosit/xrechnung-schematron
# Pfad zum Speicherort anpassen
REPOSITORY="/usr/local/lib/validator";
# Die zu testende XML-Datei wird als Parameter übergeben und daraus der Speicherpfad extrahiert
TESTFILE=${1};
# Die Berichte werden in dem Verzeichnis abgelegt, in dem die zu testende XML-Datei liegt
OUTPUT_DIR=$(dirname ${TESTFILE});
# Der Return-Code wird in dem Verzeichnis abgelegt, in dem die zu testende XML-Datei liegt
# Dieser kann dann vom aufrufenden Programm ausgewertet werden
RETURNCODE_FILE=$(echo ${TESTFILE} | sed 's/.xml$/-returncode.txt/g')

if ! [ -d ${OUTPUT_DIR} ]; then
  mkdir -p ${OUTPUT_DIR};
fi

rm -f ${RETURNCODE_FILE};

${JAVA} -jar ${VALIDATOR} -s ${SCENARIOS} -r ${REPOSITORY} -h -o ${OUTPUT_DIR} ${TESTFILE};

echo $? > ${RETURNCODE_FILE};
