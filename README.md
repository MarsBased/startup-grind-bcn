Startup Grind Barcelona Web Site
=================

Website of the Startup Grind Barcelona. The wesite is built with [Jekyll](http://jekyllrb.com/) and hosted with [GitHub Pages](http://pages.github.com/). 

Although GitHub Pages supports Jekyll we need to maintain two separate branches because we use some plugins that GitHub Pages doesn't permit. These plugins allow us to minify assets, be able to use LESS stylesheets and Coffeescript code instead of plain Javascript.

The **master** branch contains the Jekyll project and all its related files while the **gh-pages** branch contains the site statically built and ready to be hosted with GitHub Pages.

The process of building the is done throught the following rake task:

`rake publish`
