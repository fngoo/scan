mkdir /root/script/run

rm -rf /root/script/run

mkdir /root/script/run

curl -L github.com/chaitin/xray/releases|grep -oP "(?<=\<a\ href\=\"\/chaitin\/xray\/releases\/download\/).*?(?=\/xray\_linux\_amd64\.zip\")" > /root/script/run/zip.txt

release=`head -1 /root/script/run/zip.txt|tail -1`

head=https://github.com/chaitin/xray/releases/download/;footer=/xray_linux_amd64.zip;wget=$head$release$footer

wget -P /root/script/run/ $wget

unzip /root/script/run/xray_linux_amd64.zip -d /root/script/run/ ; rm /root/script/run/xray_linux_amd64.zip

rm /root/script/run/zip.txt

### xray

cd /root/script/run

./xray_linux_amd64 webscan --url-file /root/httprobe_all.txt --json-output 1.txt ; cat 1.txt >> $output/6_xray.txt ; rm 1.txt

date "+%Y-%m-%d_%H:%M:%S" >> /root/date.txt
echo scan_XRAY >> /root/date.txt
### port
apt update
yes|apt install nmap
apt install --fix-missing

cat $var > /root/script/6_port/host2ip/host.txt
bash /root/script/0_subdomain/massdns/scripts/get-resolvers.sh
cd /root/script/6_port/host2ip ; cat host.txt | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt --root -t A -s 1666 -o S -w results.txt ; awk -F"A\ " '{print $2}' results.txt >> ip.txt ; rm results.txt
cat ip.txt > /root/script/6_port/masscan_to_nmap-1/ip.txt ; sort -u /root/script/6_port/masscan_to_nmap-1/ip.txt -o /root/script/6_port/masscan_to_nmap-1/ip.txt

cd /root/script/6_port/masscan_to_nmap-1 ; python scan.py

grep -E ":27017 |:2181 |:6379 |:9200 |:28017 |:11211 |:21 |:22 |:25 |:53 |:110 |:123 |:137 |:143 |:161 |:389 |:445 |:512 |:873 |:1098 |:1352 |:1433 |:1521 |:2049 |:2181 |:2222 |:2601 |:3128 |:3306 |:3389 |:4100 |:4440 |:4848 |:5000 |:5422 |:5900 |:5984 |:6082 |:6379 |:7001 |:8000 |:8069 |:8080 |:8089 |:8161 |:8649 |:8980 |:9080 |:9200 |:11211 |:27017 |:50000 |:50010 |:67 |:68 " /root/script/6_port/masscan_to_nmap-1/scan_url_port.txt > $output/6_potential.txt ; sort -u $output/6_potential.txt -o $output/6_potential.txt
grep -E "FTP|SSH|telnet|SMTP|DNS|POP3|NTP|Samba|imap|LDAP|Https|SMB|linux r|rsync|JAVARMI|lotus|mssql|oracle|NFS|Zookeeper|DA|zebra|squid|mysql|RDP|SysBase|rundeck|glassfish|DB2|postgreSQL|vnc|CouchDB|varnish|redis|WebLogic|jdwp|zabbix|Apache|Tomcat|Nginx|Axis2|jboss|jenkins|activeMQ|ganglia|OpenNMS|websphere|elasticsearch|memcache|mongoDB|SAP|Hadoop|dhcp" /root/script/6_port/masscan_to_nmap-1/scan_url_port.txt > $output/6_potential.txt ; sort -u $output/6_potential.txt -o $output/6_potential.txt

port=`grep -E ":27017 |:2181 |:6379 |:9200 |:28017 |:11211 |:21 " /root/script/6_port/masscan_to_nmap-1/scan_url_port.txt`
if [ "$port" != "" ]
then
for ip in `cat /root/script/6_port/masscan_to_nmap-1/ip.txt`
do
cd /root/script/6_port/Check_Unauth
echo $ip >> 1.txt
python3 Check_Unauth.py $ip >> 1.txt
grep=`grep -oP "+" 1.txt`
if [ "$grep" = "" ]
then
> 1.txt
fi
cat 1.txt >> $output/6_unauth.txt
> 1.txt
done
fi

cat /root/script/6_port/masscan_to_nmap-1/scan_url_port.txt >> /root/whatsport.txt ; cp /root/script/6_port/masscan_to_nmap-1/scan_url_port.txt $output/6_port.txt ; > /root/script/6_port/masscan_to_nmap-1/scan_url_port.txt ; > /root/script/6_port/masscan_to_nmap-1/ip.txt ; > /root/script/6_port/masscan_to_nmap-1/scan_ip.txt ; > /root/script/6_port/masscan_to_nmap-1/masscan.json ; > /root/script/6_port/host2ip/host.txt ; > /root/script/6_port/host2ip/ip.txt

cd $output
for file in `ls | grep txt`
do
cat $file >> $output/zzz_all.txt
echo "" >> $output/zzz_all.txt
echo "-----------" >> $output/zzz_all.txt
echo "" >> $output/zzz_all.txt
line=`cat $file`
if [ "$line" = "" ]
then
rm -rf $file
fi
done
#move
cp $output/zzz_all.txt /root/z_juice/new.txt
echo "" >> /root/z_juice/1all_old.txt
echo "------------" >> /root/z_juice/1all_old.txt
echo "" >> /root/z_juice/1all_old.txt
cat /root/z_juice/1all_old.txt >> /root/z_juice/new.txt
rm /root/z_juice/1all_old.txt ; mv /root/z_juice/new.txt /root/z_juice/1all_old.txt

cd /root/script/6_port/masscan_to_nmap-1

date "+%Y-%m-%d_%H:%M:%S" >> /root/date.txt
echo scan_port >> /root/date.txt
bash /root/script/webhook.sh
