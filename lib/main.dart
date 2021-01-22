import 'package:flutter/material.dart';
import 'package:my_flutter/business/defines/common_defines.dart';

import 'business/basic_widgets/index.dart';
import 'business/custom_icon/index.dart';
import 'business/grid_view/index.dart';
import 'business/list_view/index.dart';
import 'business/sliver_widgets/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        'basic_widgets': (context) => BasicWidgetsDemo(),
        'list_view': (context) => ListViewDemo(),
        'grid_view': (context) => GridViewDemo(),
        'custom_icons': (context) => CustomIconsDemo(),
        'sliver_widgets': (context) => SliverWidgetsDemo(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          itemCount: DEMOS.length,
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            return FlatButton(
              onPressed: () =>
                  Navigator.pushNamed(context, DEMOS[index].routeName),
              color: COLORS[index % COLORS.length],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        DEMOS[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    DEMOS[index].description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
