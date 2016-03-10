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
		echo "错误，curl 或 wget 未发现"
	fi
fi

echo "下载 select-core.sh..."
download_file "http://getpm.reh.tw/lang/zh-CN/select-core.sh" > select-core.sh
chmod +x select-core.sh

echo "[*] 完成! 执行 ./select-core.sh"