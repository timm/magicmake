# Installation
# 1. Download Makefile
#    - Place it in the root of your github repo.
#    - Edit that Makefile
#    - Write a rule like 'timm', containing your info.
#    - Change the 'me' rule so it calls your info (and not 'timm')
#
# 2. Add the text of _magicMake/mock.sh into .bash_profile
# 3. Configure the following pathnames

###################################################
# Config session

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

Make = $(MAKE) --no-print-directory #

typo:   ready
	@- git status
	@- git commit -am "saving"
	@- git push origin master # <== update as needed

commit: ready
	@- git status
	@- git commit -a
	@- git push origin master

update: ready
	@- git pull origin master

status: ready
	@- git status

ready: me
	@git config --global credential.helper cache
	@git config credential.helper 'cache --timeout=3600'

me : timm

timm:  # <== change to your name
	@git config --global user.name "Tim Menzies"
	@git config --global user.email tim.menzies@gmail.com

$(out)/%.md: %.py $(etc)/header.txt $(etc)/footer.txt $(etc)/p2md.awk
	@echo "making... $<"
	@(cat $(etc)/header.txt; \
          awk -f $(etc)/p2md.awk -v name="$<" $< ; \
         cat $(etc)/footer.txt) \
         | sed 's?__PRE?$(prefix)?g'  \
         | sed 's?__IMG?$(img)?g' > $@;
	@git add $@
