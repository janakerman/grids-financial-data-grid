ShinobiGrids Financial Data Grid (Objective-C)
=====================

A ShinobiGrids demo app that shows how to create custom cells and style the grid. The project also demonstrates how to create a highlighting effect, to show when a row is updated.

![Screenshot](screenshot.png?raw=true)

Building the project
------------------

In order to build this project you'll need a copy of ShinobiGrids. If you don't have it yet, you can download a free trial from the [ShinobiGrids website](http://www.shinobicontrols.com/shinobigrids/price-plans/shinobigrids/shinobigrids-free-trial-form/).

Once you've downloaded and unzipped ShinobiGrids, open up the project in Xcode, and drag ShinobiGrids.embeddedframework from the finder into Xcode's 'frameworks' group, and Xcode will sort out all the header and linker paths for you.

If you're using the trial version you'll need to add your license key. To do so, open up ViewController.m, find the method 'setupGrid' and modify the following line:

    // You can remove this line if you have a full version of ShinobiGrids.
    _financialGrid.licenseKey = @""; // TODO: add your trial licence key here!

Contributing
------------

We'd love to see your contributions to this project - please go ahead and fork it and send us a pull request when you're done! Or if you have a new project you think we should include here, email info@shinobicontrols.com to tell us about it.

License
-------

The [Apache License, Version 2.0](license.txt) applies to everything in this repository, and will apply to any user contributions.
