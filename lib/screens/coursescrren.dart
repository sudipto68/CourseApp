import 'package:courseapp/model/course.dart';
import 'package:courseapp/model/instructor.dart';
import 'package:courseapp/widget/rating_star.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  final Course course;
  final Instructor instructor;
  CourseScreen({this.course, this.instructor});
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SafeArea(
                child: Hero(
                  tag: widget.course.imageUrl,
                  child: Image(
                    //height: 100.0,
                    width: MediaQuery.of(context).size.width,
                    image: AssetImage(widget.course.imageUrl),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.course.name,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.8),
                    ),
                    Container(
                      height: 33,
                      width: 33,
                      child: FloatingActionButton(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(
                          Icons.add,
                          size: 24.0,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                //SizedBox(height: 1.0),
                Text(
                  'By ' + widget.course.instructor,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4.0),
                RatingStars(widget.course.rating),
                SizedBox(height: 4.0),
                Row(
                  children: <Widget>[
                    Text(
                      'Price: ' + widget.course.price.toString(),
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(' \$', style: TextStyle(fontSize: 13.0)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                        child: Text(
                          'Reviews',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                        child: Text(
                          'Details',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                    child: Text(
                  'Other Courses',
                  style: TextStyle(
                      letterSpacing: 0.8,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                )),
                GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                        widget.instructor.courses.length, (index) {
                          Course courselist = widget.instructor.courses[index];
                          return Center(
                            child: Text(courselist.name),
                          );
                        }),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
