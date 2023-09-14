import 'package:flutter/material.dart';
import 'package:todo/app/model/todo.dart';
import 'package:todo/app/service/todo_service.dart';
import 'package:todo/app/view/editTodo/editTodo.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        deleteTodoById(
          todo.id.toString(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Todo deleted'),
          ),
        );
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurStyle: BlurStyle.normal,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: (() => {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditToDo(
                        editTodo: todo,
                      ),
                    ))
              }),
          child: ListTile(
            isThreeLine: true,
            leading: Container(
              width: 50,
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.task_rounded,
                color: Colors.black,
                size: 50,
              ),
            ),
            title: Text(
              todo.todoName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              todo.todoDesc,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            trailing: Text(
              todo.todoDate,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
