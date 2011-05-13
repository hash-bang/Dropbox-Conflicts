VERSION := $(shell perl -MExtUtils::MakeMaker -le 'print MM->parse_version(shift)' dbconflicts)

README: dbconflicts
	pod2text dbconflicts >README
	git add README
	git commit -m 'Auto update from POD'

commit: README
	-git commit -a

push: commit
	git push

update:
	cd MC; git pull

version:
	echo "VERSION IS $(VERSION)"

clean:
	-rm -r $(DEBFACTORY)
