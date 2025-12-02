.PHONY: fmt

fmt:
	perltidy -b *.pl
	rm *.bak