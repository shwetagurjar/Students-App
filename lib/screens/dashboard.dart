import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'listOfStudents.dart';

class DashboardScreen extends StatefulWidget {

  final String username;

  DashboardScreen({
    @required this.username
  });

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            CupertinoIcons.left_chevron,
            color: Colors.red,
          ),
        ),
        middle: Text(
          "Dashboard",
          style: TextStyle(
            fontFamily: "Raleway",
            color: Colors.black
          ),
        ),
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12
              ),
              child: Text(
                "Welcome | " + widget.username.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Raleway"
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "This semseter",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Raleway"
                ),
              ),
              expandedAlignment: Alignment.centerLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ListOfStudents(
                          semester: "FA - Foundation V",
                        )
                      )
                    );
                  },
                  title: Padding(
                    padding: EdgeInsets.only(
                      left: 32
                    ),
                    child: Text(
                      "FA - Foundation V",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Raleway"
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ListOfStudents(
                          semester: "MA - Foundation V",
                        )
                      )
                    );
                  },
                  title: Padding(
                    padding: EdgeInsets.only(
                      left: 32
                    ),
                    child: Text(
                      "MA - Foundation V",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Raleway"
                      ),
                    ),
                  ),
                )
              ]
            ),
            ExpansionTile(
              title: Text(
                "Previous semseter",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Raleway"
                ),
              ),
              expandedAlignment: Alignment.centerLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ListOfStudents(
                          semester: "FA - Foundation IV",
                        )
                      )
                    );
                  },
                  title: Padding(
                    padding: EdgeInsets.only(
                      left: 32
                    ),
                    child: Text(
                      "FA - Foundation IV",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Raleway"
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ListOfStudents(
                          semester: "MA - Foundation V",
                        )
                      )
                    );
                  },
                  title: Padding(
                    padding: EdgeInsets.only(
                      left: 32
                    ),
                    child: Text(
                      "MA - Foundation IV",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Raleway"
                      ),
                    ),
                  ),
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}