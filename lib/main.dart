import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safetycheckconsulting/UI/custominputfield.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:safetycheckconsulting/menu_screens/flha.dart';
import 'package:safetycheckconsulting/menu_screens/hazardid.dart';
import 'package:safetycheckconsulting/menu_screens/observations.dart';
import 'package:safetycheckconsulting/menu_screens/calendar.dart';
import 'package:safetycheckconsulting/menu_screens/safety_meeting.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'JobSight Login',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  final _usercontroller = TextEditingController();
  final _companycontroller = TextEditingController();
  final _passcontroller = TextEditingController();
// I would like to create a database in the app that will only accept 1 row or record and will include
  // username, company, and password.  I can use this later to sync files with safetycheckconsulting.com
  // (localhost during development)
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: Colors.blue,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 400,
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      './images/checkbox2.png', width: 150, height: 150,),
                    Text('JobSight', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    ), Text('by Safety Check Consulting', style: TextStyle(
                      fontSize: 15,
                    ),
                    ),
                    SizedBox(width: 10, height: 15),
                    CustomInputField(
                        Icon(Icons.person, color: Colors.white), 'Username', _usercontroller),
                    CustomInputField(
                        Icon(Icons.work, color: Colors.white), 'Company', _companycontroller),
                    CustomInputField(
                        Icon(Icons.lock_open, color: Colors.white), 'Password', _passcontroller),

                    Container(
                      width: 150,
                      child: RaisedButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomeScreen()),
                        );
                      },
                        color: Colors.blue[900],
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0))),
                        child: Text('Login', style: TextStyle(
                          fontSize: 20,
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),

      ),

      body: Center(
        child: Stack(
          children: <Widget>[
            Column(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: IconButton(icon: Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.blue,
                      size: 125.0,
                      semanticLabel: 'Text to announce in accessibility modes'),
                    constraints: BoxConstraints(
                      minHeight: 130.0,
                      minWidth: 140.0,
                    ),
                      onPressed:  () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeCalendarPage()),//CalendarScreen()),
                        );
                      },
                    ),
                  ),
                  Text('View your calendar',style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: IconButton(icon: Icon(
                      Icons.check_box_rounded,
                      color: Colors.blue,
                      size: 125.0,
                      semanticLabel: 'click to view assigned tasks',
                    ),
                      constraints: BoxConstraints(
                        minHeight: 130.0,
                        minWidth: 140.0,
                      ),
                      onPressed:  () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TaskScreen()),
                        );
                      },
                    ),
                  ),
                  Text('View your assigned task List',style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: IconButton(icon: Icon(
                      Icons.school_rounded,
                      color: Colors.blue,
                      size: 125.0,
                      semanticLabel: 'View/Update your training',
                    ),
                    constraints: BoxConstraints(
                      minHeight: 130.0,
                      minWidth: 140.0,
                    ),
                    onPressed:  () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TrainingScreen()),
                      );
                    },
                  ),
                  ),
                  Text('View/Update your training',style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                  ),
                ],
              ),
          ]
        )
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('JOBSIGHT MENU'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.mode_edit,
                color: Colors.blue,
              ),
              title: Text('ENTER FLHAs'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FLHAs()),
                );
              },
              // Update the state of the app
              // ...
              // Then close the drawer
            ),
            ListTile(
              leading: Icon(
                Icons.mode_edit,
                color: Colors.blue,
              ),
              title: Text('VIEW/EDIT FLHAs'),
              onTap: (){
                Navigator.pop(context);
              },
              // Update the state of the app
              // ...
              // Then close the drawer
            ),
            ListTile(
              leading: Icon(
                Icons.mode_edit,
                color: Colors.blue,
              ),
              title: Text('ENTER HAZARD ID'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HazardID()),
                );
              },
              // Update the state of the app
              // ...
              // Then close the drawer
            ),
            ListTile(
              leading: Icon(
                Icons.mode_edit,
                color: Colors.blue,
              ),
              title: Text('ENTER JOB OBSERVATION'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Observations()),
                );
              },
              // Update the state of the app
              // ...
              // Then close the drawer
            ),
            ListTile(
              leading: Icon(
                Icons.mode_edit,
                color: Colors.blue,
              ),
              title: Text('VIEW/SIGN TOOLBOX TALKS'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SafetyMeetingPage()),
                );
              },
              // Update the state of the app
              // ...
              // Then close the drawer
            ),
            ListTile(
              leading: Icon(
                Icons.library_books_rounded,
                color: Colors.blue,
              ),
              title: Text('VIEW SAFETY MANUAL'),
              onTap: (){
                Navigator.pop(context);
              },
              // Update the state of the app
              // ...
              // Then close the drawer
            ),
            ListTile(
              leading: Icon(
                Icons.close_rounded,
                color: Colors.blue,
              ),
              title: Text('CLOSE MENU'),
              onTap: (){
                Navigator.pop(context);
              },
              // Update the state of the app
              // ...
              // Then close the drawer
            ),
            ListTile(
              leading: Icon(
                Icons.close_rounded,
                color: Colors.blue,
              ),
              title: Text('EXIT APP'),
              onTap: (){
                SystemNavigator.pop();
              },
              // Update the state of the app
              // ...
              // Then close the drawer
            ),
          ],
        )
      ),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("JobSight Calendar"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text("This will be the Calendar Screen. In future builds I would like to add an actual calendar.  "
    "For this initial build however, I could simply perform a database search by company name and display a list of upcoming events. "
            "I will likely limit the list to the next three months"),
      ),   
    );
  }
}
// The calendar screen will get its data from:
//database = safetycheckconsulting_com
//table    = eventcalendar
///////////columns = Company, dateAdded, Detail, eventDate, ID, and Title (title is a short description)

class TaskScreen extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("JobSight Tasks"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text("This is where I will populate a list of tasks that need to be completed"),
      ),
    );
  }
}
// TaskScreen gets its information from
// database = safetycheckconsulting_com
//    table = actionitems
//  columns = Action, Area, Assigned, Company, Complete, Concern, Date, DueDate, Facility, ID, ResultID,
//  ResultOf, SubmittedBy, Supervisor, Title
class TrainingScreen extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("JobSight Tasks"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text("This is where I will populate a list of training certificates."),
      ),
    );
  }
}
//TrainingScreen gets its data from:
// database = safetycheckconsulting_com
// table = training
//  Columns = Company, Course, EmplNum, Expires, ID, Name, Taken