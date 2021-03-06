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
		echo "錯誤，curl 或 wget 未發現"
	fi
fi

echo "下載 select-core.sh..."
download_file "http://getpm.reh.tw/lang/zh-TW/select-core.sh" > select-core.sh
chmod +x select-core.sh

echo "[*] 完成! 執行 ./select-core.sh"