all:
	rm -rf portage-final
	mkdir -p portage-final
	cp -r portage-src/* portage-final
	chmod +x tools/generate-digest
	tools/generate-digest

clean:
	rm -rf portage-final
	