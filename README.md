This is the press archive of the Entbindungshaus Gießen. To generate the static HTML page, run

    make

in the main directory. To change the index page format, edit `index.sh`.

## Requirements

* [ImageMagick](http://www.imagemagick.org/)
* [UnRTF](https://www.gnu.org/software/unrtf/)

## updating the page

To update [the page](http://storchentante.github.io/pressearchiv), do this:

    make
    git checkout gh-pages
    rsync -av dest/ .
    rm -r dest
    git add .
    git commit
    git push
