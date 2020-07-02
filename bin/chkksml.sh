#!/usr/bin/env bash

source chkksml.conf

target="ksml"
mywifi=`env LANG=C nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2`

testcmd='wget -qSO- --max-redirect=0 google.com 2>&1 | grep -i location:'
avaiable=false

if [ $mywifi == $target ]; then
  location=`wget -qSO- --max-redirect=0 google.com 2>&1 | grep -i location:`
  isgoogle=`echo $location | grep -i google`
  if [ $isgoogle. == "". ] ; then
    available=false
  else
    available=true
  fi

  login=`echo $location | sed -e 's/Location: //g' -e 's/?.*$//g'`
  hs_server=`echo $location | sed -e 's/Location: .*?//g' -e 's/&Qv=.*$//g' -e 's/^.*=//g'`
  Qv=`echo $location | sed -e 's/Location: .*?.*Qv=//g'`

  port=880;
  cgiUrl="/cgi-bin/hslogin.cgi"
  postToUrl=":"$port$cgiToUrl;

  f_hs_server=$hs_server
  f_Qv=$Qv
  action="http://"$hs_server$postToUrl

  echo "login:" $login
  echo "hs_server:" $hs_server
  echo "QV:" $Qv
  echo ""
  echo "f_hs_server: " $f_hs_server
  echo "f_Qv: " $f_Qv
  echo "action: " $action
  #echo "f_user: " $f_user
  #echo "f_password: " $f_password
fi
