import 'course.dart';
import 'instructor.dart';
class Order {
  final Instructor instructor;
  final Course course;
  final int quantity;

  Order({
    this.course,
    this.instructor,
    this.quantity,
  });
}
