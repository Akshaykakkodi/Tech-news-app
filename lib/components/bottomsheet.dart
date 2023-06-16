



import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technewz/utils/colors.dart';
import 'package:technewz/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components.dart';

void showMyBottomSheet(
    BuildContext context,String title,String description,imageurl,url
    ){

  showBottomSheet(
    backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),

      ),
      elevation: 0,


      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          url:url,
          imageUrl:imageurl,
          title:title,
          description:description,
        );
      },
  );




}


class MyBottomSheetLayout extends StatelessWidget {
  final String title,description,imageUrl,url;
  const MyBottomSheetLayout({Key? key, required this.title, required this.description, required this.imageUrl, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetImage(imageUrl:imageUrl,title:title),
          Container(
            padding: EdgeInsets.all(10),
            child: Modifiedtext(text: description, size: 16, color: AppColors.white),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                children:<TextSpan>[
                  TextSpan(
                    text: "Read Full Article",
                    recognizer: TapGestureRecognizer()
                      ..onTap=(){
                      print(url);
                      _launchUrl(url);
                      }
                      ,style: GoogleFonts.lato(
                    color: Colors.blue.shade400
                  ),

                  )
                ]
              ),
            ),
          )

        ],
      ),
    );
  }
}


Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw Exception('Could not launch $url');
  }
}


