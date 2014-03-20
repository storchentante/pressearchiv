PSD=$(shell find content -type f -iname '*.psd')
RTF=$(shell find content -type f -iname '*.rtf')

PNG=$(PSD:%.psd=%.png)
JPG=$(PSD:%.psd=%.jpg)
TXT=$(RTF:%.rtf=%.txt)

all: png jpg txt

png: $(PNG)

jpg: $(JPG)

txt: $(TXT)

%.png: %.psd
	convert $< -flatten $@

%.jpg: %.psd
	convert $< -flatten $@

%.txt: %.rtf
	unrtf --text $< | iconv -f ISO-8859-15 -t UTF-8 > $@

clean:
	rm -f $(PNG) $(JPG) $(TXT)

.PHONY: png jpg txt clean
