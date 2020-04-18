import 'course.dart';

class Instructor {
  final String imageUrl;
  final String name;
  final int rating;
  final List<Course> courses;

 Instructor({
    this.imageUrl,
    this.name,
    this.rating,
    this.courses,
  });
}
