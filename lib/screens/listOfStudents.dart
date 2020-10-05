import 'package:flutter/material.dart';
import 'studentDetails.dart';
import 'package:flutter/cupertino.dart';

class ListOfStudents extends StatefulWidget {

  final String semester;
  ListOfStudents({
    @required this.semester
  });

  @override
  _ListOfStudentsState createState() => _ListOfStudentsState();
}

class _ListOfStudentsState extends State<ListOfStudents> {

  List<String> images = [
    "assets/images/male-1.jpg",
    "assets/images/female-2.jpg",
    "assets/images/male-2.jpg",
    "assets/images/male-3.jpg",
    "assets/images/female-3.jpg",
    "assets/images/female-1.jpg"
  ];

  List<String> titles = ["Brad", "Angela", "Joe", "Harry", "Erica", "Jamie"];

  List<Widget> movies() {
    List<Widget> movieList = new List();

    for (int i = 0; i < images.length; i++) {
      var movieitem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => DetailsOfStudent(
                  name: titles[i],
                  profileImage: images[i],
                  subjectDetails: widget.semester
                )
              )
            );
          },
          child: Container(
            height: 280.0,
            width: 135.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0))
                ]),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                      child: Image.asset(
                        images[i],
                        width: double.infinity,
                        height: 240.0,
                        fit: BoxFit.cover,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                  child: Text(titles[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Raleway"
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      movieList.add(movieitem);
    }
    return movieList;
  }

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
          widget.semester,
          style: TextStyle(
            fontFamily: "Raleway",
            color: Colors.black
          ),
        ),
      ),
      child: MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 32
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: movies(),
            ),
          ),
        ),
      ),
    );
  }
}