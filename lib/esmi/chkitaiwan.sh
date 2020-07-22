#!/usr/bin/env bash

# chksml.conf: please ref "chksml.conf-exasmple"
source chkksml.conf

target="iTaiwan"
mywifi=`env LANG=C nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2`

#testcmd='wget -qSO- --max-redirect=0 google.com 2>&1 | grep -i location:'
avaiable=false

if [[ "$mywifi". = "$target". ]]; then

  location=`wget -qSO- --max-redirect=0 google.com 2>&1 | grep -i location:`
  #
  isgoogle=`echo $location | grep -i google`

  if [[ "$isgoogle". = "". ]] ; then
    #available=false
    location1=`echo $location | sed -e 's/Location: //g' -e 's/?.*$//g'`
    #在圖書館： 會到"圖書館重導到itaiwan's " "auth" 網頁
    echo "location: " $location1

    #itaiwan "auth" 網頁 會再重導到 itaiwan的 "/noauth_page.php"

    #在透過 "/noauth_page.php"
    #的 "<form id="myform" name="login_form" onsubmit="return dosubmit(login_form, 'e4a80a105af1aaeef681b2da9199efe1', 'username', 'passwd');" method="post" action="https://wifiagent.ksml.edu.tw/login/F0-7B-CB-4E-56-CE" autocomplete="off">"

    #再透過
    #<input id="username" name="username" type="hidden" value="f07bcb4e56ce@itw">
    #<input id="passwd" name="passwd" type="hidden" value="myegov">
    #<input name="session" type="hidden" value="">
    #<button id="login-button" type="submit" style="margin-top:150px">
    #  我同意&免費上網


    # submit 出去

    # hs_server=`echo $location | sed -e 's/Location: .*?//g' -e 's/&Qv=.*$//g' -e 's/^.*=//g'`
    # Qv=`echo $location | sed -e 's/Location: .*?.*Qv=//g'`


    # f_hs_server=$hs_server
    # f_Qv=$Qv
    # action="http://"$hs_server:$port$cgiUrl
    #
    # post_data="'f_user=$f_user&f_pass=$f_pass&f_hs_server=$f_hs_server&f_Qv=$f_Qv'"
    #
    # #  --save-cookies cookies.txt
    # wget \
    #      --post-data $post_data \
    #      $action 2>&1 > /dev/null

    echo "$target WIFI (建構中....) has been re-connected!"
  else
    echo "$target WIFI is available, location($loaction) is valided!"
    #available=true
    #exit 1
  fi

fi
