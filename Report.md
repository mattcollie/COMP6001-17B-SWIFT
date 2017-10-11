# COMP6001 17B Swift Report


## Detailed Plan
In this report we will discuss the plan for our Swift Timesheet Application. The Swift Timesheet Application will be a mobile app for the iPhone device specifically. The goal of the application is to produce a detailed timesheet for the scanned or searched object, for example you will have the capability to scan or input a room number or a student identification card and be produced with a timesheet display on the mobile device. The Swift Timesheet Application will utilize some builtin functionality of iOS 11 to scan the barcode for the student identification card and scan the room number, the Application will also utilize network capabilities to talk to an API which will store and maintain student, room and timesheet information. With these tools and technologies combined the application will be able to produce accurate timesheets that can be presented to the user in real time.

## Wire-Frames
wire-frames are not representitive of the whole page where content is white space, this is due to the exporting tool.

### Info Page
![info page](/wire-frames/settings_page.png)

### Timesheet Edit Page
![timesheet edit page](/wire-frames/Timesheet_Edit_Page.png)

### Timesheet Display Page
#### display
![portrait](/wire-frames/Timesheet_Display_Page.png)

#### edit clicked
![portrait edit](/wire-frames/Timesheet_Display_Page_Edit.png)

### Scan Page
![scan page](/wire-frames/Scan_Page.png)

### Search Page
![search page](/wire-frames/Search_Page.png)


## Tools Used

### Slack
The team decided to use Slack as the tool for communicating between team members. Slack is an industry standard for communication, and because everyone in the team has had extensive use with it we determined it would be the best suited tool for our team to use. One alternative which was considered was Facebook's Group Chat, but because it lacks professionalism, the ability for easy and seamless collaboration, useful integrations with Github, Trello etc etc, we found that Slack would be more useful to us as individual collaborators and developers working together in the team.

### Trello
We have decided to use Trello as our project manangement system because it is most familiar and utilizes our needs collectively. Within the team there is experience using Trello so it was the first application considered, another application for a project management system considered was Github Projects, this was dismissed as it appeared less interactive then the original option Trello which is customizable with cats as the main theme. Trello also has Github interaction which allows Github repositories to become linked to the cards and tasks which gives us insight into our Github project and branch at hand. Trello also has an interactive mobile application where we can view/update/delete cards on the fly, which is handy for on the go updating.

### Github
GitHub is an open source Version Control System.  It has over 20 million developers making it the biggest community of online developers.  Can allow administrative rights, linking to Trello our Project Management Platform and Slack our Communication Platform.  The benefits of choosing GitHub;
-    **Built-in tagging system:** Allows you to organize and prioritize your workflow and to easily search through projects for relevant information.
-    **Milestones:** Perfect for associating issues with specific features or project phases, such as bugs that need to be fixed before a beta launch or tasks to be completed in October.
-    **Multi assignments:** Issues can be assigned to users in bulk, saving time and making you more efficient.
-    **Commenting:** can easily discuss progress and results at every step of the way using the inbuilt commenting system.
-    **Task lists:** Larger issues can be broken down into stages to discourage the creation of dozens of microscopic issues, keeping all of your work in the same place.
-    **Markdown format:** ability to use markdown formatting will prove popular with your developers, and it can be used in most places around GitHub.
-    **Project boards:** can be used to house issues, pull requests and notes, categorizing them as cards in columns of your choosing so you can look at larger projects.
-    **High security:** GitHub  keeps data safe, and it’s harder to breach than most other project management systems.

### XCode
For our coding software we chose to use xCode as there is no other way of coding with Swift, however xCode does come with plenty of benefits such as a really easy and functional interface builder. xCode also allows us to deploy our our newly written code to an iOS VM of our choice, proving to be highly beneficial when it comes to sizing and adapting aspects of our designs. Also xCode is really fun to code in and very straightforward.

### Camera Input
We decided to use the phone's built in camera to scan the barcode on a student's ID card, rather than just entering their ID number into a text box or something like that. Of course, we do have an option to just enter the number in case the card isn't scanning or the student doesn't have one, but we wanted to do something a little bit more interesting for our main idea. We thought that using the camera's input to scan the barcode would be a good idea as it means the student doesn't have to remember (or even know) their ID number or moodle login details. Currently a student has to log in to moodle to check their timetable which is very slow and inefficient because you have to go through several different pages and menus to get to the timetable. We thought that being able to just point your phone at your ID card and have your timetable shown instantly would be much quicker and more efficient. We also thought that using a camera input would be a good experiment to try as none of us had really worked with camera input before, and iOS/swift have built in functions for scanning both QR codes and regular barcodes. We thought it would be an interesting experiment to use it and see how it would be implemented in a real-world situation.


