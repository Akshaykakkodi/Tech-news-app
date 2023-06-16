

import 'package:flutter/material.dart';
import 'package:technewz/utils/colors.dart';

import '../utils/text.dart';

class appBar extends StatelessWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             BoldText(text: 'Tech', size: 20, color: AppColors.primary,),
             Modifiedtext(text: 'Newz', size: 20, color: AppColors.lightWhite)
           ],
        ),
      ),
      centerTitle: true,

    );
  }
}
