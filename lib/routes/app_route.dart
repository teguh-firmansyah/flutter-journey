import 'package:example/Sized_Expanded_Stack/Expanded.dart';
import 'package:example/Sized_Expanded_Stack/SizedWidget.dart';
import 'package:example/Sized_Expanded_Stack/StackWidget.dart';
import 'package:example/container/ContainerSatu.dart';
import 'package:example/list_grid_singlechild/grid_view/GridView.dart';
import 'package:example/list_grid_singlechild/list_view/ListView.dart';
import 'package:example/list_grid_singlechild/singlechild_scroll/SingleChildSrollWidget.dart';
import 'package:example/pages/about_page.dart';
import 'package:example/pages/form_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/row_column/ColumnWidget.dart';
import 'package:example/row_column/RowWidget.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const home = '/';
  static const listBasic = '/list-basic';
  static const about = '/about';
  static const container = '/container';
  static const grid = '/grid-basic';
  static const singleChild = '/single-child';
  static const column = '/column';
  static const row = '/row';
  static const expanded = '/expanded';
  static const sized = '/sized';
  static const stack = '/stack';
  static const form = '/form';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    listBasic: (context) => ListViewWidget(),
    about: (context) => AboutPage(),
    container: (context) => ContainerSatu(),
    grid: (context) => GridViewWidget(),
    singleChild: (context) => SingleChildSrollWidget(),
    column: (context) => ColumnWidget(),
    row: (context) => RowWidget(),
    expanded: (context) => ExpandedWidget(),
    sized: (context) => SizedWidget(),
    stack: (context) => StackWidget(),
    form: (context) => FormPage(),
  };
}
