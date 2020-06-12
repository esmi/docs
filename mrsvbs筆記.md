## wine 執行 cscript,
<a href="https://ephrain.net/mac-%E5%9C%A8-mac-%E4%B8%8A%E4%BD%BF%E7%94%A8-wine-%E5%9F%B7%E8%A1%8C-vbscript/">在 Mac 上使用 Wine 執行 VBScript</a>

```
 winetricks list-all | egrep -i wsh
 winetricks wsh57
 winetricks list-installed | egrep -i wsh

 wine cscript

```

## Modrssim 看起來是不能用 "Class" 語法
