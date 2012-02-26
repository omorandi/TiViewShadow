# TiViewShadow Module

## Description

This module extends the Ti SDK, allowing to add "drop shadow" functionalities to any View object you create.

The code implementing this feature has been originally posted by Javier Rayon [here](http://developer.appcelerator.com/question/130784/trick-drop-real-shadows-in-titanium-ios). 

The module is licensed under the MIT license.

## Building and installing the TiViewShadow Module ##

### BUILD ###

First, you must have your XCode and Titanium Mobile SDKs in place, and have at least read the first few pages of the [iOS Module Developer Guide](https://wiki.appcelerator.org/display/guides/iOS+Module+Development+Guide) from Appcelerator.

The build process can be launched using the build.py script that you find in the module's code root directory. 

As a result, the ti.viewshadow-iphone-0.2.zip file will be generated. 

**NOTE: if your Titanium sdk resides in the root `/Library/Application Support/Titanium/` directory, you need to change the value of the `TITANIUM SDK` variable in `titanium.xcconfig`**


### INSTALL ###
You can either copy the module package (ti.viewshadow-iphone-0.2.zip) to `$HOME/Library/Application\ Support/Titanium` and reference the module in your application (the Titanium SDK will automatically unzip the file in the right place), or manually launch the command:

     unzip -uo ti.viewshadow-iphone-0.2.zip -d $HOME/Library/Application\ Support/Titanium/


**NOTE: if your Titanium sdk resides in the root `/Library/Application Support/Titanium/` directory, change the above command accordingly**

## Referencing the module in your Titanium Mobile application ##

Simply add the following lines to your `tiapp.xml` file:
    
    <modules>
        <module version="0.2" platform="iphone">ti.viewshadow</module> 
    </modules>

and add this line in your app.js file:

	require('ti.viewshadow');

The module provides no public api. It's simply used for extending the TiUIView class provided by the Ti SDK with additional functionality.

## Authors
* Javier Rayon: [https://github.com/jaraen](https://github.com/jaraen ) (@jrayon)
* Olivier Morandi: [https://github.com/omorandi](https://github.com/omorandi) (@olivier_morandi)
* Daniel Tamas: [https://github.com/rborn](https://github.com/rborn) (@dan_tamas)


## License

    Copyright (c) 2012 Javier Rayon, Olivier Morandi, Daniel Tamas

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.