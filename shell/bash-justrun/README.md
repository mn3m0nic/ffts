BASH-Justrun - is a simple almost pure BASH programming script library than can 
add parallel working into your almost any working script.
And main difference against other solution is:

  * It's simple to read and understand (If you know BASH of course :) )
  * There is no need to install any other binaries like GNU parallel or make;
  * It use buildin shell job control to start new process and watch them work;
  * Library and your code can be simply combinded in standalone one solid script file or it can be used as separated parts (Library and YOUR code independed);


Versions
========
All code provided without any waranty "AS IS" under GPL v2 license.

Authors: Nick Void https://github.com/mn3m0nic in 2015-2016.

Standalone version
==================

  * justrun-standalone

Description:
============
Current script ./justrun-standalone can be used for running some shell code in parallel
with outputing result of work to files in some $OUT dir.

Example:
=======
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


Using with a library
====================

Files
======

  * justrun-lib 
  * justrun-with-lib

Installation
============

 1. Download new copy of justrun-lib in ~/.scripts/shell/justrun directory
 2. Set env variable PATH_TO_LIB=~/.scripts/shell/justrun
 3. make this code in shell

```
source $PATH_TO_LIB/justrun-lib
CONC=32
fork_body()
{
        # paste your working code here 
	# ...
}
main "$@"
'``


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
