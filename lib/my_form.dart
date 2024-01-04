import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/form_provider.dart';

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController ageCtrl = TextEditingController();
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter Name'),
            TextFormField(
              controller: nameCtrl,
              decoration:
                  const InputDecoration(filled: true, fillColor: Colors.white),
            ),
            const Text('Enter Age'),
            TextFormField(
              controller: ageCtrl,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration:
                  const InputDecoration(filled: true, fillColor: Colors.white),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    String name = nameCtrl.text;
                    String age = ageCtrl.text;
                    if (name.isNotEmpty && age.isNotEmpty) {
                      Provider.of<FormProvider>(context, listen: false)
                          .saveUser(name: name, age: int.parse(age));
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter all data'),
                      ));
                    }
                  },
                  child: const Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}
