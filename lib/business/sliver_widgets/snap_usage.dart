/*********************************************************************************
 * Author: Argost Ye
 * Time: 2021/1/20
 **********************************************************************************/
import 'package:flutter/material.dart';

class SnapDemo extends StatelessWidget {
  final String title;

  const SnapDemo({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              expandedHeight: 250,
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
                      child: Text(
                        index.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      color: isOdd ? Colors.white : Color(0xFFEAEAEA),
                    );
                  },
                  childCount: 50,
                ),
                itemExtent: 80),
          ],
        ),
      ),
    );
  }
}
