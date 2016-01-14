BASH-Justrun - is a simple almost pure BASH programming script library than can 
add parallel command running into your script.

Differences between others solutions are:

  * It's simple to read and understand (If you know BASH of course :) )
  * There is no need to install any other binaries like [GNU parallel](http://www.gnu.org/software/parallel/) or [make](https://www.gnu.org/software/make/);
  * Script library use [buildin shell job control](http://www.tldp.org/LDP/abs/html/x9644.html) to start new processes in background and watch how them work, count them and keeps everytime running CONC number of processes;
  * Library and your code can be simply combinded in standalone one solid script file or it can be used as separated parts (Library and YOUR code independed);
  * It can control how much processed running in same time using local CONC (concurrent) varilable; 


Versions
========
All code provided without any warranty "AS IS" under GPL v2 license.

Authors: Nick Void https://github.com/mn3m0nic in 2015-2016.


Standalone version
==================

  * [justrun-standalone](https://github.com/mn3m0nic/ffts/blob/master/shell/bash-justrun/examples/example2-justrun-standalone.sh)

Description standalone version:
============
Current script ./justrun-standalone is just a simple example which can be used for running some shell code in parallel mode
with outputing result of work to files in some $OUT dir and showing it to screen when results is recieved. Output files will be named by default as: Scriptname + Agument + "_at_" + date ".txt"

Example output:
==============

![Testing](https://raw.githubusercontent.com/mn3m0nic/ffts/master/shell/bash-justrun/docs/example-with-random-sleep.gif)
***

```
$./justrun-standalone aaa bbb ccc ddd eee ffffff ggg ssss 000 2222
$tree
├── out
│   ├── run_000_at_20160113185410.txt
│   ├── run_2222_at_20160113185411.txt
│   ├── run_aaa_at_20160113185409.txt
│   ├── run_bbb_at_20160113185409.txt
│   ├── run_ccc_at_20160113185409.txt
│   ├── run_ddd_at_20160113185409.txt
│   ├── run_eee_at_20160113185409.txt
│   ├── run_ffffff_at_20160113185409.txt
│   ├── run_ggg_at_20160113185409.txt
│   └── run_ssss_at_20160113185409.txt
└── run
```

How to start use it
===================
 0. Rename ./justrun-standalone to ./some_usefull_script_to_parse_logs (for example)
 1. Replace fork_body() function body with YOUR shell code
    NOTE: function recieve must ONLY 1 parameter (for now)
 2. test it like:

```
    ./some_usefull_script_to_parse_logs server1 server2 server3

    in dir out/ you should see results of work 
```

TODO
====
TODO: add exit code support


Using with a library justrun-lib
================================

Files
=====

  * [justrun-lib](https://github.com/mn3m0nic/ffts/blob/master/shell/bash-justrun/justrun-lib) <- Library itself
  * [justrun-with-lib](https://github.com/mn3m0nic/ffts/blob/master/shell/bash-justrun/examples/example1-justrun-with-random-sleep.sh) <- Testing script 1 with dummy random generated sleeps

Installation
============

 1. Download new copy of justrun-lib in ~/.scripts/shell/justrun directory

```
mkdir -p ~/.scripts/shell/justrun
cd ~/.scripts/shell/justrun
wget https://raw.githubusercontent.com/mn3m0nic/ffts/master/shell/bash-justrun/justrun-lib
```

 2. Set env variable PATH_TO_LIB=~/.scripts/shell/justrun

```
echo "export PATH_TO_LIB=~/.scripts/shell/justrun" >> ~/.bashrc
```

 3. Now you can go to your working dir and create new script like in example:

```
source $PATH_TO_LIB/justrun-lib
CONC=32
fork_body()
{
        # paste your working code here 
	# ...
}
main "$@"
```
You can run it as:

```
cat list.txt | xargs ./justrun-with-lib
```

Testing script perfomance
=========================

Testing for random script that walks though >200 server via SSH and do 1 simple command on it
(you may have different values, but this is just for example)

With CONC=1 or just process 1 by 1

```
time cat list-all-servers.txt | xargs ./check-server 
...(output removed)...
real	6m26.286s
user	0m41.972s
sys	0m59.228s
```

And now we do the same but with CONC=32

```
Jobs running: 0
All complete.

real	0m17.060s
user	0m32.280s
sys	0m15.748s
```
