import 'package:example/Sized_Expanded_Stack/Expanded.dart';
import 'package:example/Sized_Expanded_Stack/SizedWidget.dart';
import 'package:example/Sized_Expanded_Stack/StackWidget.dart';
import 'package:example/container/ContainerSatu.dart';
import 'package:example/list_grid_singlechild/grid_view/GridView.dart';
import 'package:example/list_grid_singlechild/list_view/ListView.dart';
import 'package:example/list_grid_singlechild/singlechild_scroll/SingleChildSrollWidget.dart';
import 'package:example/pages/about_page.dart';
import 'package:example/pages/api/comments_page.dart';
import 'package:example/pages/api/post_page.dart';
import 'package:example/pages/fetch_api_page.dart';
import 'package:example/pages/form_page.dart';
import 'package:example/pages/formulir_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/row_column/ColumnWidget.dart';
import 'package:example/row_column/RowWidget.dart';
import 'package:flutter/material.dart';
import 'package:example/pages/input_page.dart';

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
  static const input = '/input-page';
  static const formulir = '/formulir';
  static const album = '/album';
  static const fetch = '/fetch';
  static const comment = '/comment';

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
    input: (context) => BelajarForm(),
    formulir: (context) => FormulirPage(),
    album: (context) => AlbumPage(),
    fetch: (context) => PostPage(),
    comment: (context) => CommentsPage(),
  };
}
