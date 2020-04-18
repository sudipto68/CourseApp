import 'package:courseapp/model/course.dart';
import 'package:courseapp/model/instructor.dart';
import 'package:courseapp/model/order.dart';
import 'package:courseapp/model/user.dart';


//course
final _wordpress =
    Course(imageUrl: 'assets/images/word.png', name: 'Wordpress', price: 9.99, rating: 3,instructor: 'Moshiur Rahman');
final _react =
    Course(imageUrl: 'assets/images/react.png', name: 'React Native', price: 14.99, rating: 5, instructor: 'Angela Yu');
final _reactjs =
    Course(imageUrl: 'assets/images/reactjs.png', name: 'React js', price: 11.99, rating: 4,instructor: 'James Williams');
final _flutter =
    Course(imageUrl: 'assets/images/fluttter.png', name: 'Flutter Development', price: 10.99, rating: 5,instructor: 'James Williams');
final _python =
    Course(imageUrl: 'assets/images/python.png', name: 'Python For Begineer', price: 8.99,rating: 4,instructor: 'Marry Xia');
final _ios =
    Course(imageUrl: 'assets/images/ios.png', name: 'Ios Development', price: 14.99, rating: 5,instructor: 'Angela Yu');
final _android =
    Course(imageUrl: 'assets/images/android.png', name: 'Android Development', price: 15.99, rating: 4,instructor: 'Angela Yu');


final List<Course> courses = [
  _react,
  _reactjs,
  _ios,
  _flutter,
  _python,
  _wordpress,
  _android,
  
];

//instructor

final _instructor0 = Instructor(
  imageUrl: 'assets/images/restaurant0.jpg',
  name: 'Moshiur Rahman',
  rating: 4,
  courses: [_python, _wordpress, _reactjs],
);
final _instructor1 =  Instructor(
  imageUrl: 'assets/images/restaurant1.jpg',
  name: 'Angela Yu',
  rating: 5,
  courses: [_flutter, _android, _ios,_react],
);
final _instructor2 =  Instructor(
  imageUrl: 'assets/images/restaurant2.jpg',
  name: 'Alexandar',
  rating: 5,
  courses: [_flutter, _ios, _react,],
);
final _instructor3 =  Instructor(
  imageUrl: 'assets/images/restaurant3.jpg',
  name: 'James Williams',
  rating: 4,
  courses: [_flutter, _react,_python,_wordpress],
);
final _instructor4 =  Instructor(
  imageUrl: 'assets/images/restaurant4.jpg',
  name: 'Marry Xia',
  rating: 3,
  courses: [_python, _reactjs],
);

final List<Instructor> instructor = [
  _instructor0,
  _instructor1,
  _instructor2,
  _instructor3,
  _instructor4,
];



// User
final currentUser = User(
  name: 'Sudipto Mitro',
  orders: [
   Order(
      course: _flutter,
      instructor: _instructor1,
      quantity: 1,
    ),
    Order(
      course: _python,
      instructor: _instructor0,
      quantity: 1,
    ),
    Order(
      course: _wordpress,
      instructor: _instructor0,
      quantity: 1,
    ),
    Order(
      course: _ios,
      instructor: _instructor1,
      quantity: 1,
    ),
  ],
  cart: [
    Order(
      course: _flutter,
      instructor: _instructor1,
      quantity: 1,
    ),
     Order(
      course: _ios,
      instructor: _instructor1,
      quantity: 1,
    ),
  ],
);
