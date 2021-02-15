import '../Controller/PeopleController.dart';
import '../Model/People.dart';
import 'package:flutter/material.dart';
import 'Details.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.primaryColor}) : super(key: key);


  final String title;
  final Color primaryColor;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isLoading;
  List<People> peoples;

  @override
  void initState() {
    peoples = PeopleController.allPeople.cast();
    isLoading =false;
    super.initState();
  }

  Future _reload() async {


    await PeopleController.reloadData();
    //await new Future.delayed(new Duration(seconds: 3));
    setState(() {
      peoples = PeopleController.allPeople.cast();
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
                        title: Text(peoples[index].toString()+" ${index}"),
                        onTap: (){
                          People p = peoples[index];
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyDetailsPage(
                                title: p.toString(),
                                primaryColor: Colors.green,
                                people: p,
                              )));
                        },
                      ),
                    );
                  },
                ),
                onNotification: (notification) {
                  ScrollMetrics value = notification.metrics;

                  if (value.pixels==value.maxScrollExtent){
                    setState(() {
                      isLoading = true;
                    });
                    _reload();
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
