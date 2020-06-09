## 寫此文件的原因

由於手邊工作會用的modbus協定, 而各廠商所提供 modbus設備可能只有文件, 實體設備並無法取得, 再加上開發環通常只在單機電腦, 因此常配合 modrssim, 以及 com0com 搭配在 windows環境上使用, 若是Linux環境通常要使用modbus模擬器, 常透過 modbus/TCP來使用。但如果設備只提供modbus RTU協定測試上還是較不方便, 因此發了一些時間調查與測試， 便將測試結果寫下來.

## modrssim 在 Linux/WINE 環境下的執行

Modrssim 必須在 WINE下執行， 但 若要執行RTU模式則需要 WINE的COM PORT, 可使用<a href="https://github.com/esmi/wineser"> wineser/mkcom.sh</a>來產生兩個虛擬的COM Port, 實際上連結到 /dev/ttyUSBLocal, 及/dev/ttyUSBRemote(這是透過socat 產生的 tty 端點), 請參考以下文件

<img src="image/modbus_modrssim_serial_port_linux.png">

WINE COM PORT <a href="https://www.onetransistor.eu/2015/12/wine-serial-port-linux.html">設定原理請參考此連結</a>

## modrssim 配合 <a href="https://github.com/3cky/mbusd">mbusd</a>

mbusd 是 Modbus TCP to Modbus RTU (RS-232/485) gateway, 所以他的後面應該可以用 Modrssim 透過 modbus RTU來模擬(未測試).

請參考下圖
<img src="image/modbus_mbusd_modrssim.png">
