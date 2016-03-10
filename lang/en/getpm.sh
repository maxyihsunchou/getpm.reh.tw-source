#!/bin/bash

#Needed to use aliases
shopt -s expand_aliases
type wget > /dev/null 2>&1
if [ $? -eq 0 ]; then
	if [ "$IGNORE_CERT" == "yes" ]; then
		alias download_file="wget --no-check-certificate -q -O -"
	else
		alias download_file="wget -q -O -"
	fi
else
	type curl >> /dev/null 2>&1
	if [ $? -eq 0 ]; then
		if [ "$IGNORE_CERT" == "yes" ]; then
			alias download_file="curl --insecure --silent --location"
		else
			alias download_file="curl --silent --location"
		fi
	else
		echo "error, curl or wget not found"
	fi
fi

echo "Downloading select-core.sh..."
download_file "http://getpm.reh.tw/lang/en/select-core.sh" > select-core.sh
chmod +x select-core.sh

echo "[*] Done! Run ./select-core.sh"