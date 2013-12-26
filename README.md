colorcode
=========

A [Processing](http://processing.org) sketch to generate colored barcodes based on film input. This is a project to explore Processing and data visualization. The frames of the input film need to be extracted first, e.g. by running ```ffmpeg -i inputfile.avi -r 1 -f image2 frame-%d.png```.

Warning: The frame analysis part becomes very slow very fast. It is not recommended for actual use.

references
----------
* [processing](http://processing.org)
* [JSON](http://json.org/)
* [Code 128](https://en.wikipedia.org/wiki/Code_128)
* [ffmpeg](http://ffmpeg.org/)