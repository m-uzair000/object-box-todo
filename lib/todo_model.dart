import 'package:objectbox/objectbox.dart';

@Entity()
class TodoModel {
  @Id(assignable: true)
  int id;
  String title, description;

  TodoModel({
    this.id = 0,
    required this.title,
    required this.description,
  });
}
