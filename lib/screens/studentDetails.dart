import 'package:flutter/material.dart';
import 'dart:math';

class DetailsOfStudent extends StatefulWidget {

  final String name, profileImage, subjectDetails;
  DetailsOfStudent({
    @required this.name,
    @required this.profileImage,
    @required this.subjectDetails
  });

  @override
  _DetailsOfStudentState createState() => _DetailsOfStudentState();
}

class _DetailsOfStudentState extends State<DetailsOfStudent> {

  List listOfDegrees = ["Masters", "Bachelors"];
  List listOfSubjects = ["Sociology", "Psychology", "Political Science", "Philosophy", "Archaeology", "Religious Studies"];
  List<Widget> prevSemSubjectsWidgets = [];

  String degree, course;

  setInitials(){
    Random random = Random();

    var temp = widget.subjectDetails.split("-");
    degree = temp[0];
    course = temp[temp.length - 1];

    for (var i = 0; i < 3; i++) {
      var subject = listOfSubjects[random.nextInt(listOfSubjects.length)];
      var marks = random.nextInt(100);
      Widget tempTile = ListTile(
        title: Padding(
          padding: EdgeInsets.only(
            left: 12
          ),
          child: Text(
            subject,
            style: TextStyle(
              fontFamily: "Raleway"
            ),
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(
            left: 12
          ),
          child: Text(
            marks.toString(),
            style: TextStyle(
              fontFamily: "Raleway"
            ),
          ),
        ),
      );
      prevSemSubjectsWidgets.add(tempTile);
    }
  }

  @override
  void initState() {
    super.initState();
    setInitials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24
            ),
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 32,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.name.toString() + "'s image",
              child: Image.asset(
                widget.profileImage
              )
            ),
            SizedBox(
              height: 64,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24
              ),
              child: Text(
                widget.name.toString(),
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 32
                ),
              ),
            ),
            SizedBox(
              height: 32
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24
              ),
              child: Text(
                "Degree: " + degree,
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 22
                ),
              ),
            ),
            SizedBox(
              height: 18
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24
              ),
              child: Text(
                "Course: " + course,
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 22
                ),
              ),
            ),
            SizedBox(
              height: 18
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24
              ),
              child: Text(
                "Email: " + widget.name.toLowerCase() + "@berkeley.edu",
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 22
                ),
              ),
            ),
            SizedBox(
              height: 18
            ),
            ExpansionTile(
              title: Padding(
                padding: EdgeInsets.only(
                  left: 10
                ),
                child: Text(
                  "Previous Semester",
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 22
                  ),
                ),
              ),
              children: prevSemSubjectsWidgets
            ),
            SizedBox(
              height: 54,
            )
          ],
        ),
      ),
    );
  }
}