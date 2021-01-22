import 'dart:ui';

import 'package:flutter/material.dart';

/// 颜色
const List<Color> COLORS = [
  Color(0xFFFF4777),
  Color(0xFFCA6924),
  Color(0xFF00BC12),
  Color(0xFF725E82),
  Color(0xFFFFA400),
  Color(0xFFDD7160),
  Color(0xFF5D513C),
  Color(0xFFD180D2),
];

final List<Color> colorList = [
  Colors.red,
  Colors.orange,
  Colors.green,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
  Colors.deepPurpleAccent
];

class Demo {
  /// 标题
  final String title;

  /// 描述
  final String description;

  /// 路由名
  final String routeName;

  const Demo({
    this.title,
    this.description,
    this.routeName,
  });
}

/// 例子
const DEMOS = [
  Demo(
    title: '基础组件',
    description: '容器、行、列、文字、图片、图标等最常用组件，是构成界面的基础',
    routeName: 'basic_widgets',
  ),
  Demo(
    title: 'ListView组件',
    description: '滚动型容器列表组件，支持下拉刷新，上拉加载等交互操作',
    routeName: 'list_view',
  ),
  Demo(
    title: 'GridView组件',
    description: '网格布局，支持自定义每行显示的列数以及每一格的宽高比例',
    routeName: 'grid_view',
  ),
  Demo(
    title: '自定义Icon图标',
    description: '下载ttf字体文件，fonts声明，根据unicode码对照生成语义的图标类型',
    routeName: 'custom_icons',
  ),
  Demo(
    title: 'Sliver系列组件',
    description: '自定义高级滚动组件，float、snap、pinned效果任你组合',
    routeName: 'sliver_widgets',
  ),
];