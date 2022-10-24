#
# Windows:
#   1. Download and install GTKWave:
#        https://sourceforge.net/projects/gtkwave/
#   2. Download and install ghdl-0.29.1
#        http://ghdl.free.fr/ghdl-installer-0.29.1.exe
#        http://ghdl.free.fr/site/pmwiki.php?n=Main.Download
#   3. In this file:
#        -- set the TOP_ENTITY according to your testbench
#        -- set path to gtkwave (Windows GTK parameter) 
#        -- comment Linux GTK
#   4. Open Git Bash terminal and run this script:
#        sh RUN.sh
#
# Linux:
#   1. Download and install everything:
#        sudo apt-get install ghdl gtkwave
#   2. In this file:
#        -- set the TOP_ENTITY according to your testbench
#        -- comment Windows GTK parameter
#        -- uncomment Linux GTK parameter
#   3. Open any terminal and run this script:
#        sh RUN.sh
#

TOP_ENTITY=tb_comparator_4bit

## Windows
#GTK=c:/APPZ/gtkwave/bin

## Linux
GTK=/usr/bin



##
## You should not have to change anything below here
##
## Script inspired by EDA Playground
##   - VHDL-2002 standard selected
##   - Supply an IEEE library containing only packages defined
##     by IEEE standard
##

ghdl -i --std=02 --ieee=standard *.vhd &&
	ghdl -m $TOP_ENTITY && 
	ghdl -r $TOP_ENTITY --vcd=dump.vcd && 
	$GTK/gtkwave dump.vcd

rm -f dump.vcd *.cf

