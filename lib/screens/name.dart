import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCubit extends Cubit<String> {
  NameCubit(String initialState) : super(initialState);

  void change(String name) => emit(name);
}

class NameContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = context.read<NameCubit>().state;
    return Scaffold(
      appBar: AppBar(title: Text("Mudar Nome")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "nome desejado",
              ),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: Text("Mudar"),
                onPressed: () {
                  final name = _nameController.text;
                  context.read<NameCubit>().change(name);
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
