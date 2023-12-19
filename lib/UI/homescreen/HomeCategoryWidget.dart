import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/domain/model/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../productsCatalog/ProductsCatalog.dart';

class HomeCategoryWidget extends StatelessWidget {
  Category category;
  HomeCategoryWidget(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(
              ProductsCatalog.routeName,
              arguments: category);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageBuilder: (context, imageProvider) {
                return Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: imageProvider)));
              },
              imageUrl: category.image ?? "",
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
              width: 100.w,
              height: 100.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Center(
                child: Text(category.name ?? "",
                  style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
