import 'package:flutter/material.dart';
import 'package:wigilab_test/models/category_spotify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/pages/home/widgets/category_box.dart';

class Categories extends StatelessWidget {
  final List<Category> categories;

  const Categories({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryBox(categories[index]),
      ),
    );
  }
}
