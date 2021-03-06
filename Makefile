VERSION := $(shell perl -MExtUtils::MakeMaker -le 'print MM->parse_version(shift)' dbc)

README: dbc
	pod2text dbc >README
	git add README
	git commit -m 'Auto update from POD'

install-cpan:
	sudo cpan Digest::MD5::File Text::Glob Test::Exception File::DirWalk Data::Dump

version:
	echo "VERSION IS $(VERSION)"

clean:
	-rm -r $(DEBFACTORY)
