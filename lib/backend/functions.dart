import 'dart:convert';


import 'package:http/http.dart'as http;
import 'package:technewz/components/searchBar.dart';
import 'package:technewz/utils/key.dart';

Future<List> fetchnews()async{
  final response= await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey='+
    Keys.key+
        '&q='+
        searchBaaar.searchcontroller.text
        ),
  );
  Map result=jsonDecode(response.body) ;
  print('fetched');
  return (result['articles']);
}