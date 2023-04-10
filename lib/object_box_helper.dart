import 'package:objectbox/objectbox.dart';
import 'package:objet_box_todo/objectbox.g.dart';
import 'package:objet_box_todo/todo_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxHelper {
  static ObjectBoxHelper? _objectBoxHelper;
  static Store? _store;
  Box<TodoModel>? _todoBox;

  ObjectBoxHelper._init(store) {
    _todoBox = Box<TodoModel>(store);
  }

  static Future<ObjectBoxHelper?> init() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Store.isOpen(join(dir.path, 'todo_object_box'))) {
      _store = Store.attach(getObjectBoxModel(), join(dir.path, 'todo_object_box'));
    } else {
      _store = await openStore(directory: join(dir.path, 'todo_object_box'));
    }
    _objectBoxHelper ??= ObjectBoxHelper._init(_store);
    return _objectBoxHelper;
  }

  TodoModel? getTodoItem(int id) => _todoBox!.get(id);

  Stream<List<TodoModel>> getTodoList() => _todoBox!
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());

  int insert(TodoModel todo) => _todoBox!.put(todo);

  int update(TodoModel todo) => _todoBox!.put(todo, mode: PutMode.update);

  bool delete(int id) => _todoBox!.remove(id);
}
