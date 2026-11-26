version.lock:
	madlib install

README.md: madlib.json
	pilcrow -i README.md --repo brekk/safe-space


.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
