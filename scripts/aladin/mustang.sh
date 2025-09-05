#!/bin/bash
#set -x
if [ "$#" -ne "1" ] || [ "$1" = "-h" -o "$1" = "-H" -o -z "${1#\-[hH][eE][lL][pP]}" ]; then
        cat << EOF
Usage:
     ${0} <Pfad zu XML- oder PDF-Datei mit den Rechnungsdaten>
EOF
    exit 0
fi

# java Programmm
JAVA=$(which java);
# Mustang von hier: https://github.com/ZUGFeRD/mustangproject
# Pfad zum Speicherort anpassen, evtl. Link anlegen oder umbenennen
MUSTANG="/usr/local/lib/mustang/Mustang.jar";
# Ist die Datei, die als Parameter angegeben wird eine XML-Datei, wird eine Validierung durchgeführt
# Der Bericht, wird in dem Verzeichnis abgelegt, in dem die Datei liegt. (${OUTPUT_DIR})
# Ist die Datei, die als Parameter angegeben wird, eine PDF-Datei, dann wird die XML-Datei angehangen
# und in dem Verzeichnis abgelegt, in der die PDF-Datei liegt
FILE=${1};
# Der Validierungs Bericht wird in dem Verzeichnis abgelegt, in dem die XML-Dateie oder die PDF-Datei liegt
OUTPUT_DIR=$(dirname ${FILE});
# Ermittelt den Mime-Type von der Datei, die als Parameter angegeben wurde (text/xml oder application/pdf)
# Davon abhängig ist, welche Aktion durchgeführt wird.
MIMETYPE=$(file --mime-type -b ${FILE})
# Der Return-Code wird in dem Verzeichnis abgelegt, in dem die XML-Datei oder PDF-Datei liegt.
# Dieser kann dann vom aufrufenden Programm ausgewertet werden
RETURNCODE_FILE=$(echo ${FILE} | sed 's/.xml$\|.pdf$/-returncode.txt/g')
# ZUGFeRD Datei-Namen aus Parameter erzeugen
# Wichtig, die Dateien müssen mit den vorgegebenen Namen erstellt werden, damit man mit nur einen Parameer auskommt!
ZUGFERD_XMLFILE=$(echo ${FILE} | sed 's/.pdf$/_ZUGFeRD.xml/g')
ZUGFERD_PDFFILE=$(echo ${FILE} | sed 's/.pdf$/_ZUGFeRD.pdf/g')

if ! [ -d ${OUTPUT_DIR} ]; then
  mkdir -p ${OUTPUT_DIR};
fi

pushd ${OUTPUT_DIR};

rm -f ${RETURNCODE_FILE};

if [ -f ${FILE} ]; then
  case "${MIMETYPE}" in
    "text/xml")
      ${JAVA} -jar ${MUSTANG} --action validate --source ${FILE} --log-as-pdf;
      echo $? > ${RETURNCODE_FILE};
    ;;
    "application/pdf")
      if [ -f ${ZUGFERD_XMLFILE} ]; then
        ${JAVA} -jar ${MUSTANG} --action combine --source ${FILE} --source-xml ${ZUGFERD_XMLFILE} --format zf --version 2 --profile X --out ${ZUGFERD_PDFFILE} --no-additional-attachments;
        echo $? > ${RETURNCODE_FILE};
        RETURNCODE=$(cat ${RETURNCODE_FILE});
        if [ ${RETURNCODE} -eq 0 ]; then
          ${JAVA} -jar ${MUSTANG} --action validate --source ${ZUGFERD_PDFFILE} --log-as-pdf;
          echo $? > ${RETURNCODE_FILE};
        fi
      else
        echo "8888 XML-Datei zum Kombinieren liegt nicht vor" > ${RETURNCODE_FILE};
      fi
    ;;
    *)
      echo "9999 Falscher Datei-Typ in Parameter-Übergabe" > ${RETURNCODE_FILE};
    ;;
  esac
else
  echo "7777 Datei aus Parameter-Übergabe existiert nicht" > ${RETURNCODE_FILE};
fi

popd;

