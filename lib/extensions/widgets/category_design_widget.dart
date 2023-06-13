
import 'package:flutter/material.dart';
import 'package:movie_flutter_application/core/main/models/category_model.dart';

import '../../core/main/categoryScreen.dart';


class CategoryDesignWidget extends StatefulWidget {
  Category? model;
  BuildContext? context;

  CategoryDesignWidget({this.model, this.context});

  @override
  _CategoryDesignWidgetState createState() => _CategoryDesignWidgetState();
}

class _CategoryDesignWidgetState extends State<CategoryDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: InkWell(
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
                          backgroundImage: NetworkImage(
                              widget.model!.imgUrl!),
                        ),
                      ),
                    
          ),
        ),
      ),
    );
  }
}
