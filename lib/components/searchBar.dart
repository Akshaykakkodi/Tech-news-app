import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technewz/utils/colors.dart';

import '../backend/functions.dart';

class searchBaaar extends StatefulWidget {


  const searchBaaar({Key? key}) : super(key: key);
  static TextEditingController searchcontroller=TextEditingController(text: '');

  @override
  State<searchBaaar> createState() => _searchBaaarState();
}

class _searchBaaarState extends State<searchBaaar> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: searchBaaar.searchcontroller,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              print(searchBaaar.searchcontroller.text);
              fetchnews();
              setState(() {

              });
            },
              child: Icon(Icons.search,color: AppColors.white,)),
          hintText: "search a keyword of phrase",
          hintStyle: GoogleFonts.lato(),
          contentPadding: EdgeInsets.all(15),
            filled: true,
            fillColor:AppColors.darkGrey,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            )
        ),
      ),
    );
  }
}

