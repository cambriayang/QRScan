/*********************************************************************************
 * Author: Argost Ye
 * Time: 2021/1/19
 **********************************************************************************/
import 'package:flutter/material.dart';

class FloatDemo extends StatelessWidget {
  final String title;

  const FloatDemo({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              expandedHeight: 250,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(this.title),
                background: Image.network(
                  'http://img1.mukewang.com/5c18cf540001ac8206000338.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final isOdd = index % 2 == 1;
                  return Container(
                    alignment: Alignment.center,
                    color: isOdd ? Colors.white : Color(0xFFEAEAEA),
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
                childCount: 50,
              ),
              itemExtent: 80,
            ),
          ],
        ),
      ),
    );
  }
}