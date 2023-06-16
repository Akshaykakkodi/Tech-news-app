
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technewz/components/bottomsheet.dart';
import 'package:technewz/utils/colors.dart';
import 'package:technewz/utils/text.dart';


class NewsBox extends StatelessWidget {
  final String imageUrl, title,time,description,url;
  const NewsBox({Key? key, 
    required this.imageUrl, 
    required this.title,
    required this.time, 
    required this.description, 
    required this.url}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageUrl, url);
          },
          child: Container(
            color: AppColors.black,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 5,right: 5,top: 5),
            child: Row(
              children: [
                CachedNetworkImage(imageUrl: imageUrl,
                  imageBuilder:  (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: imageProvider,fit: BoxFit.cover)
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Modifiedtext(
                        text: title, size: 16, color: AppColors.white
                    ),
                    const SizedBox(height: 5,),
                    Modifiedtext(text: time, size: 12, color: AppColors.lightWhite)
                  ],
                ))
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20),
          child: Divider(
             color: AppColors.darkGrey,
          ),
        )
      ],
    );
  }
}
