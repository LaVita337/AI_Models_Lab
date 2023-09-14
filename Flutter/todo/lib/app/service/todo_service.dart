import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/model/todo.dart';

Stream<List<Todo>> getTodoList(FirebaseFirestore firestore) {
  return firestore.collection('todos').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) => Todo.fromDocumnet(doc)).toList();
  });
}

Future<void> addTodo(Todo todo, BuildContext context) async {
  try {
    // 할 일(Todo) 객체를 Map 형태로 변환
    Map<String, dynamic> todoJson = todo.toJson();

    // Firestore의 'todos' 컬렉션에 새로운 할 일(Todo) 추가 및 문서 참조 가져오기
    DocumentReference docRef =
        await FirebaseFirestore.instance.collection('todos').add(todoJson);

    // 할 일(Todo)의 고유 ID를 가져와서 해당 문서에 업데이트
    String todoId = docRef.id;
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(todoId)
        .update({'id': todoId});

    // 할 일(Todo) 추가가 성공하면 홈 화면으로 이동
    Navigator.pushReplacementNamed(context, '/home');
  } catch (e) {
    // 오류 발생 시 처리
    // 여기서는 간단히 무시하고 아무 작업도 수행하지 않음
  }
}

// 특정 ID를 가진 할 일(Todo)을 삭제하는 함수
Future<void> deleteTodoById(String id) async {
  try {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(id)
        .delete(); // Firestore에서 할 일(Todo) 삭제
    print('Todo deleted successfully');
  } catch (e) {
    // 오류 처리
    throw Exception('Failed to delete Todo: $e');
  }
}

// 특정 ID를 가진 할 일(Todo)을 업데이트하는 함수
Future<void> updateTodoById(Todo todo, BuildContext context) async {
  FirebaseFirestore.instance
      .collection('todos')
      .doc(todo.id)
      .update(todo.toJson()) // Firestore에서 할 일(Todo) 업데이트
      .then((_) {
    print('Document updated successfully');
    Navigator.pushNamed(context, '/home'); // 홈 페이지로 이동
  }).catchError((error) {
    // 오류 처리
    print('Error updating document: $error');
  });
}
