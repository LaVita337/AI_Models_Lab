import 'package:flutter/material.dart';
import 'package:todo/app/model/todo.dart';
import 'package:todo/app/service/todo_service.dart';
import 'package:flutter/src/material/dropdown.dart';

/*
할 일을 수정하는 화면을 구성합니다. 기존의 할 일 정보 및 제목, 태그, 날짜를 수정할 수 있습니다.
*/

class EditToDo extends StatefulWidget {
  final Todo editTodo;
  const EditToDo({Key? key, required this.editTodo}) : super(key: key);

  @override
  _EditToDoState createState() => _EditToDoState();
}

class _EditToDoState extends State<EditToDo> {
  late TextEditingController taskNameController;
  late TextEditingController taskDescController;
  late String taskDate;
  late String tag;
  String date = '';
  late DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // 기존의 할일 정보를 가져와 초기값으로 설정합니다.
    taskNameController = TextEditingController(text: widget.editTodo.todoName);
    taskDescController = TextEditingController(text: widget.editTodo.todoDesc);
    tag = widget.editTodo.todoTag;
    taskDate = widget.editTodo.todoDate;
  }

  @override
  void dispose() {
    // 컨트롤러를 해제합니다.
    taskNameController.dispose();
    taskDescController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2030));
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void updateTodo() {
    // 수정된 할일 정보를 저장하는 로직을 작성합니다.
    Todo updatedTodo = Todo(
      todoName: taskNameController.text,
      todoDesc: taskDescController.text,
      todoTag: tag,
      todoDate: taskDate,
      id: widget.editTodo.id,
    );

    // 수정된 할일 정보를 업데이트합니다.
    updateTodoById(updatedTodo, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskNameController,
              decoration: const InputDecoration(
                labelText: '제목',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: taskDescController,
              decoration: const InputDecoration(
                labelText: 'Task Description',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButtonFormField<String>(
              value: tag,
              decoration: const InputDecoration(labelText: '태그'),
              onChanged: (newValue) {
                setState(() {
                  tag = newValue!;
                });
              },
              items: <String>['업무', '공부', '운동', '기타'].map(
                (String tag) {
                  return DropdownMenuItem(value: tag, child: Text(tag));
                },
              ).toList(),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                _showDatePicker();
                date = selectedDate.toString().substring(0, 10);
              },
              child: Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(selectedDate.toString().substring(0, 10))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                // 수정된 할일 정보를 업데이트하고 화면을 닫습니다.
                updateTodo();
                Navigator.pop(context);
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
