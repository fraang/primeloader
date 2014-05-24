#!/usr/bin/env sh

# The MIT License (MIT)
# 
# Copyright (c) 2014 Florian R. A. Angermeier
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# The spec for the desktop entries can be found here:
# http://www.freedesktop.org/wiki/Specifications/desktop-entry-spec/

# The spec for the menu can be found here:
# http://www.freedesktop.org/wiki/Specifications/menu-spec/

TAB="   "
NL="
"
BLD="\e[1m"
RST="\e[0m"
FGBLU="\e[34m"
FGGRN="\e[32m"

if [[ -n ${XDG_DATA_HOME} ]]; then
	PRIMELOADER_APP_DIR="${XDG_DATA_HOME}/applications"
else
	PRIMELOADER_APP_DIR="${HOME}/.local/share/applications"
fi

PRIMELOADER_DESKTOP_FILE_PATH=$(printf "${PRIMELOADER_APP_DIR}/${1}.desktop" | tr "[:upper:]" "[:lower:]")
printf " ${BLD}${FGGRN}*${RST} File path: ${PRIMELOADER_DESKTOP_FILE_PATH}${NL}"
printf " ${BLD}${FGGRN}*${RST} The desktop entry file is being written... "

printf "[Desktop Entry]${NL}" > ${PRIMELOADER_DESKTOP_FILE_PATH}
printf "Type=Application${NL}" >> ${PRIMELOADER_DESKTOP_FILE_PATH}
printf "Name=${1}${NL}" >> ${PRIMELOADER_DESKTOP_FILE_PATH}
printf "GenericName=${2}${NL}" >> ${PRIMELOADER_DESKTOP_FILE_PATH}
printf "Comment=${3}${NL}" >> ${PRIMELOADER_DESKTOP_FILE_PATH}
printf "Icon=${4}${NL}" >> ${PRIMELOADER_DESKTOP_FILE_PATH}
printf "Exec=env pl load ${5}${NL}" >> ${PRIMELOADER_DESKTOP_FILE_PATH}
printf "Path=${6}${NL}" >> ${PRIMELOADER_DESKTOP_FILE_PATH}
printf "Keywords=${7}${NL}" >> ${PRIMELOADER_DESKTOP_FILE_PATH}
printf "Categories=${8}${NL}" >> ${PRIMELOADER_DESKTOP_FILE_PATH}

printf "${BLD}${FGBLU}[ ${FGGRN}Done ${FGBLU}]${RST}${NL}"
