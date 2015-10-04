# Installation
# 1. Download Makefile
#    - Place it in the root of your github repo.
#    - Edit that Makefile
#    - Write a rule like 'timm', containing your info.
#    - Change the 'me' rule so it calls your info (and not 'timm')
#
# 2. Add the text of _magicMake/mock.sh into .bash_profile
# 3. Configure the following pathnames

Here=$(shell pwd)

# where to write the doc files
out= $(Here)/doc#

# directory with support files
magic= $(Here)/_magicMake#

# directory with support files
etc= $(Here)/etc#

# path to source code files and man files
src= $(Here)/src#

# full pathname to the repo
prefix= https://github.com/txt/mase/blob/master#

# full pathname to the raw image files
img= https://raw.githubusercontent.com/txt/mase/master/img#

pys=   $(shell ls $(src)/*.py;)#
msds1= $(shell ls $(src)/*.md;)#
mds2=  $($pys:.py=.md)#
mds=   $(mds1) $(mds2)#

# do not change this line
include _magicMake/Makefile

# change 'timm' to your name and add your details
me : timm

timm:  # <== change to your name
	@git config --global user.name "Tim Menzies"
	@git config --global user.email tim.menzies@gmail.com
