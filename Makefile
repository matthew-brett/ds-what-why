default: slides

all: slides handout

SOURCE=ds_what_why

# Need gpp for conditional stuff
# "brew install gpp" on macOS

slides: $(SOURCE).md
	gpp -H $(SOURCE).md | pandoc \
	    --citeproc \
	    -t beamer \
	    -o $(SOURCE)_slides.pdf

handout: $(SOURCE).md
	gpp -H -DHANDOUT=1 $(SOURCE).md | pandoc \
	    --citeproc \
	    -o $(SOURCE)_handout.pdf

clean:
	rm *.pdf *.html
