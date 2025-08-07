import 'package:fitnapp/App/Fitness/fitness_plan_add.dart';
import 'package:fitnapp/App/Fitness/fitness_plan_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitnapp/Data/Data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Scaffold homePage(BuildContext pageContext, Widget widget) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Home"),
        trailing: GestureDetector(
          onTap: () => Navigator.push(
            pageContext,
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (pageContext) =>
                    FitnessPlanAdd(setStateFunction: () => setState(() => null)),
            ),
          ),
          child: Text(
            'Add',
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
        ),
      ),
      body: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: FutureBuilder(
          future: Data.getFitnessPlanList(),
          builder: (context, snapshot) {
            return Stack(
              children: <Widget>[
                (snapshot.hasData)
                    ? (snapshot.data.length > 0)
                        ? FitnessPlanListView(fitnessPlanList: snapshot.data, setStateFunction: () => setState(() => null))
                        : homePage(context, Center(child: Text("No entries")))
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Data is loading.."),
                            CircularProgressIndicator(),
                          ],
                        ),
                      ),
                Positioned(
                  bottom: 32,
                  left: 32,
                  child: FloatingActionButton(
                    heroTag: "Init",
                    onPressed: () => setState(() {
                      Data.clear();
                    }),
                    child: Icon(CupertinoIcons.clear_circled),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
