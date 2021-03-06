import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HazardID extends StatefulWidget {
  @override
  // TODO: implement createState
  _AddHazardIDState createState() => _AddHazardIDState();
}

class _AddHazardIDState extends State<HazardID> {
  String _resultOfValue = "1";
  String _hazardValue = "01";
  String _riskValue = "001";
  String _frequencyValue = "0001";
  String _measuresValue = "0011";
  String _reviewedValue = "0111";

  final _datecontroller = TextEditingController();
  final _companycontroller = TextEditingController();
  final _hazardcontroller = TextEditingController();
  final _jobconductedcontroller = TextEditingController();
  final _measurescontroller = TextEditingController();
  final _reviewcontroller = TextEditingController();
  final _locationcontroller = TextEditingController();
  final _clientcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadDatabase();
  }

  Database database;

  loadDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'jobsight.db');

    //await deleteDatabase(path);

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table

      await db.execute(
          'CREATE TABLE hazardids (hazardid INTEGER PRIMARY KEY,date TEXT,company TEXT, location TEXT, client TEXT,resultofselectedvalue TEXT, resultofenteredvalue TEXT,possibilityselectedvalue TEXT, riskselectedvalue TEXT,jobconductedselectedvalue TEXT, jobconductedenteredvalue TEXT,measuresselectedvalue TEXT, measuresenteredvalue TEXT,reviewselectedvalue TEXT, reviewenteredvalue TEXT)');
    });

    List<Map> list = await database.rawQuery('SELECT * FROM hazardids');

    print(list);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Add a Hazard ID'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 10.0,
          ),
          child: Column(children: [
            GestureDetector(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2022))
                    .then((value) {
                  print(value);
                  setState(() {
                    _datecontroller.text = value.toString().substring(0, 10);
                  });
                });
              },
              child: Container(
                width: 100,
                child: TextField(
                  enabled: false,
                  controller: _datecontroller,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                  decoration: InputDecoration(
                    labelText: "Date:",
                  ),
                  // controller: _dateController,  need to include this later
                ),
              ),
            ),
            SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextField(
                  controller: _companycontroller,
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
                  controller: _locationcontroller,
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
                  controller: _clientcontroller,
                  decoration: InputDecoration(
                    labelText: 'Client:',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(4),
                  )),
            ),
            SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text('Hazard ID written as the result of:..'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(4),
                ),
                child: DropdownButton<String>(
                    value: _resultOfValue,
                    //labelText: 'Test',
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Select 1",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "An unsafe act or condition",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "An unsafe act or condition",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "An unsafe condition of equipment",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "An unsafe condition of equipment",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "An unsafe procedure",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "An unsafe procedure",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "A planned job observation",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "A planned job observation",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "A pre-job hazard analysis",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "A pre-job hazard analysis",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "A change in work procedure/scope",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "A change in work procedure/scope",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Recognition of proper safety diligence",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Recognition of proper safety diligence",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _resultOfValue = value;
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _hazardcontroller,
                  minLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Briefly describe the hazard:',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(4),
                  )),
            ),
            SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text('Hazards include the possibility of:..'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(4),
                ),
                child: DropdownButton<String>(
                    value: _hazardValue,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Select 1",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "01",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Potential Slips/Trips/Falls",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Potential Slips/Trips/Falls",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "being struck by or caught in machinery",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "being struck by or caught in machinery",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "over Exertion",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Over exertion",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Pinch points",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Pinch points",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Fire or Explosion",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Fire or Explosion",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Electrocution",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Electrocution",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Exposure to chemicals",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Exposure to chemicals",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "excessive Noise",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "excessive Noise",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "exposure to Extreme temperatures",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "exposure to Extreme temperatures",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Other",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Other",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _hazardValue = value;
                      });
                    }),
              ),
            ),
            SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Risk involved may include:...'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(4),
                ),
                child: DropdownButton<String>(
                    value: _riskValue,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Select 1",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "001",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "possible Fatality",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "possible Fatality",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "possible Lost Time Incident",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "possible Lost Time Incident",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "possible Restricted Duty Incident",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "possible Restricted Duty Incident",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "possible Medical Aid Incident",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "possible Medical Aid Incident",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "possible First Aid Incident",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "possible First Aid Incident",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "possible equipment damage",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "possible equipment damage",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _hazardValue = value;
                      });
                    }),
              ),
            ),
            SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('How often is this job conducted:...'),
            ),
            SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(4),
                ),
                child: DropdownButton<String>(
                    value: _frequencyValue,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Select 1",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "0001",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "frequently by a large crew",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "frequently by a large crew",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "frequently by a small crew",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "frequently by a small crew",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "daily",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "daily",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "weekly",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "weekly",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "monthly or longer",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "monthly or longer",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _frequencyValue = value;
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextField(
                  controller: _jobconductedcontroller,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                    labelText: 'What did you do to address this hazard:',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(4),
                  )),
            ),
            SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Measures that could be put in place:...'),
            ),
            SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(4),
                ),
                child: DropdownButton<String>(
                    value: _measuresValue,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Select 1",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "0011",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Improved procedures or guidelines",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Improved procedures or guidelines",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "More Frequent Inspections",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "More Frequent Inspections",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Improved signage or flagging",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Improved signage or flagging",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Additional training",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Additional training",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Additional PPE",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Additional PPE",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Improved equipment design",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Improved equipment design",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Improved equipment guarding",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Improved equipment guarding",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Additional or improved tools",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "Additional or improved tools",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _measuresValue = value;
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                  controller: _measurescontroller,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    labelText: 'How do you feel these measures will assist:',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(4),
                  )),
            ),
            SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('I would like to see this hazard reviewed:..'),
            ),
            SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(4),
                ),
                child: DropdownButton<String>(
                    value: _reviewedValue,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Select 1",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "0111",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "at the next on site safety meeting",
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "at the next on site safety meeting",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "safety meeting & forwarded to safety dept",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value:
                            "at the next on site safety meeting and forwarded to our safety department",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "by Management",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        value: "by Management",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _reviewedValue = value;
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextField(
                  controller: _reviewcontroller,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'Name (optional):',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(4),
                  )),
            ),
            Row(
              children: [
                Builder(
                  builder: (context) {
                    // The basic Material Design action button.
                    return RaisedButton(
                      // If onPressed is null, the button is disabled
                      // this is my goto temporary callback.
                      onPressed: () async {
                        if (_datecontroller.text.isEmpty) {
                          _scaffoldKey.currentState.showSnackBar(new SnackBar(
                              content: new Text("Date cannot be empty")));

                          print("Date cannot be empty");
                        } else if (_companycontroller.text.isEmpty) {
                          _scaffoldKey.currentState.showSnackBar(new SnackBar(
                              content: new Text("Company cannot be empty")));
                          print("Company cannot be empty");
                        } else {
                          await database.transaction((txn) async {
                            int id1 = await txn.rawInsert(
                                'INSERT INTO hazardids(date,company, location, client,'
                                'resultofselectedvalue, resultofenteredvalue,'
                                'possibilityselectedvalue, riskselectedvalue,jobconductedselectedvalue'
                                ', jobconductedenteredvalue,'
                                'measuresselectedvalue, measuresenteredvalue,reviewselectedvalue, '
                                'reviewenteredvalue) VALUES("${_datecontroller.text.toString()}","${_companycontroller.text.toString()}","${_locationcontroller.text.toString()}","${_clientcontroller.text.toString()}","${_resultOfValue}","${_hazardcontroller.text}","${_hazardValue}","${_riskValue}","${_frequencyValue}",'
                                '"${_jobconductedcontroller.text}","${_measuresValue}","${_measurescontroller.text}","${_reviewedValue}","${_reviewcontroller.text}")');
                            print('inserted1: $id1');
                          });
                        }
                      },
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
            SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }
}
