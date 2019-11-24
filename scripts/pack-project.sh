#!/bin/bash

DEST_DIR="../TEST"

find . \( -name "*.odt" -o -name "*.ott" -o -name "*.ods" -o -path "./.git" \) -prune -o -type d -exec mkdir -pv ${DEST_DIR}/{} ';'

for f in ` find . \( -name "*.odt" -o -name "*.ott" -o -name "*.ods" -o -path "./.git" \) -prune -o -type f -print `
do
  DESTPATH=${DEST_DIR}` echo ${f} | sed -e 's/^\.//g'`
  cp ${f} ${DESTPATH}
done


for f in ` find . \( -name "*.odt" -o -name "*.ott" -o -name "*.ods" \) -a -type d -print `
do
  DESTPATH=${DEST_DIR}` echo ${f} | sed -e 's/^\.//g'`
  pushd ${f}
  zip -0X "temp.zip" "mimetype"
  zip -Xr9 "temp.zip" * --exclude "temp.zip" --exclude "mimetype"
  popd
  mv "${f}/temp.zip" ${DESTPATH}
done
