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
