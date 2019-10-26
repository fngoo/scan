###如果更新就删除旧版,下载新版

curl -L github.com/chaitin/xray/releases|grep -oP "(?<=\<a\ href\=\"\/chaitin\/xray\/releases\/download\/).*?(?=\/xray\_linux\_amd64\.zip\")" > /root/run/zip.txt


comm -3 /root/run/zip.txt /root/run/zip1.txt > /root/run/release.txt ; sed 's/[[:space:]]//g' /root/run/release.txt > space.txt ; > /root/run/release.txt ; cat space.txt > /root/run/release.txt ; rm space.txt

if [ -s /root/run/release.txt ]

then

rm -rf /root/run/xray_linux_amd64

release=`head -1 /root/run/release.txt|tail -1`

head=https://github.com/chaitin/xray/releases/download/;footer=/xray_linux_amd64.zip;wget=$head$release$footer

wget -P /root/run/ $wget

unzip /root/run/xray_linux_amd64.zip -d /root/run/ ; rm /root/run/xray_linux_amd64.zip ; > /root/run/zip1.txt ; cat /root/run/zip.txt>/root/run/zip1.txt ; > /root/run/zip.txt ;> /root/run/release.txt


### xray使用

mkdir $output/xray/

xray=$output/xray/

cd /root/run


i=1
for line in `cat /root/httprobe_all.txt`

do


name=.html ; txt=$head$name ;  url=$head$line

mkdir /root/dir_${i}
echo "cd /root/dir_${i} ; cp -r /root/run/* /root/dir_${i} ; ./xray_linux_amd64 webscan --url \"$line\" --json-output 1.txt ; cat 1.txt >> $output/xray/xray.txt ; echo \" \" >> $output/xray/xray.txt ; rm 1.txt ; cd ../ ; rm -r /root/dir_${i}" >> /root/exe.sh
i=$((i+1))
done
cat /root/exe.sh | parallel --jobs 0 --delay 0.6 --retries 1 --timeout 600
rm -r /root/dir_* ; rm /root/exe.sh



fi

### masnmapscan模块

cat $var > /root/script/6_port/host2ip/host.txt

cd /root/script/6_port/host2ip ; python host2ip.py ; cat ip.txt >> /root/ip.txt ; sort -u /root/ip.txt -o /root/ip.txt ; cat ip.txt > /root/script/6_port/masnmapscan-V1.0/ip.txt ; cd /root/script/6_port/masnmapscan-V1.0 ; python masnmapcan-V1.0.py

cp /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt $output/masscan_detail.txt ; cp /root/script/6_port/masnmapscan-V1.0/masscan.json $output/masscan.txt ; > /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt ; > /root/script/6_port/masnmapscan-V1.0/ip.txt ; > /root/script/6_port/masnmapscan-V1.0/masscan.json ; > /root/script/6_port/host2ip/host.txt ; > /root/script/6_port/host2ip/ip.txt





### 发邮件 ； 清空$output ； 发确认信息 ； 结束if urlwatch

mkdir $output/root ; ar=${var/target.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cp /root/ip.txt $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_scan.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname *;fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"scan"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg

rm -r $output

> $var ; cat /root/run/3.txt > /root/run/3_3.txt
