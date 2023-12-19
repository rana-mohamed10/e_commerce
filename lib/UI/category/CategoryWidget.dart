import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/UI/productsCatalog/ProductsCatalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/model/Category.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  CategoryWidget(this.category,{super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(
            ProductsCatalog.routeName,
        arguments: category);
      },
      child: Container(
        width:70.w,
        height: 100.h,
        child: Column(
          children: [
            CachedNetworkImage(
              imageBuilder: (context, imageProvider) {
                return Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(image: imageProvider)));
              },
              imageUrl: category.image ?? "",
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
              width: 70.w,
              height: 70.h,
            ),
            Text(category.name ??"",
            maxLines: 1,overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
