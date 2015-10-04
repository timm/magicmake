# Installation
# 1. Download Makefile
#    - Place it in the root of your github repo.
#    - Edit that Makefile
#    - Write a rule like 'timm', containing your info.
#    - Change the 'me' rule so it calls your info (and not 'timm')
#
# 2. Add the text of _magicMake/mock.sh into .bash_profile
# 3. Configure the following pathnames

# where to write the doc files
out= .#

# directory with support files
etc= ../_magicMake#

# path to source code files

src= src#

prefix= https://github.com/txt/mase/blob/master#
img=    https://raw.githubusercontent.com/txt/mase/master/img#

pys= $(subst .py,.md,$(shell ls *.py;))#
mds= $(out)/$(subst .md ,.md $(out)/,$(pys))#

###################################################
# do not change below this line

include _magicMake/Makefile
