import 'package:chucknoris/models/fact.dart';
import 'package:chucknoris/services/api_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<FactsModel> _factsModel;
  @override
  void initState() {
    _factsModel = API_MANAGER().getFacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prabesh Regmi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Material(
        child: Container(
          color: Colors.blueGrey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            FutureBuilder<FactsModel>(
                future: _factsModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    String fact =
                        data!.value.replaceAll("Chuck Norris", "Prabesh Regmi");
                    return Text(
                      fact,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    );
                  } else
                    return CircularProgressIndicator();
                }),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                _factsModel = API_MANAGER().getFacts();
                setState(() {});
              },
              child: Icon(Icons.replay_outlined, size: 50, color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }
}
