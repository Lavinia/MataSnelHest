MataSnelHest
============
Feeding program for horses.

Development
============

MataSnelHest needs foreman and node.js to work. install via npm.

* Recompile coffescript to javascript on every change: `./compile.sh`

* Start local web server: `foreman start`

Tests
=====

Tests use mocha and chai. 
* Install via npm: `npm install mocha` and `npm install chai`
* Run tests `mocha --compilers coffee:coffee-script/register -R spec` 

License
=======
Horse icon taken from [Delightful Zodiac Icons](http://www.iconarchive.com/show/delightful-zodiac-icons-by-troyboydesign/Horse-icon.html) made by Troy Dunham, [Troy Boy Design](http://www.troyboydesign.com). Free for non-commercial use.
