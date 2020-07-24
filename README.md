# Crowd-Sourced Tracing

Provides COVID19 location data for different days to help users see if they were exposed to the virus and should get tested

## Requirements

The CSTracing (Crowd-Sourced Tracing) app is a tool to record location data of confirmed COVID19 patients. Users can submit their last significant locations at which they were present while possibly being infected by the virus. Other users that are not infected can consult a map which shows them the time at which various location were visited by COVID19 patient. This make the population more aware if they were in contact with someone carrying the virus or if they visited such location to then encourage them to get tested. The software relies on crowd-sourced data. It relies on such data in order to respect people's privacy. Other solutions to this problem could see the use of GPS location or Bluetooth beacon and such but they rely on technology that harvest the public's data and could force people to share such data without their proper consent. 

## CODE
Most of the code present in this directory was written by myself. These files can be found under the "original" folder. There is files on which I iterated in order to adapt them to this use that can be found under the MapSearch folder. The sub-folder called Ressources holds the files required for the build as well as the storyboard. 

## BUILD PROCEDURE
In order to build this project, an Apple developper membership is necessary because it is using the Firebase SDK as well as CocoaPods. Without the proper membership, the app won't be able to be built on the user's device. Firebase is also not accessible form the simulator within Xcode therefore an IPhone is necessary in order to build and test the app. This project can only be built on Xcode, an Apple device and Xcode are necessary. You will also need to change the Team under Signing & Capabilities to your own. 

## ARCHITECTURE
This app relies on Firebase to handle the cloud database. The app sends the collected crowd-sourced data to the Firebase backend which stores and organises it and then it is access by the app in the map view in order to display the data to the user depending on their date selection. Please refer to the architecture diagram named "Architecture Diagram".

The important aspect of the code are in the reportViewController.swift file as well as the mapViewController.swift. These are the 2 main view controllers which the user interacts with and they are responsible with the data handling with Firebase.

### Recommended new features
Part of the issue with crow-sourced software is the difficulty to verify the data. New features could include ways to contact the person submitting the tracing reports and verifying the data they submitted. Another feature could be the use of public databases in order to incorporate their contact tracing data. We could also improve the way the map displays the hot spots with clusters when there's multiple reported cases as well as 'high-risk' areas such as malls, restaurants and such when there's multiple cases reported around that location or connected to that location. Push-notifications could also be implemented in order to inform user's when they're traversing high-risk areas where there was multiple cases confirmed days prior to their passage and such.

## Test cases
1. On Xcode, execute the build command. Expected result: Successful build
2. From the home screen, navigate to each of the different view controllers using the 2 main buttons and navigate back using the "cancel" or "<-" Expected Result:  should trigger all the segue's and unwind segue's without errors.
3. From the report view controller, submit a new report form. Expected result: No errors thrown and the user should be back on the home screen.
4. From the home screen, navigate to the Map Tracing view. Expected Result: Map should load without issue and be centered on the user's location
5. Do the same setup as 4. then, using the date picker, choose the date defined during your submission on 3. Expected result: You should see your marker placed on the map with the correct time displayed as the title.


## Credits
Part of the MapSearch code was built by Apple as a tutorial to get familiar with the MapKit API.

## Link to the base APPLE MapKit 
This is the link ot the base files that were first iterated upon in order to complete this project. -> https://developer.apple.com/documentation/mapkit/searching_for_nearby_points_of_interest

