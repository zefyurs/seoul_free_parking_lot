import 'package:flutter/material.dart';
import 'package:seoul_free_parking_lot/models/park.dart';
import 'package:seoul_free_parking_lot/service/fetchpark.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future<List<Park>> parks;

  @override
  void initState() {
    super.initState();
    parks = fetchPark();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('공영 주차장 조회'),
        ),
        body: Center(
          child: FutureBuilder<List<Park>>(
              future: parks,
              builder: (context, snapshot) {
                // future 파라미터에 parks 변수를 인자로 넣으면 builder 파리미터의 snapshot에서 호출된 데이터를 사용할 수 있음
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text(snapshot.data!.isNotEmpty ? snapshot.data![0].parkingName : "없음"),
                      Text(snapshot.data!.isNotEmpty ? snapshot.data![0].parkingCode : "없음"),
                      Text(snapshot.data!.isNotEmpty ? snapshot.data![0].lat.toString() : "없음"),
                      Text(snapshot.data!.isNotEmpty ? snapshot.data![0].lng.toString() : "없음"),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
