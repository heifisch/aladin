#!/bin/bash
if [ "$#" -ne "1" ] || [ "$1" = "-h" -o "$1" = "-H" -o -z "${1#\-[hH][eE][lL][pP]}" ]; then
        cat << EOF
Usage:
     ${0} [Pfad zur Datei dessen Schreibschutz gesetzt werden soll]
EOF
    exit 0
fi

TIMESTAMP=`date +%Y%m%d_%H%M%S`
DESTPATH="/tmp/${TIMESTAMP}/${1}"

mkdir -pv ${DESTPATH}
unzip -o -qq ${1} -d ${DESTPATH}

pushd ${DESTPATH}

mv "settings.xml" "settings.xml_"
xmllint --format "settings.xml_" > "settings.xml"
rm "settings.xml_"

sed 's/"LoadReadonly" config:type="boolean">false</"LoadReadonly" config:type="boolean">true</g' "settings.xml" -i

zip -0X "temp.zip" "mimetype"
zip -Xr9 "temp.zip" * --exclude "temp.zip" --exclude "mimetype"

popd

cp "${DESTPATH}/temp.zip" "${1}"

rm -R "/tmp/${TIMESTAMP}"
