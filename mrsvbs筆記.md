## 在wine 下使用 modrssim 執行VBScript 需安裝的元件
```
  使用 winetricks 安裝以下元件
  wsh56js
  wsh56vb
  wsh57
```  

## wine 執行 cscript,
<a href="https://ephrain.net/mac-%E5%9C%A8-mac-%E4%B8%8A%E4%BD%BF%E7%94%A8-wine-%E5%9F%B7%E8%A1%8C-vbscript/">在 Mac 上使用 Wine 執行 VBScript</a>

```
 winetricks list-all | egrep -i wsh
 winetricks wsh57
 winetricks list-installed | egrep -i wsh

 wine cscript

```

## Modrssim 看起來是不能用 "Class" 語法(需確認)
## mrsvbs 注意事項

```
  isWsh = true : 測試於 cscript中, ex: $ wine cscript CC81.vbs
  isWsh = false : 測試於 modrssim 的 Animation.


```
