import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/todo_cubit.dart';
import 'cubit/todo_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController todoController = TextEditingController();
    FocusNode focusNode = FocusNode();
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Todos'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: todoController,
                focusNode: focusNode,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () {
                  focusNode.unfocus();
                  todoController.text != ''
                      ? BlocProvider.of<TodoCubit>(context)
                          .addNewTodo(todoController.text)
                      : null;
                  todoController.clear();
                },
                child: const Text('Add Todo'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<TodoCubit, TodoInitial>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Card(
                            elevation: 6,
                            child: ListTile(
                              minVerticalPadding: 20,
                              title: Text(state.todos[index]),
                              trailing: IconButton(
                                  onPressed: () =>
                                      BlocProvider.of<TodoCubit>(context)
                                          .deleteTodo(index),
                                  icon: const Icon(Icons.remove_circle)),
                            ),
                          ),
                        );
                      },
                      itemCount: state.todos.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
