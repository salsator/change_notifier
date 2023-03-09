import 'package:change_notifier/data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ViewLoading extends StatefulWidget {
  const ViewLoading({Key? key}) : super(key: key);

  @override
  State<ViewLoading> createState() => _ViewLoadingState();
}

class _ViewLoadingState extends State<ViewLoading> {

  //ValueNotifier<bool> isLoading2 = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {

    var data = context.read<Data>();


    return Scaffold(
        appBar: AppBar(
          title: const Text("zkouška Change Notifieru"),
          actions: [
            IconButton(
                onPressed: () => data.resetList(),
                icon: Icon(Icons.delete)),

            IconButton(
                onPressed: () => context.go("/loading/add"),
                icon: Icon(Icons.add))
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {

            data.createItem("name", 15);
            print(data.list.length);
          },
          child: Icon(Icons.add),
        ),
        body: Consumer<Data>(
        builder: (context, data, child) =>
                data.isLoading ? Center(child: CircularProgressIndicator(),)
            : consumer()
        )
    );
  }

  Consumer consumer() {
    return Consumer<Data>(
      builder: (context, data, child) =>
          ListView.builder(
              itemCount: data.list.length,
              itemBuilder: (context, index) =>
                  ListTile(
                    title: Text(data.list[index].name),
                    subtitle: Text("Cena: ${data.list[index].price}"),
                  )),
    );
  }
}
