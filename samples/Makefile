TARGETS := audio graphics input network spu sys

all:
	@for TARGET in $(TARGETS); do $(MAKE) --no-print-directory -C $$TARGET; done

clean:
	@for TARGET in $(TARGETS); do $(MAKE) --no-print-directory -C $$TARGET clean; done

pkg:
	find . -type f -name 'Makefile' -exec grep -q 'pkg:' {} \; -exec sh -c 'cd $$(dirname "{}") && make pkg' \;
