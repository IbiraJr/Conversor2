import 'package:conversor2/api/api_convert.dart';
import 'package:conversor2/model/currencies.dart';
import 'package:conversor2/screens/convert_screen.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiConvert().getList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            List<Ars> currencies = snapshot.data;
            return Scaffold(
              body: ListView.builder(
                itemCount: currencies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(currencies[index].name),
                    subtitle: Text('Cotação Atual: ${currencies[index].buy}'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConvertScreen(
                              moeda: currencies[index],
                            ),
                          ));
                    },
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text('Erro'),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
