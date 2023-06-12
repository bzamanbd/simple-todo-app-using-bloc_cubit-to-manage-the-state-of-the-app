import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_bloc_cubit/cubit/todo_state.dart';

class Todo {
  static List<String> data = [];
}

class TodoCubit extends Cubit<TodoInitial> {
  TodoCubit() : super(TodoInitial(todos: Todo.data));

  addNewTodo(String todo) {
    final todosList = state.todos;
    todosList.add(todo);
    emit(TodoInitial(todos: todosList));
  }

  deleteTodo(int index) {
    final todosList = state.todos;
    todosList.removeAt(index);
    emit(TodoInitial(todos: todosList));
  }
}
