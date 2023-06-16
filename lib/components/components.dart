import 'package:flutter/material.dart';
import 'package:technewz/utils/text.dart';

class BottomSheetImage extends StatelessWidget {
  final String imageUrl,title;
  const BottomSheetImage({Key? key, required this.imageUrl, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black,Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,

              )
            ),
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),topRight: Radius.circular(20),

              ),
              image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill

              )
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              width: 300,
              child: BoldText(text: title,color: Colors.white,size: 18),
            ),
          )
        ],
      ),
    );
  }
}
