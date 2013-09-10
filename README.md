CloPeMa Garment Dataset
=======================

This repository contains tools and documentation for publicly available
benchmark datasets for testing and evaluation of garment segmentation,
recognition and folding algorithms -- the [CloPeMa Garment Dataset][web]. The
datasets are free for research and educational purposes only and can be used in
scientific publications at the condition of respecting the requested citation
acknowledgment.

Tools
=====




The annotation is stored in the [YAML][] markup language and The [yamlmatlab][]
library is used for YAML parsing. The library is included in this repository.

Documentation
=============

This repository also contains a source code for Latex document that describes
the dataset. In order to make the pdf version of the documentation run the
following command in the `doc` directory.

```
$ latexmk -pdf main.tex
```

Note that it requires [latex][] and [latexmk][] to be installed.

Contributing
============

You are welcome to contribute by sending a pull request.

Citation Request
================

If you are using this dataset some of the code in your project, please include
the following citation.

```
TBD
```


[web]: http://clopema.felk.cvut.cz/public_data.html
[YAML]: http://yaml.org
[latex]: http://www.latex-project.org
[latexmk]: http://www.ctan.org/pkg/latexmk/
[yamlmatlab]: http://code.google.com/p/yamlmatlab/
