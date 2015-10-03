
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
