.PHONY: fmt

fmt:
	perltidy -b *.pl
	rm *.bak
	bundle exec rubocop -A

fix:
	make fmt
	perlcritic .
	bundle exec rubocop -A