FILENAME := $(shell jq -r '.name +"_"+ .version' ./info.json)
APPDATA := $(shell /mnt/c/Windows/System32/cmd.exe /C "echo %APPDATA%" | sed -e "s/\\\/\//g" -e "s/^./\L&/" -e "s/://g" -e "s/^/\/mnt\//")
.PHONY: build copy

build:
	@mkdir build && mkdir ../$(FILENAME) && cp -r ./ ../$(FILENAME)/ && rm -rf ../$(FILENAME)/.git ../$(FILENAME)/makefile ../$(FILENAME)/build && mv ../$(FILENAME) ./build/$(FILENAME)
	@cd build && zip -r ../$(FILENAME).zip ./ && cd ../ && rm -rf build

copy:
	rm -rf "$(APPDATA)/Factorio/mods/$(FILENAME)" && mkdir -p "$(APPDATA)/Factorio/mods/$(FILENAME)" && cp -r ./* "$(APPDATA)/Factorio/mods/$(FILENAME)"
#	cp $(FILENAME).zip "$(APPDATA)/Factorio/mods/$(FILENAME).zip"
#	rm -rf $(FILENAME).zip

run: build copy

