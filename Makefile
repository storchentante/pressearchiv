PSD=$(shell find content -type f -iname '*.psd')
RTF=$(shell find content -type f -iname '*.rtf')

PNG=$(PSD:%.psd=%.png)
TXT=$(RTF:%.rtf=%.txt)

all: png txt

png: $(PNG)

txt: $(TXT)

%.png: %.psd
	convert $< $@

%.txt: %.rtf
	unrtf --text $< | iconv -f ISO-8859-15 -t UTF-8 > $@

clean:
	rm -f $(PNG) $(TXT)

.PHONY: png txt clean
