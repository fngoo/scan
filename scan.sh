mkdir /root/script/run

rm -rf /root/run

mkdir /root/script/run

curl -L github.com/chaitin/xray/releases|grep -oP "(?<=\<a\ href\=\"\/chaitin\/xray\/releases\/download\/).*?(?=\/xray\_linux\_amd64\.zip\")" > /root/run/zip.txt

release=`head -1 /root/run/zip.txt|tail -1`

head=https://github.com/chaitin/xray/releases/download/;footer=/xray_linux_amd64.zip;wget=$head$release$footer

wget -P /root/run/ $wget

unzip /root/run/xray_linux_amd64.zip -d /root/run/ ; rm /root/run/xray_linux_amd64.zip

rm /root/run/zip.txt

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
cat /root/exe.sh | parallel --jobs 0 --delay 0.6 --retries 1 --timeout 200%
rm -r /root/dir_* ; rm /root/exe.sh



### masnmapscan模块

cat $var > /root/script/6_port/host2ip/host.txt

cd /root/script/6_port/host2ip ; python host2ip.py ; cat ip.txt >> /root/ip.txt ; sort -u /root/ip.txt -o /root/ip.txt ; cat ip.txt > /root/script/6_port/masnmapscan-V1.0/ip.txt ; cd /root/script/6_port/masnmapscan-V1.0 ; python masnmapcan-V1.0.py

cp /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt $output/masscan_detail.txt ; cp /root/script/6_port/masnmapscan-V1.0/masscan.json $output/masscan.txt ; > /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt ; > /root/script/6_port/masnmapscan-V1.0/ip.txt ; > /root/script/6_port/masnmapscan-V1.0/masscan.json ; > /root/script/6_port/host2ip/host.txt ; > /root/script/6_port/host2ip/ip.txt


