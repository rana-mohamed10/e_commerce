import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/domain/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget(this.product,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor
          )
      ),
      child: Column(
        children: [
          Container(
            width: 191.w,
            height: 232.h,
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) {
                return Container(
                    width: 153.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(image: imageProvider,fit: BoxFit.fill)));
              },
              imageUrl: product.imageCover ??"",
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
            ),
          ),
          Text(product.title??"",style: TextStyle(
              fontSize:14.sp,
            fontWeight: FontWeight.w500
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,),
          Padding(
            padding: const EdgeInsets.only(left: 3.0,right: 3.0),
            child: Row(
              children: [
            Text("EGP ${product.priceAfterDiscount?.toString()??product.price?.toString()??""}",
            style: TextStyle(fontSize: 14.sp,
                color: Theme.of(context).primaryColor),),
                SizedBox(width: 15,),
                Visibility(
                    visible: product.priceAfterDiscount!=null,
                    child: Text(product.price?.toString()??"" ,style:
                    TextStyle(decoration: TextDecoration.lineThrough,
                    fontSize: 11.sp,
                    color: Theme.of(context).primaryColor.withOpacity(0.6)),)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3.0,right: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Reviews(${product.ratingsAverage})'),
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor
                  ),
                child:Icon(Icons.add,color: Colors.white,size: 30,) ,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
