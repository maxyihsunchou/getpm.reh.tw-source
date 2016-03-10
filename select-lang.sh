#!/bin/bash


echo "Select language"
echo "（1）English en"
echo "（2）繁體中文 zh-TW"
echo "（3）简体中文 zh-CN"
echo "=========================================="
echo -n "Enter："

read character
case $character in
    1 ) wget -q -O - http://getpm.reh.tw/lang/en/ | bash
        ;;
    2 ) wget -q -O - http://getpm.reh.tw/lang/zh-TW/ | bash
        ;;
	3 ) wget -q -O - http://getpm.reh.tw/lang/zh-CN/ | bash
        ;;
    * ) echo "Please enter the correct number"
        echo "1~3"
esac
