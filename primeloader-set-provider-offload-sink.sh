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

NL="
"

provider_discrete_id=$(xrandr --listproviders | grep -i "${1}" | awk '{ print $4 }')
printf "Video card provider ID (discrete): ${provider_discrete_id}${NL}"

provider_integrated_id=$(xrandr --listproviders | grep -i "${2}" | awk '{ print $4 }')
printf "Video card provider ID (integrated): ${provider_integrated_id}${NL}"

xrandr --setprovideroffloadsink "${provider_discrete_id}" "${provider_integrated_id}"
