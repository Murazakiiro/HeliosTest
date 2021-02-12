import 'package:HeliosTest/Controller/PeopleController.dart';
import 'package:HeliosTest/Model/People.dart';
import 'package:HeliosTest/details.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Helios Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'HeliosTest',primaryColor: Colors.blue),
      routes: {
        'home': (context) => MyHomePage(title: "HeliosTest",primaryColor: Colors.purple,),
        'details': (context) => MyDetailsPage(title: "Details",primaryColor: Colors.purple)
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.primaryColor}) : super(key: key);


  final String title;
  final Color primaryColor;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PeopleController controller = new PeopleController();
  bool isLoading = true;
  List<People> peoples = [];

  @override
  void initState() {
    _reload();
    super.initState();
  }

  Future _reload() async {

    //await new Future.delayed(new Duration(seconds: 2));
    await controller.reloadData();

    setState(() {
      peoples.addAll(controller.allPeople.cast());
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: widget.primaryColor,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: NotificationListener<ScrollEndNotification>(
              child: ListView.builder(
                itemCount: peoples.length,
                itemBuilder: (context,index){
                  return new Card(
                    child: ListTile(
                      title: Text(peoples[index].toString()),
                      onTap: (){
                        People p = peoples[index];
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyDetailsPage(
                          title: p.toString(),
                          primaryColor: Colors.purple,
                          people: p,
                        )));
                      },
                    ),
                  );
                },
              ),
              onNotification: (notification) {
                var value = notification.metrics;

                if (value.pixels==value.maxScrollExtent){
                  _reload();
                  setState(() {
                    isLoading = true;
                  });
                }
                return true;
              },
            ),
          ),

          Container(
            height: isLoading ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),
        ],
      )
    );
  }
}
