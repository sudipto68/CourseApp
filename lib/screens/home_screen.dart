import 'package:courseapp/widget/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:courseapp/data/data.dart';
import 'package:courseapp/model/course.dart';
import 'coursescrren.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildCourses() {
    List<Widget> courseList = [];
    courses.forEach((Course course) {
      courseList.add(
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => CourseScreen(course:course),),);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey[100]),
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                        tag: course.imageUrl,
                        child: Image(
                        height: 90,
                        width: 90,
                        image: AssetImage(course.imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        course.name,
                        style: TextStyle(
                            fontSize: 19.0, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'By ' + course.instructor,style: TextStyle(fontSize: 16.0)
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      RatingStars(course.rating),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text('Price: ' + course.price.toString(),style: TextStyle(fontSize: 14.0),),
                          Text(' \$',style: TextStyle(fontSize: 12.0))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: courseList,
    );
  }

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Course App'),
        centerTitle: true,
        leading: Icon(
          Icons.account_circle,
          size: 25.0,
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 25.0,
                  ),
                  onPressed: () {}),
              Positioned(
                  top: 1.0,
                  right: 2.0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 17.0),
                      Positioned(
                        right: 4.0,
                        top: 2.0,
                        child: Center(
                          child: Text(
                            '${currentUser.cart.length}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 17.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      BorderSide(width: 1.0, color: Colors.orangeAccent),
                ),
                hintText: 'Search Courses or Instructors',
                suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    })),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8),
              ),
              Text(
                'Popular Courses',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
              _buildCourses(),
            ],
          ),
        ],
      ),
    );
  }
}
