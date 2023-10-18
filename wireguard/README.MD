```
wg genkey | tee ./privatekey | wg pubkey > ./publickey
cat ./privatekey # 私钥，自己用
cat ./publickey # 公钥，给对方用
