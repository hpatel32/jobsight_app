import 'package:flutter/material.dart';

void main() => runApp(SafetyMeeting());

class SafetyMeeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafetyMeetingPage(),
    );
  }
}



class SafetyMeetingPage extends StatefulWidget {
  @override
  _SafetyMeetingPageState createState() => _SafetyMeetingPageState();
}

class _SafetyMeetingPageState extends State<SafetyMeetingPage> {
  bool jobScopeVal = false;
  bool otherWorkVal = false;
  bool standardPPEVal = false;
  bool musterVal = false;
  bool firstaidVal = false;
  bool emergContactVal = false;

  String _meetingTypeValue = "1";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Safety Meeting'),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 10.0,
          ),
          child: Column(
              children: [
                Row(
                  children: [
                    Container(width: 75,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                        decoration: InputDecoration(
                          labelText: "Date:",
                        ),
                        // controller: _dateController,  need to include this later
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(width: 50,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                        decoration: InputDecoration(
                          labelText: "Time:",
                        ),
                        // controller: _dateController,  need to include this later
                      ),
                    ),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                        value: _meetingTypeValue,
                        //labelText: 'Test',
                        items: [
                          DropdownMenuItem(
                            child: Text("Select 1", style: TextStyle(fontSize: 14),),
                            value: "1",
                          ),
                          DropdownMenuItem(
                            child: Text("Toolbox meeting", style: TextStyle(fontSize: 14),),
                            value: "Toolbox/tailgate Meeting",
                          ),
                          DropdownMenuItem(
                            child: Text("Pre-job Safety Meeting", softWrap: true, style: TextStyle(fontSize: 14),),
                            value: "Pre-job Safety Meeting",
                          ),
                          DropdownMenuItem(
                            child: Text("General Safety Meeting", softWrap: true, style: TextStyle(fontSize: 14),),
                            value: "General Safety Meeting",
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _meetingTypeValue = value;
                          });
                        }),
                  ],
                ),

                SizedBox(height: 6.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Company:',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(4),
                      )),
                ),
                SizedBox(height: 1.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Location:',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(4),
                      )),
                ),
                SizedBox(height: 1.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Work Activity:',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(4),
                      )),
                ),
                SizedBox(height: 3.0),
                Text('General Safety Items'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),

                      color: Colors.blue[100],
                    ),

                    //  color: Colors.blue[100],
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              checkbox("Required PPE", standardPPEVal),
                              checkbox("Muster Points", musterVal),
                            ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              checkbox("Job Scope", jobScopeVal),
                              checkbox("First Aid", firstaidVal),
                            ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              checkbox("Other Work", otherWorkVal),
                              checkbox("Emerg Contact", emergContactVal),
                            ]
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0, top: 4.0),
                  child: TextField(
                      maxLines: null,
                      minLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Topics Discussed:',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(4),
                      )),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0, top: 4.0),
                  child: TextField(
                      maxLines: null,
                      minLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Employee Concerns/Input:',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(4),
                      )),
                ),
              ],
          ),
        ),
      ),
    );
  }

 Widget checkbox(String title, bool boolValue) {
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: <Widget>[
       Text(title,style: TextStyle(fontSize: 14),),
       Checkbox(
         value: boolValue,
         onChanged: (bool value) {
           setState(() {
             switch (title) {
               case "Required PPE":
                 standardPPEVal = value;
                 break;
               case "Job Scope":
                 jobScopeVal = value;
                 break;
               case "Other Work":
                 otherWorkVal = value;
                 break;
               case "Muster Points":
                 musterVal = value;
                 break;
               case "First Aid":
                 firstaidVal = value;
                 break;
               case "Emerg Contact":
                 emergContactVal = value;
                 break;
             }
           });
         },
       )
     ],
   );
 }
}