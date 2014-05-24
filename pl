#!/usr/bin/env sh
# Glue script for the different primeloader sub scripts

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

TAB="	"
NL="
"
BLD="\e[1m"
RST="\e[0m"

function display_help {
	printf "${BLD}Usage:${RST}${NL}"
	printf "${TAB}pl action parameter1 [...]${NL}${NL}"
	printf "${BLD}Actions:${RST}${NL}"
	printf "${TAB}l | load${TAB}${TAB}${TAB}Loads a program using the discrete graphics card.${NL}"
	printf "${TAB}s | set-provider-offload-sink${TAB}Sets the offload sink for the discrete graphics card.${NL}"
	printf "${TAB}h | help${TAB}${TAB}${TAB}Displays this help.${NL}${NL}"
	printf "${BLD}Video card providers:${RST}${NL}"
	printf "${TAB}intel | nouveau | nvidia | radeon${NL}${NL}"
	printf "${BLD}Example:${RST}${NL}"
	printf "${TAB}pl set-provider-offload-sink nouveau intel${NL}"
}

case ${1} in
	-h|--help|h|help)
		display_help
		;;
	-l|--load|l|load)
		primeloader-load.sh ${2}
		;;
	-s|--set-provider-offload-sink|s|set-provider-offload-sink)
		primeloader-set-provider-offload-sink.sh ${2} ${3}
		;;
	*)
		if [[ "${#}" -eq 0 ]]; then
			display_help
		else
			primeloader-load.sh ${1}
		fi
		;;
esac
