.PHONY: fmt

fmt:
	perltidy -b *.pl
	rm *.bak
	perlcritic .
	bundle exec rubocop -A
	find -name '*.yml' | xargs deno fmt
