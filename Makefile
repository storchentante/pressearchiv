PSD=$(shell find content -type f -iname '*.psd')
RTF=$(shell find content -type f -iname '*.rtf')

PNG=$(PSD:%.psd=%.png)
JPG=$(PSD:%.psd=%.jpg)
TXT=$(RTF:%.rtf=%.txt)
HTML=$(RTF:%.rtf=%.html)

all: png jpg txt html

png: $(PNG)

jpg: $(JPG)

txt: $(TXT)

html: $(HTML)

%.png: %.psd
	convert $< -flatten $@

%.jpg: %.psd
	convert $< -flatten $@

%.txt: %.rtf
	unrtf --text $< | iconv -f ISO-8859-15 -t UTF-8 > $@

%.html: %.rtf
	unrtf --html $< > $@

clean:
	rm -f $(PNG) $(JPG) $(TXT) $(HTML)

.PHONY: png jpg txt html clean
