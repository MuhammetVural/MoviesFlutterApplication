import 'package:flutter/material.dart';
import 'package:movie_flutter_application/core/main/models/category_model.dart';

import '../../core/main/categoryScreen.dart';

class AllCategoryWidget extends StatefulWidget {
  Category? model;
  BuildContext? context;

  AllCategoryWidget({this.model, this.context});

  @override
  _AllCategoryWidgetState createState() => _AllCategoryWidgetState();
}

class _AllCategoryWidgetState extends State<AllCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryScreen(model: widget.model)));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(widget.model!.imgUrl!),
        ),
      ),
    );
  }
}
