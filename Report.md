# COMP6001 17B Swift Report


## Detailed Plan
In this report we will discuss the plan for our Swift Timesheet Application. The Swift Timesheet Application will be a mobile app for the iPhone device specifically. The goal of the application is to produce a detailed timesheet for the scanned or searched object, for example you will have the capability to scan or input a room number or a student identification card and be produced with a timesheet display on the mobile device. The Swift Timesheet Application will utilize some builtin functionality of iOS 11 to scan the barcode for the student identification card and scan the room number, the Application will also utilize network capabilities to talk to an API which will store and maintain student, room and timesheet information. With these tools and technologies combined the application will be able to produce accurate timesheets that can be presented to the user in real time.

## Wire-Frames

### Landing Page
_coming_

### Timesheet Edit Page
_coming_

### Timesheet Display Page
_coming_

### Scan Pages
_coming_

### Search Pages
_coming_


## Tools Used

### Slack
The team decided to use Slack as the tool for communicating between team members. Slack is an industry standard for communication, and because everyone in the team has had extensive use with it we determined it would be the best suited tool for our team to use. One alternative which was considered was Facebook's Group Chat, but because it lacks professionalism, the ability for easy and seamless collaboration, useful integrations with Github, Trello etc etc, we found that Slack would be more useful to us as individual collaborators and developers working together in the team.

### Trello
We have decided to use Trello as our project manangement system because it is most familiar and utilizes our needs collectively. Within the team there is experience using Trello so it was the first application considered, another application for a project management system considered was Github Projects, this was dismissed as it appeared less interactive then the original option Trello which is customizable with cats as the main theme. Trello also has Github interaction which allows Github repositories to become linked to the cards and tasks which gives us insight into our Github project and branch at hand. Trello also has an interactive mobile application where we can view/update/delete cards on the fly, which is handy for on the go updating.

### Github
_coming_

### XCode
_coming_

### Camera Input
We decided to use the phone's built in camera to scan the barcode on a student's ID card, rather than just entering their ID number into a text box or something like that. Of course, we do have an option to just enter the number in case the card isn't scanning or the student doesn't have one, but we wanted to do something a little bit more interesting for our main idea. We thought that using the camera's input to scan the barcode would be a good idea as it means the student doesn't have to remember (or even know) their ID number or moodle login details. Currently a student has to log in to moodle to check their timetable which is very slow and inefficient because you have to go through several different pages and menus to get to the timetable. We thought that being able to just point your phone at your ID card and have your timetable shown instantly would be much quicker and more efficient. We also thought that using a camera input would be a good experiment to try as none of us had really worked with camera input before, and iOS/swift have built in functions for scanning both QR codes and regular barcodes. We thought it would be an interesting experiment to use it and see how it would be implemented in a real-world situation.


## Delegated Roles

### Matt's Role
_coming_

### Geoff's Role
Geoff has been assigned the role of creating the functionality for the timesheet edit. He was helpful in the wireframe design, by asking critical questions, providing reasoned answers and strongly contributing to the design of the edit page. Geoff will now need to create the edit page in the app as per the spec of the wireframe.

### Ashton's Role
Since we were wanting to use the phone's camera to scan the ID cards, Ashton was assigned to work on figuring out how to use and display the camera input, and use it to detect and scan a barcode on the cards. Originally we discussed using ARKit to achieve this, however we realised that this was actually unneccessary for just a barcode scanner. Ashton did some research and discovered that iOS and swift actually have QR code and barcode reading supported natively by the camera, so he has looked into how to use that and will be using it in our app to scan the barcodes on the student ID's. 

### Cody's Role
_coming_

### Amber's Role
_coming_
