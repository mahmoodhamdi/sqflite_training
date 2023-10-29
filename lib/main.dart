import 'package:flutter/material.dart';
import 'package:sqflite_training/sqldb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  SqlDb sqlDb = SqlDb();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    int response = await sqlDb.insertData(
                        "INSERT INTO 'notes' ('note') VALUES ('NOTE two')");
                    print(response);
                  },
                  child: const Text("insert data")),
              ElevatedButton(
                  onPressed: () async {
                    List<Map> response =
                        await sqlDb.readData("SELECT * FROM 'notes'");
                    print(response);
                  },
                  child: const Text("read data")),
              ElevatedButton(
                  onPressed: () async {
                    int response = await sqlDb
                        .deleteData("DELETE FROM 'notes' WHERE id=20");
                    print(response);
                  },
                  child: const Text("delete data")),
              ElevatedButton(
                  onPressed: () async {
                    int response = await sqlDb.updateData(
                        "UPDATE 'notes' SET 'note'='NOTE ALPH' WHERE ID=25 ");
                    print(response);
                  },
                  child: const Text("update data")),
            ],
          ),
        ),
      ),
    );
  }
}
