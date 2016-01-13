BASH-Justrun - is a simple almost pure BASH programming script library than can 
add parallel working into your almost any working script.
And main difference against other solution is:
  * There is no need to install any other binaries like GNU parallel or make;
  * It use buildin shell job control to start new process and watch them work;
  * It's simple to read;
  * Library and your code can be separated or combinde in standalone 1 script;


Versions
========
All code provided without any waranty "AS IS" under GPL v2 license.
Authors: Nick Void https://github.com/mn3m0nic in 2015-2016.

Standalone version
==================

  * justrun-standalone

Files
======

  * justrun-lib 
  * justrun-with-lib


Description:
============
Current script ./justrun-standalone can be used for running some shell code in parallel
with outputing result of work to files in some $OUT dir.

Example:
=======
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


How to use it:
 0. mv ./justrun-standalone to ./some_usefull_script_to_parse_logs (for example)
 1. replace fork_body() function body with simple plain shell code 
    NOTE: function recieve ONLY 1 parameter
 2. test it like:
    ./some_usefull_script_to_parse_logs server1 server2 server3

    in dir out/ you should see results of work 

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

source $PATH_TO_LIB/justrun-lib
fork_body()
{
        # paste your working code here 
	# ...
}
main "$@"



