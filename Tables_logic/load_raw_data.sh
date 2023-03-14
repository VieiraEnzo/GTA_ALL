#This file loads data from buses into the database


for DIRECTORYNAME in /home/enzofv/Documents/Programming/GTA/bus_data/collect_bus/*;
do
    echo $DIRECTORYNAME
    for FILENAME in $DIRECTORYNAME/*;
    do
        #echo $FILENAME
        mysql -u root --local-infile -e "LOAD DATA LOCAL INFILE '$FILENAME' IGNORE INTO TABLE gta_bus.Positions FIELDS OPTIONALLY ENCLOSED BY '\"' terminated BY \",\" lines terminated BY \"\n\" (@date, bidentification, @vbline, lat, lng, @vspeed) SET time = STR_TO_DATE(@date,'%m-%d-%Y %H:%i:%s'), bline = NULLIF(@vbline,''), speed = NULLIF(@vspeed,'');";
    done;

done