.PHONY: fmt

fmt:
	perltidy -b *.pl
	perlcritic .
	rm *.bak
	bundle exec rubocop -A
	find -name '*.yml' | xargs deno fmt
