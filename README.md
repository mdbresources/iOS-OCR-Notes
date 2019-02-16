# MidwayReview
A worksheet made for the Mobile Developers at Berkeley iOS training program to prepare for the first Midway assessment.

# App Description
This app is note-taking app equipped with Firebase and Optical Character Recognition (OCR). Users can create an account and scan documents into the app. The text from these documents is uploaded into Firebase for storage. After a user scans a picture, they can see the extracted text in the document feed. Clicking on a document in the feed will present the user with a details page where they can edit the document's title as well as its body. These should be updated on Firebase.

I have implemented the OCR as well as other aspects of the program outside the scope of the training program. The rest is up to you. To complete the worksheet, simply fill in the functions marked with "TODO" and create the views based on the screenshots below.

# Spec
You must implement the following features/views

- Firebase
  - You must set up the Firebase RealTimeDatabase yourself and import the appropriate pods
  - Login
  - Sign-up
  - Signout
  - Retrieving all documents for a specific user. A user should not be able to access another user's documents
  - Update a specific document with new values
- Document Feed
  - Is only shown if the user is logged in
  - Has a list of scanned documents
  - Has a signout UIBarButtonItem
  - Presents the DetailViewController when a document is clicked
- DetailViewController
  - Has an editable title field
  - Has an editable text view for the document body
  - The title field and text view should only be editable once the OCR is performed
  - The image view should be clickable to open the image picker
- LoginViewController
  - Allows the user to login/signup if they are not logged in already

See the following screenshots for more clarity.

# Screenshots

## Login
![Login](Screenshots/Login.PNG)

## Feed
![Feed](Screenshots/Feed.PNG)

## Detail
![Feed](Screenshots/Detail.PNG)

## Scanner
![Feed](Screenshots/EmptyReader.PNG)

#Scanner Loading
![Feed](Screenshots/LoadingReader.PNG)

# FAQs and Hints

## How is OCR happening
I have included a Pod called [Tesseract-iOS](https://github.com/gali8/Tesseract-OCR-iOS/wiki/Using-Tesseract-OCR-iOS]) which is an open source OCR engine made by Google.

## OCR is performing poorly
The Tesseract engine has many limitations, one of them being that it can be very inaccurate at times.

## Firebase isn't working
Make sure you have imported all your pods correctly, set up the real time database and authentication via the Firebase console, and have downloaded the GoogleService-Info.plst file.