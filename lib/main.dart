import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //wajib ain harus ada
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
        primaryColor: Color(
            0xFF039CC9) //00 hexa ff alpa selanjutnya diikitui oleh kode warna

        );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _controller;
  List<Datatodo> listTodo = [
    Datatodo(
        title: "Cabai 1 kg", subtitle: "Senin 11 maret", circleIcon: circle(Colors.white)),
    Datatodo(
        title: "Keramik 2 sak",
        subtitle: "Senin 11 maret",
        circleIcon: circle(Colors.blue)),
    Datatodo(
        title: "pasir 5 truk",
        subtitle: "Senin 11 maret",
        circleIcon: circle(Colors.yellow)),
  ];
  //TabController _controller =TabController(vsync: this, length: 2);
  static Widget circle(warna) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: warna),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mak notify"),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              text: "To-Do",
              icon: Icon(Icons.add),
            ),
            Tab(
              text: "History",
              icon: Icon(Icons.history),
            )
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: <Widget>[
        Container(
          child: ListView.builder(
            itemCount: listTodo.length,
            itemBuilder: (context, posisi) {
              return ListTile(
                leading: listTodo.elementAt(posisi).circleIcon,
                //title: Text("title widget"),
                title: Text(listTodo.elementAt(posisi).title),
                subtitle: Text(listTodo.elementAt(posisi).subtitle),
              );
            },
          ),
        ),
        Text("data 2")
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("floating berhasil di pres");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Datatodo {
  String title;
  String subtitle;
  Widget circleIcon;

  Datatodo({this.title, this.subtitle, this.circleIcon});
}
