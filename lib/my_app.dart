import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/form_provider.dart';
import 'package:provider_tutorial/my_form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openSheet() {
    showDialog(context: context, builder: (context) => const MyForm());
  }

  @override
  Widget build(BuildContext context) {
    final listenForm = Provider.of<FormProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: listenForm.listOfUser.isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(listenForm.listOfUser.length, (index) {
                final userObject = listenForm.listOfUser[index];
                String name = userObject.name;
                int age = userObject.age;
                return ListTile(
                  title: Text(name),
                  subtitle: Text('age: $age'),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Provider.of<FormProvider>(context, listen: false)
                          .deleteUser(value: userObject);
                    },
                  ),
                );
              }),
            )
          : const Center(
              child: Text('User is Empty'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openSheet,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
