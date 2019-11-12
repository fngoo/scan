rm apps.json
webanalyze -update
for line in `cat $var`
do
echo "webanalyze -crawl 12 -host $line -output csv >> $output/6_whatsweb.txt ; sort -u $output/6_whatsweb.txt -o $output/6_whatsweb.txt ; cat $output/6_whatsweb.txt >> /root/whatsweb.txt ; sort -u /root/whatsweb.txt -o /root/whatsweb.txt ; wc -l $output/6_whatsweb.txt" > analyze.sh
timeout 66 bash analyze.sh
done
rm analyze.sh


mkdir /root/script/run

rm -rf /root/script/run

mkdir /root/script/run

curl -L github.com/chaitin/xray/releases|grep -oP "(?<=\<a\ href\=\"\/chaitin\/xray\/releases\/download\/).*?(?=\/xray\_linux\_amd64\.zip\")" > /root/script/run/zip.txt

release=`head -1 /root/script/run/zip.txt|tail -1`

head=https://github.com/chaitin/xray/releases/download/;footer=/xray_linux_amd64.zip;wget=$head$release$footer

wget -P /root/script/run/ $wget

unzip /root/script/run/xray_linux_amd64.zip -d /root/script/run/ ; rm /root/script/run/xray_linux_amd64.zip

rm /root/script/run/zip.txt

### xray使用

cd /root/script/run

./xray_linux_amd64 webscan --url-file /root/httprobe_all.txt --json-output 1.txt ; cat 1.txt >> $output/6_xray.txt ; rm 1.txt

### masnmapscan模块

cat $var > /root/script/6_port/host2ip/host.txt

cd /root/script/6_port/host2ip ; python host2ip.py ; cat ip.txt | grep "." >> /root/ip.txt ; sort -u /root/ip.txt -o /root/ip.txt ; cat ip.txt | grep "." > /root/script/6_port/masscan_to_nmap-1/ip.txt ; cd /root/script/6_port/masscan_to_nmap-1 ; python scan.py

cat /root/script/6_port/masscan_to_nmap-1/scan_url_port.txt >> /root/whatsport.txt ; cp /root/script/6_port/masscan_to_nmap-1/scan_url_port.txt $output/6_port.txt ; > /root/script/6_port/masscan_to_nmap-1/scan_url_port.txt ; > /root/script/6_port/masscan_to_nmap-1/ip.txt ; > /root/script/6_port/masscan_to_nmap-1/scan_ip.txt ; > /root/script/6_port/masscan_to_nmap-1/masscan.json ; > /root/script/6_port/host2ip/host.txt ; > /root/script/6_port/host2ip/ip.txt

cd $output
for file in `ls | grep txt`
do
line=`cat $file`
if [ "$line" = "" ]
then
rm -rf $file
fi
done
cd /root/script/6_port/masscan_to_nmap-1
screen=`cat /root/screenlog.0 | wc -l`
if [ $screen -gt 222222 ]
then
> /root/screenlog.0
fi
echo scan >> /root/date.txt
date "+%Y-%m-%d_%H:%M:%S" >> /root/date.txt
