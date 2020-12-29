import 'package:flutter/material.dart';

class Observations extends StatefulWidget {
  @override
  // TODO: implement createState
  _AddObservationsState createState() => _AddObservationsState();
}


class _AddObservationsState extends State<Observations> {
  String _routineValue = "Yes";
  String _competentValue = "Select";
  bool rushVal = false;
  bool focusVal = false;
  bool poorCommVal = false;
  bool familiarVal = false;
  bool awareVal = false;
  bool fatigueVal = false;
  bool complacentVal = false;
  bool bodyPosVal = false;
  bool poorHazIDVal = false;
  bool shortcutVal = false;
  bool followProcVal = false;
  bool inadPPEVal = false;
  bool poorLiftVal = false;
  bool JsaSopVal = false;
  bool StdHoursVal = false;
  bool StdWkLoadVal = false;
  bool supervisionVal = false;
  bool cleanVal = false;
  bool accessToPPEVal = false;
  bool lightingVal = false;
  bool ergonomicalVal = false;
  bool ventilationVal = false;
  bool accessEgressVal = false;
  bool wrongToolVal = false;
  bool trainingVal = false;
  bool inspectedVal = false;
  bool guardsVal = false;
  bool goodRepairVal = false;
  bool toolAccessVal = false;

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
                case "Rushing":
                  rushVal = value;
                  break;
                case "Not focused":
                  focusVal = value;
                  break;
                case "Poor Comms":
                  poorCommVal = value;
                  break;
                case "unfamiliar":
                  familiarVal = value;
                  break;
                case "Poor awareness":
                  awareVal = value;
                  break;
                case "Fatigued":
                  fatigueVal = value;
                  break;
                case "Complacent":
                  complacentVal = value;
                  break;
                case "Poor Body Pos":
                  bodyPosVal = value;
                  break;
                case "Poor Hazard ID":
                  poorHazIDVal = value;
                  break;
                case "Taking Shortcut":
                  shortcutVal = value;
                  break;
                case "Proc not followed":
                  followProcVal = value;
                  break;
                case "Inadequate PPE":
                  inadPPEVal = value;
                  break;
                case "Poor Lifting":
                  poorLiftVal = value;
                  break;
                case "No JSA/SOP":
                  JsaSopVal = value;
                  break;
                case "Non Standard Work Hours":
                  StdHoursVal = value;
                  break;
                case "Non-standard workload":
                  StdWkLoadVal = value;
                  break;
                case "Supervision not present":
                  supervisionVal = value;
                  break;
                  // facility conditions
                case "Not Clean/Orderly":
                  cleanVal = value;
                  break;
                case "Limited Access to FA/PPE":
                  accessToPPEVal = value;
                  break;
                case "Poor Lighting":
                  lightingVal = value;
                  break;
                case "Not Ergonomical":
                  ergonomicalVal = value;
                  break;
                case "Poor Ventilation":
                  ventilationVal = value;
                  break;
                case "Poor Access/Egress":
                  accessEgressVal = value;
                  break;
                  // tools and equipment below
                case "Using Wrong Tool":
                  wrongToolVal = value;
                  break;
                case "Not Trained in Use":
                  trainingVal = value;
                  break;
                case "Not Inspected":
                  inspectedVal = value;
                  break;
                case "Damaged Guards":
                  guardsVal = value;
                  break;
                case "Not in good repair":
                  goodRepairVal = value;
                  break;
                case "Limited Access":
                  toolAccessVal = value;
                  break;

              }
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Job Observation'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 5.0,
          ),
          child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Container(width: 125,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                        decoration: InputDecoration(
                          labelText: "Date:",
                        ),
                        // controller: _dateController,  need to include this later
                      ),
                    ),
                    SizedBox(width: 15),
                    Text('Routine Work?  ',style: TextStyle(fontSize: 14),),
                    SizedBox(width: 15),
                    Container(
                      child: DropdownButton<String>(
                          value: _routineValue,
                          items: [
                            DropdownMenuItem(
                              child: Text("YES", style: TextStyle(fontSize: 14),),
                              value: "Yes",
                            ),
                            DropdownMenuItem(
                              child: Text("NO", style: TextStyle(fontSize: 14),),
                              value: "No",
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _routineValue = value;
                            });
                          }),
                    )
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
                        labelText: 'Work Performed:',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(4),
                      )),
                ),
                SizedBox(height: 1.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Employee Observed (name used with permission):',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(4),
                      )),
                ),
                SizedBox(height: 1.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Observer:',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(4),
                      )),
                ),
                SizedBox(height: 1.0),
                Text('Worker State:'),

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
                            checkbox("Rushing", rushVal),
                            checkbox("Poor Comms", poorCommVal),
                            checkbox("Poor awareness", awareVal),


                          ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                          checkbox("Not focused", focusVal),
                          checkbox("Complacent", complacentVal),
                        ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              checkbox("unfamiliar", familiarVal),
                              checkbox("Fatigued", fatigueVal),
                            ]
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1.0),
                Text('Worker Activities:'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Colors.blue[50],
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              checkbox("Poor Body Pos", bodyPosVal),
                              checkbox("Poor Hazard ID", poorHazIDVal),
                            ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              checkbox("Taking Shortcut", shortcutVal),
                              checkbox("Proc not followed", followProcVal),
                            ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              checkbox("Inadequate PPE", inadPPEVal),
                              checkbox("Poor Lifting", poorLiftVal),
                            ]
                        ),
                      ],
                    ),
                  ),
                ),
                Text('Work Conditions:'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Colors.blue[100],
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              checkbox("No JSA/SOP", JsaSopVal),
                              checkbox("Non Standard Work Hours", StdHoursVal),
                            ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              checkbox("Supervision not present", supervisionVal),
                              checkbox("Non-standard workload", StdWkLoadVal),
                            ]
                        ),
                      ],
                    ),
                  ),
                ),
                Text('Facility Conditions:'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Colors.blue[50],
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              checkbox("Not Clean/Orderly", cleanVal),
                              checkbox("Limited Access to FA/PPE", accessToPPEVal),
                            ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              checkbox("Poor Lighting", lightingVal),
                              checkbox("Not Ergonomical", ergonomicalVal),
                            ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              checkbox("Poor Ventilation", ventilationVal),
                              checkbox("Poor Access/Egress", accessEgressVal),
                            ]
                        ),
                      ],
                    ),
                  ),
                ),
                Text('Condition of Tools/Eqipment:'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Colors.blue[100],
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              checkbox("Using Wrong Tool", wrongToolVal),
                              checkbox("Not Trained in Use", trainingVal),
                            ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              checkbox("Not Inspected", inspectedVal),
                              checkbox("Damaged Guards", guardsVal),
                            ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              checkbox("Not in good repair", goodRepairVal),
                              checkbox("Limited Access", toolAccessVal),
                            ]
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Briefly describe the job observed',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(4),
                      )),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Describe unsafe acts/conditions bserved',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(4),
                      )),
                ),


                Row(
                  children: [
                    Text('The Observed Employee...  '),
                    Container(
                      child: DropdownButton<String>(
                          value: _competentValue,
                          items: [
                            DropdownMenuItem(
                              child: Text("Select", style: TextStyle(fontSize: 14),),
                              value: "Select",
                            ),
                            DropdownMenuItem(
                              child: Text("Performed Competently", style: TextStyle(fontSize: 14),),
                              value: "Performed His/Her job competently",
                            ),
                            DropdownMenuItem(
                              child: Text("requires more training", style: TextStyle(fontSize: 14),),
                              value: "May require additional training",
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _competentValue = value;
                            });
                          }),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Builder(
                      builder: (context) {
                        // The basic Material Design action button.
                        return RaisedButton(
                          // If onPressed is null, the button is disabled
                          // this is my goto temporary callback.
                          onPressed: () => print('Save button PRESSED'),
                          color: Colors.blue[100],
                          child: Text('  Save  '),
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
                          onPressed: () => print('Clear button PRESSED'),
                          color: Colors.blue[100],
                          child: Text('  Clear  '),
                        );
                      },
                    ),
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }
}