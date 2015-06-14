
Connecting to chip on mainboard 
===============================

MX25L6445E
==========

                (display)

                8  7  6  5
               [+]    |  |
                o  x  o  o
                |  |  |  |
                ==========
                \        =
                /.       =
                ==========
                |  |  |  |
                o  o  x  o
                |  |    [-]
                1  2  3  4

                (keyboard)


* 1  CS (Chip Select) -> connect CS
* 2  MISO (Master Input Slave Output) <- connect MISO  [SO]
* 3  N/C  (Write Protection MUST be NOT connected to GND)
* 4  GND
* 5  MOSI (Master Output Slave Input) -> connect MOSI
* 6  CLK (Clock) --> connect Mater Clock
* 7  N/C
* 8  3.3 VCC (external)


#WARNING

* Do not forget connect external power supply to 3.3VCC and control voltage
* Check #WP. It's must NOT connect to GND
* Connect all GND wires 


