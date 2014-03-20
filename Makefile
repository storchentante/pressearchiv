PSD=$(shell find content -type f -iname '*.psd')
RTF=$(shell find content -type f -iname '*.rtf')

PNG=$(PSD:%.psd=%.png)
JPG=$(PSD:%.psd=%.jpg)
TXT=$(RTF:%.rtf=%.txt)
HTML=$(RTF:%.rtf=%.html)

all: png jpg txt html index.html

png: $(PNG)

jpg: $(JPG)

txt: $(TXT)

html: $(HTML)

%.png: %.psd
	convert $< -flatten $@

%.jpg: %.psd
	convert $< -flatten $@

%.txt: %.rtf
	unrtf --text $< | iconv -f ISO-8859-15 -t UTF-8 | tail -n +6 > $@

%.html: %.rtf
	unrtf --html $< > $@

index.html: index.sh $(HTML) $(PNG)
	./index.sh > $@

clean:
	rm -f $(PNG)
	rm -f $(JPG)
	rm -f $(TXT)
	rm -f $(HTML)
	rm -f index.html

.PHONY: png jpg txt html clean
