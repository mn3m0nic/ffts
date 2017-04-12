About this patch
================

* This patch will add 'nice' sleeps for Housekeeper for Zabbix-server 2.4.5 which will prevent freezing Zabbix server interface when housekeeper work under removing old data with millons of DELETE SQL queries.
* Also from now you can start housekeeper by sending USR1 signal using your regular CRON.


Zabbix server new variables
===========================


| Configuration Variable      | Description   | Defailt value  |
| --------------------------- |---------------|:--------------:|
| HistoryAndTrendsDeleteBeforeSleep |Count of records which must be deleted before housekeeper will go to sleep. This value related only with cleanup function of History and Trends (as most heavy functions) | 1000000 (records) |
| HistoryAndTrendsSleepBetweenDeletes | Seconds for sleep before deletes. It's just time which thread of housekeeper halt execution and wait when database perform previous queries. Must be less than MySQL connection timeout. | 10 (s) |
| HistoryDeleteLimit  | SQL LIMIT for every delete - additional limit which can minimize impact of cleaning "heavy" items | 1000 (records) |


First of all
============

* Don't use this patch if there are any way to minimize data amount collected / processed by Zabbix server;
* Don't use this patch if there are way to speedup your database;
* Don't use this patch if you scared by patching something on live systems :-P


Comparastion
============

* Housekeeper of health man (before patch):

![before](https://raw.githubusercontent.com/mn3m0nic/ffts/master/zabbix-server-patch/before_HK.png "before")


* Housekeeper of smoking man:

![after](https://raw.githubusercontent.com/mn3m0nic/ffts/master/zabbix-server-patch/after_HK.png "after1")

![after2](https://raw.githubusercontent.com/mn3m0nic/ffts/master/zabbix-server-patch/after_HK2.png "after2")

