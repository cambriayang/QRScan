/*********************************************************************************
 * Author: Argost Ye
 * Time: 2021/1/19
 **********************************************************************************/
import 'package:flutter/material.dart';
import 'package:my_flutter/business/defines/common_defines.dart';

class BasicDemo extends StatelessWidget {
  final String title;

  const BasicDemo({Key key, @required this.title}) : super(key: key);

  Widget renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            this.renderTitle('SliverGrid'),
            SliverGrid.count(
              crossAxisCount: 3,
              children:
                  colorList.map((color) => Container(color: color)).toList(),
            ),
            this.renderTitle('SliverList'),
            SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(color: colorList[index]),
                    childCount: colorList.length),
                itemExtent: 100),
          ],
        ),
      ),
    );
  }
}
