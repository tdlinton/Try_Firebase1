# Try_Firebase1
Experiment with Firebase Analytics and Crashlytics

App Usage
=========
At Project page, click "+" to add new projects. Click on a Project to go to its Parts page

At Parts page, click "+" to add new parts. Click on a Part to get options:
(1) "Save" will creates a "SavePart" even for FireBase
(2) "crash" will initiate a Crashlytics crash, for testing

The App reads from its Info.plist file to initialize two variables
    firebase_analytics_collection_enabled
    firebase_crashlytics_collection_enabled
These are also exposed through the global Settings app.

Internals
=========
There are 4 versions of application:didFinishWithOptions for experimentation
