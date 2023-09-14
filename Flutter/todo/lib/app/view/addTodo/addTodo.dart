import 'package:flutter/material.dart';
import 'package:todo/app/model/todo.dart';
import 'package:todo/app/service/todo_service.dart';

/*
새로운 할일을 추가하는 화면을 구성합니다.
*/

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  late Todo newTodo;
  late TextEditingController todoNameController;
  late TextEditingController todoDescController;
  String tag = '업무';
  String date = '';
  late DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    todoNameController = TextEditingController();
    todoDescController = TextEditingController();
  }

  // DatePicker를 표시하는 함수
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Todo'), // 페이지 제목
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: todoNameController,
              decoration:
                  const InputDecoration(labelText: '제목'), // 할 일 제목 입력 필드
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: todoDescController,
              decoration:
                  const InputDecoration(labelText: '내용'), // 할 일 내용 입력 필드
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButtonFormField<String>(
              value: tag,
              decoration:
                  const InputDecoration(labelText: '태그'), // 할 일 태그 선택 드롭다운
              onChanged: (newValue) {
                setState(() {
                  tag = newValue!;
                });
              },
              items: ['업무', '공부', '운동', '기타'].map(
                (tag) {
                  return DropdownMenuItem(value: tag, child: Text(tag));
                },
              ).toList(),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                _showDatePicker(); // 날짜 선택 DatePicker 표시
                date =
                    selectedDate.toString().substring(0, 10); // 선택한 날짜를 문자열로 저장
              },
              child: Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today), // 달력 아이콘
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(selectedDate.toString().substring(0, 10)) // 선택한 날짜 표시
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                newTodo = Todo(
                    todoName: todoNameController.text,
                    todoDesc: todoDescController.text,
                    todoTag: tag,
                    todoDate: date);
                addTodo(newTodo, context);
              },
              child: const Text('ADD'), // 추가 버튼
            ),
          ],
        ),
      ),
    );
  }
}
