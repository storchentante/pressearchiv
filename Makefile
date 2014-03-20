PSD=$(shell find content -type f -iname '*.psd')
RTF=$(shell find content -type f -iname '*.rtf')

PNG=$(PSD:%.psd=%.png)
JPG=$(PSD:%.psd=%.jpg)
TXT=$(RTF:%.rtf=%.txt)
HTML=$(RTF:%.rtf=%.html)

DEST_HTML=$(HTML:content/%=dest/%)
DEST_PNG=$(PNG:content/%=dest/%)
DEST_JPG=$(JPG:content/%=dest/%)
DEST_TXT=$(TXT:content/%=dest/%)

all: png jpg txt html dest/index.html

png: $(DEST_PNG)

jpg: $(DEST_JPG)

txt: $(DEST_TXT)

html: $(DEST_HTML)

dest/%: content/%
	mkdir -p `dirname $@`
	install -m 644 $< $@

%.png: %.psd
	convert $< -flatten $@

%.jpg: %.psd
	convert $< -flatten $@

%.txt: %.rtf
	unrtf --text $< | iconv -f ISO-8859-15 -t UTF-8 | tail -n +6 > $@

%.html: %.rtf
	unrtf --html $< > $@

dest/index.html: index.sh index.txt $(DEST_HTML) $(DEST_PNG)
	mkdir -p dest/
	./index.sh > $@

clean:
	rm -f $(PNG)
	rm -f $(JPG)
	rm -f $(TXT)
	rm -f $(HTML)
	rm -rf dest/

.PHONY: png jpg txt html clean
