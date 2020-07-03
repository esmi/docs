#!/usr/bin/env bash

source chkksml.conf

target="ksml"
mywifi=`env LANG=C nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2`

#testcmd='wget -qSO- --max-redirect=0 google.com 2>&1 | grep -i location:'
avaiable=false

if [[ "$mywifi". = "$target". ]]; then

  location=`wget -qSO- --max-redirect=0 google.com 2>&1 | grep -i location:`
  isgoogle=`echo $location | grep -i google`

  if [[ "$isgoogle". = "". ]] ; then
    #available=false
    login=`echo $location | sed -e 's/Location: //g' -e 's/?.*$//g'`
    hs_server=`echo $location | sed -e 's/Location: .*?//g' -e 's/&Qv=.*$//g' -e 's/^.*=//g'`
    Qv=`echo $location | sed -e 's/Location: .*?.*Qv=//g'`

    port=880;
    cgiUrl="/cgi-bin/hslogin.cgi"

    echo "postToUrl: " $postToUrl

    f_hs_server=$hs_server
    f_Qv=$Qv
    action="http://"$hs_server:$port$cgiUrl

    echo "hs_server:" $hs_server
    echo "login:" $login
    echo "QV:" $Qv
    echo ""
    echo "f_hs_server: " $f_hs_server
    echo "f_Qv: " $f_Qv

    #echo "f_user: " $f_user
    #echo "f_pass: " $f_pass

    echo "action: " $action

    #{f_user: "", f_pass: "", f_hs_server: "163.32.124.43", f_Qv: "it_qpmjdz=efgbvmu.fyufsobm@bbb_qpmjdz=Sfbefs.Ebubc…8C.DC.5F.67.DF@ttje=ltnm@bq_nbd=C5.3E.67.9D.G4.F2"}
    #f_Qv: "it_qpmjdz=efgbvmu.fyufsobm@bbb_qpmjdz=Sfbefs.Ebubcbtf@dmjfou_njou=422338472@dmjfou_nbd=G1.8C.DC.5F.67.DF@ttje=ltnm@bq_nbd=C5.3E.67.9D.G4.F2"
    #f_hs_server: "163.32.124.43"
    #f_pass: ""
    #f_user: ""

    post_data="'f_user=$f_user&f_pass=$f_pass&f_hs_server=$f_hs_server&f_Qv=$f_Qv'"

    #  --save-cookies cookies.txt
    wget \
         --post-data $post_data \
         $action 2>&1 > /dev/null

    echo "SKML WIFI has been re-connected!"
  else
    echo "KSML WIFI is available, location($loaction) is valided!"
    #available=true
    exit 1
  fi

fi
