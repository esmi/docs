## Webpack WDS 與 NGINX 在 Linux與windws上執行時的差異

1. 在 Linux上執行 WDS 時,如果 根目錄有 /dist 目錄時, 假設這個目錄是 WDS的 localhost:8080, 會導致 WDS無法 "hotplug", 先刪除 "dist" 目錄, 讓 WDS 可以 "hotplug", 再來查是否 nginx的設定有問題.
2. 
