Housekeeper patch description
================

* Applicable to zabbix-server 2.4.x (Tested on 2.4.5)
* You will start Housekeeper thread by sending USR1 signal and stop it via USR2 using your regular cron (it will allow to make all work at night or in specific time, for example);
* All DELETE database requests started from HK thread for trends table now will have LIMIT **HistoryDeleteLimit**; 
* After removing **HistoryAndTrendsDeleteBeforeSleep** records HK will go to sleep on **HistoryAndTrendsSleepBetweenDeletes** ms;
* All of theese should/can make your HK work smoother and database blocking time should be minimized;
* Current version of patch v0.01 (check for newer versions);

Zabbix server new variables
===========================

| Configuration Variable      | Description   | Defailt value  |
| --------------------------- |---------------|:--------------:|
| HistoryAndTrendsDeleteBeforeSleep |Count of records which must be deleted before housekeeper will go to sleep. This value related only with cleanup function of History and Trends (as most heavy functions) | 1000000 (records) |
| HistoryAndTrendsSleepBetweenDeletes | Seconds for sleep before deletes. It's just time which thread of housekeeper halt execution and wait when database perform previous queries. Must be less than MySQL connection timeout. | 10 (s) |
| HistoryDeleteLimit  | SQL LIMIT for every delete - additional limit which can minimize impact of cleaning "heavy" items | 1000 (records) |


Recommendations before apply
============

* Don't use this patch if there are any way to minimize data amount collected / processed by Zabbix server;
* Monitor database size time by time and records count in trends; 

Сomparison
==========

* Housekeeper of health man (before patch):

![before](https://raw.githubusercontent.com/mn3m0nic/ffts/master/zabbix-server-patch/before_HK.png "before")

* Housekeeper of smoking man (applied):

![after](https://raw.githubusercontent.com/mn3m0nic/ffts/master/zabbix-server-patch/after_HK.png "after1")

