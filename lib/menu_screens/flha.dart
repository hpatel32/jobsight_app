import 'package:flutter/material.dart';

class FLHAs extends StatefulWidget {

  @override
  _AddFLHAsState createState() => _AddFLHAsState();
}

class _AddFLHAsState extends State<FLHAs> {
  String _value = "1";
  String _frequencyValue = "01";
  String _severityValue = "001";
  TextEditingController _revisionController = new TextEditingController(text: '1');
  TextEditingController _dateController = new TextEditingController();
  TextEditingController _completedByController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new FLHA'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Company:',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: "Job Title:",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    )),
              ),

              Row(
                children: <Widget> [
                  Container(width: 160,
                    child: TextField(
                      style: TextStyle(
                            fontSize: 12.0,
                        ),
                      decoration: InputDecoration(
                        labelText: 'Completed By:',
                      ),
                      controller: _completedByController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(width: 80,
                    child: TextField(
                      style: TextStyle(
                      fontSize: 12.0,
                    ),
                        decoration: InputDecoration(
                          labelText: "Date:",
                        ),
                      controller: _dateController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(width: 30,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                      decoration: InputDecoration(
                        labelText: "Rev:",
                      ),
                      controller: _revisionController,),
                  ),
                ]
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: "Job Step 1:",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 4.0),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: "Hazards 1:",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    )),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 4.0),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: "Controls 1:",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    )),
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Builder(
                      builder: (context) {
                        // The basic Material Design action button.
                        return RaisedButton(
                          // If onPressed is null, the button is disabled
                          // this is my goto temporary callback.
                          onPressed: () => print('Job Step button PRESSED'),
                          color: Colors.blue[100],
                          child: Text('ADD JOB STEPS'),
                        );
                      },
                    ),
                    SizedBox(width: 20),
                    Builder(
                      builder: (context) {
                        // The basic Material Design action button.
                        return RaisedButton(
                          // If onPressed is null, the button is disabled
                          // this is my goto temporary callback.
                          onPressed: () => print('Cancel button PRESSED'),
                          color: Colors.blue[100],
                          child: Text('  CANCEL  '),
                        );
                      },
                    ),
                  ]
              ),
              SizedBox(height: 15,),
              ////   This is where i would like to have additional job step, hazard, and
              //// controls rows inserted when i click the add job steps button
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: DropdownButton<String>(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Select Potential", style: TextStyle(fontSize: 12),),
                      value: "1",
                    ),
                    DropdownMenuItem(
                      child: Text("Have never heard of an injury", style: TextStyle(fontSize: 12),),
                      value: "I have never heard of anyone being injured performing this job",
                    ),
                    DropdownMenuItem(
                      child: Text("Injuries in industry over a year ago", softWrap: true, style: TextStyle(fontSize: 12),),
                      value: "I have heard of someone being injured in our industry but it was well over a year ago",
                    ),
                    DropdownMenuItem(
                      child: Text("Company emp hurt over a year ago", softWrap: true, style: TextStyle(fontSize: 12),),
                      value: "Someone within this company has been hurt performing this job over a year ago",
                    ),
                    DropdownMenuItem(
                      child: Text("Heard of several instances of injury", softWrap: true, style: TextStyle(fontSize: 12),),
                      value: "I have heard of several instances of someone being injured",
                    ),
                    DropdownMenuItem(
                      child: Text("Several injuries within company this year", softWrap: true, style: TextStyle(fontSize: 12),),
                      value: "I have heard of several instances of someone hurt",
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),

                ),
                //child: TextField(
                //    decoration: InputDecoration(
                //      labelText: "Potential for Injury/Loss",
                //      border: OutlineInputBorder(),
                //      contentPadding: EdgeInsets.all(4),
                //    )),

              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: DropdownButton<String>(
                    value: _frequencyValue,
                    items: [
                      DropdownMenuItem(
                        child: Text("Select Frequency", style: TextStyle(fontSize: 12),),
                        value: "01",
                      ),
                      DropdownMenuItem(
                        child: Text("We seldom perform this job", style: TextStyle(fontSize: 12),),
                        value: "We seldom perform this job",
                      ),
                      DropdownMenuItem(
                        child: Text("Weekly < 5 people exposed", softWrap: true, style: TextStyle(fontSize: 12),),
                        value: "On average we perform this job weekly with less than 5 people exposed",
                      ),
                      DropdownMenuItem(
                        child: Text("Weekly > 5 people exposed", softWrap: true, style: TextStyle(fontSize: 12),),
                        value: "On average we perform this job weekly with more than 5 people exposed",
                      ),
                      DropdownMenuItem(
                        child: Text("Daily < 5 people exposed", softWrap: true, style: TextStyle(fontSize: 12),),
                        value: "On average we perform this job daily with less than 5 people exposed",
                      ),
                      DropdownMenuItem(
                        child: Text("Daily > 5 people exposed", softWrap: true, style: TextStyle(fontSize: 12),),
                        value: "On average we perform this job daily with more than 5 people exposed",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _frequencyValue = value;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: DropdownButton<String>(
                    value: _severityValue,
                    items: [
                      DropdownMenuItem(
                        child: Text("Select Injury Severity", style: TextStyle(fontSize: 12),),
                        value: "001",
                      ),
                      DropdownMenuItem(
                        child: Text("First Aid Injuries", style: TextStyle(fontSize: 12),),
                        value: "I have heard of first aid injuries related to the performance of this job",
                      ),
                      DropdownMenuItem(
                        child: Text("Medical Aid Injuries", softWrap: true, style: TextStyle(fontSize: 12),),
                        value: "I have heard of someone needing to see a Doctor related to the performance of this job",
                      ),
                      DropdownMenuItem(
                        child: Text("Restricted Work Injuries", softWrap: true, style: TextStyle(fontSize: 12),),
                        value: "We could experience someone on restricted duty related to the performance of this job",
                      ),
                      DropdownMenuItem(
                        child: Text("Lost time injuries", softWrap: true, style: TextStyle(fontSize: 12),),
                        value: "We could experience someone losing days from work related to performance of this job",
                      ),
                      DropdownMenuItem(
                        child: Text("I have heard of fatal injuries with this job", softWrap: true, style: TextStyle(fontSize: 12),),
                        value: "On average we perform this job daily with more than 5 people exposed",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _severityValue = value;
                      });
                    }),
              ),
              Builder(
                builder: (context) {
                  // The basic Material Design action button.
                  return RaisedButton(
                    // If onPressed is null, the button is disabled
                    // this is my goto temporary callback.
                    onPressed: () => print('Signature button PRESSED'),
                    color: Colors.blue[100],
                    child: Text('  Add Signature  '),
                  );
                },
              ),
              SizedBox(height: 75,)
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("Save FLHA"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed:(){},
      ),
    );
  }
}