## Delegated Roles

### Matt's Role
Matt has been given the role to build the Api logic within the mobile application to interface with our chosen Api and creating an information page. He will have to communicate with each person as to how the Api Logic will be used within the app. Matt was helpful within the wire-framing process giving considering to each pages layout and design. Matt will need to now create the Api Logic layer to allow communication to each of the pages then create an information page to display information about the application.

### Geoff's Role
Geoff has been assigned the role of creating the functionality for the timesheet edit. He was helpful in the wireframe design, by asking critical questions, providing reasoned answers and strongly contributing to the design of the edit page. Geoff will now need to create the edit page in the app as per the spec of the wireframe.

### Ashton's Role
Since we were wanting to use the phone's camera to scan the ID cards, Ashton was assigned to work on figuring out how to use and display the camera input, and use it to detect and scan a barcode on the cards. Originally we discussed using ARKit to achieve this, however we realised that this was actually unneccessary for just a barcode scanner. Ashton did some research and discovered that iOS and swift actually have QR code and barcode reading supported natively by the camera, so he has looked into how to use that and will be using it in our app to scan the barcodes on the student ID's. 

### Cody's Role
Cody's role in this assessment is to create the timetable display. For this he will be using a listview as it is will be very functional and easier for the user to navigate. The list view will be beneficial on a mobile display as it will use most of the screen efficiently, while allowing the user to read the info quickly.

### Amber's Role
Amber has been given the role of developing the Search page.  During our meeting we all contributed to the design of wireframes for our app.  Matt was at the computer and we all contributed.  Confirming screen sizes, using our previous research to determine the functionality of each page, using best practices and more importantly designing each wireframe with 'what the user expects to happen' as our main focus.  Using draw.IO,  Ashton had his iPhone which I found useful to visualize my ideas has I was contributing them.  Geoff is very knowledgeable and answered many of my questions.  Cody was also very good at contributing ideas, and confirming which ones to keep.  I contributed a lot of the 'best practice' ideas, I felt we all equally contributed to the design and functionality.  I was brought up to speed as it was my first team meeting.  I will be developing the search page as per our wireframes.  The search page originally was going to offer more functionality such as editing, we had agreed that this would now be another screen.  In relation to GitHub being one of the composable   We have a set of microservices and mesh applications combined for our app functionality.  Composable services. I found this definition of composable services dictionary.com;
> Composable services  
: verb (used with object), composed,composing.
1. to make or form by combining things, parts, or elements:
He composed his speech from many research notes.
2. to be or constitute a part or element of: a rich sauce composed of many ingredients.
3. to make up or form the basis of: Style composes the essence of good writing.
4. to put or dispose in proper form or order: to compose laws into a coherent system.
5.Art. to organize the parts or elements of (a picture or the like).
6. to create (a musical, literary, or choreographic work).
7. to end or settle (a quarrel, dispute, etc.): The union and management composed their differences.

All these definitions (including the sentence examples) are relevant use definitions they are all reasons for Team Shwifty, selected.  
GitHub is an example of a composable service to make or take form using collaborations including parts of code, things each team member adds in accordance with team repository set up.  Is considered and combined by authorized personal.  
As team, we are contributing ‘part or element’ of project and app code. Forming / making up the basis of the ability to work on versions of the latest code.  
Definition 4 has the example ‘to compose laws into a coherent system’ and the ability to check off tasks, relate them to a Trello to do list puts GitHub under this definition.  Doing the things in the right order.
5 and 6 both relate to art and creativity, taking away mundane repetitive code tasks, offering the open source cloneable code that can be created upon and added to.  
Definition 7 also relates to GitHub with the functionality of the issues tab of which team members can paste code, questions to the team or specific members (collaborators) with a notification, option to let continuation happen after the issue has been solved.
All designed to utilize cloud, data and *[AI]: Artificial Intelligence.
*[API]’s: Application Platform Interfaces for topic specific third party data sources, these selectable data sets become available for day to day business processes.  Also, Sensor data, continual stream of data intake.  These provide software developers with editable data in mass amounts.  All make changes to the business process.    
To plan and develop we need to use the best mix of these tools with the right amount of understanding of each tool to make them beneficial.
