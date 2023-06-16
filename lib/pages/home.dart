import 'package:flutter/material.dart';
import 'package:technewz/components/newsbox.dart';
import 'package:technewz/utils/colors.dart';
import 'package:technewz/utils/constants.dart';


import '../backend/functions.dart';
import '../components/appbar.dart';
import '../components/searchBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          appBar(),
         searchBaaar(),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
                child: FutureBuilder<List>(
                  future: fetchnews(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return const  SizedBox(
                          height: 20,
                          width: 20,
                          child:Center(child:Text("Loading") ,) );
                    }
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context,index) {
                          return NewsBox(
                              imageUrl: snapshot.data![index]['urlToImage']!=null?
                               snapshot.data![index]['urlToImage']:
                              Constants.imgUrl,
                              title:  snapshot.data![index]['title'],
                              time:  snapshot.data![index]['publishedAt'],
                              description:  snapshot.data![index]['description']!=null?
                              snapshot.data![index]['description']:"",
                              url: snapshot.data![index]['url']);
                        }
                      );
                    }
                    else{
                      return Text("no data");
                    }
                  },
                ),
          )
          )

        ],

      ),
    );
  }
}

