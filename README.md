This is the press archive of the Entbindungshaus Gießen. To generate the static HTML page, run

    make

in the main directory. To change the index page format, edit `index.sh`.

## Requirements

* [ImageMagick](http://www.imagemagick.org/)
* [UnRTF](https://www.gnu.org/software/unrtf/)

## adding content

to add content

* create a directory for the year
* add the scan as `year/<filename base>.psd`
* if available, add the text as `<year>/<filename base>.rtf`
* add a line to `index.txt` with the following format

    <filename base> <source> <date> <title>

Of these, only `<title>` may contain spaces, and `<filename base>` _must_ begin with the year in `YYYY` format.

## updating the page

To update [the page](http://storchentante.github.io/pressearchiv), do this:

    make
    git checkout gh-pages
    rsync -av dest/ .
    rm -r dest
    git add .
    git commit
    git push
