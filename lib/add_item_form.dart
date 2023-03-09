import 'package:change_notifier/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddItemForm extends StatefulWidget {
  const AddItemForm({Key? key}) : super(key: key);

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {

 // Data data = Data();
  final controlerName = TextEditingController();
  final controlerPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getTextField(controlerName, "Zadej jméno", "Jméno"),
              getTextField(controlerPrice, "Zadej cenu", "Cena"),
              TextButton(onPressed: () {
                var data = context.read<Data>();
                data.createItem(controlerName.text, int.parse(controlerPrice.text));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(milliseconds: 500),
                        content: Row(
                          children: [
                            Icon(Icons.add_task,color: Colors.white,),
                            Text("uspěšně přidaáno")

                          ],)));
              }, child: Text("ADD field"))
            ],
          ),
        )
    );
  }

  Widget getTextField(TextEditingController control, String text, String hint){
    return TextField(
      controller: control,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: hint,
          hintText: text),

    );
  }

}
