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

cd $output
for file in `ls | grep txt`
do
cat $file >> $output/zzz_all.txt
echo "" >> $output/zzz_all.txt
echo "$file" >> $output/zzz_all.txt
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

cat $output/3_httprobe.txt | awk '{print NR,$0}' > 1.txt ; mv 1.txt $output/3_httprobe.txt
cat $output/3_getjs.txt | awk '{print NR,$0}' > 1.txt ; mv 1.txt $output/3_getjs.txt
del=`wc -l /root/screenlog.0  | awk '{print $1}'`
if [ $del -gt 6666666 ]
then
> /root/screenlog.0
fi

date "+%Y-%m-%d_%H:%M:%S" >> /root/date.txt
echo scan_port >> /root/date.txt
bash /root/script/webhook.sh
