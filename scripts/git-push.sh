#!/bin/bash

TIMESTAMP=`date +%Y%m%d_%H%M%S`
EXTRACT_DIR="./.git_repo"

find -L . \( -path "${EXTRACT_DIR}" -o -path "./database/temp" -o -path "./TEST" \) -prune -o -type d -exec mkdir -pv ${EXTRACT_DIR}/{} ';'

for f in ` find -L . \( -path "${EXTRACT_DIR}" -o -path "./database/temp" -o -path "./TEST" -o -name ".~lock.*" \) -prune -o -type f -print `
do

DESTPATH=${EXTRACT_DIR}` echo ${f} | sed -e 's/^\.//g'`

  case ` file ${f} | cut -d: -f2 | sed -e 's/^[[:space:]]*//' ` in
    "OpenDocument Text" | "OpenDocument Text Template" | "OpenDocument Spreadsheet")
      unzip -o -qq ${f} -d ${DESTPATH}

      for g in ` find ${DESTPATH} -type f -name "content.xml" -o -name "meta.xml" -o -name "settings.xml" -o -name "styles.xml" `
      do
        mv ${g} "${g}_"
        xmllint --format "${g}_" > ${g}
        rm "${g}_"
      done

      ;;
    *)
      cp ${f} ${DESTPATH}
      ;;
  esac

done

pushd ${EXTRACT_DIR}
  git add *
  git commit
echo "******** push lokal **********"
  git push origin master
echo "******** push github *********"
  git push aladin master
popd
