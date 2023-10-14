import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models.dart';

class GetData {
  late List titles;
  late List dates;
  late List url;

  Future getData1() async {
    var url = Uri.parse('https://www.assetplus.in/cms/marketing-posters');
     http.Response response = await http.get(url);
    List users =  usersFromJson(response.body);
    print("null users$users");
     return response;

  }




  Future getData2() async {
    var url = Uri.parse('https://www.assetplus.in/cms/marketing-tags');
    final response = await http.get(url);
    final users = usersFromJson(response.body.toString());
    print(response.body);
    print(users);
    return response.body;
  }

  Future getTitle() async {
    final response= await getData1();
    String data = response.body;
    var title=jsonDecode(data)[0]['title'];
    print(title);
    return title;
  }



  Future getDate() async {
    final response= await getData1();
    String data= response.body.toString();
    var date=await json.decode(data)[0]['published_at'];
    print(date);
    return date;
  }

  Future getLink()async{
    final response = await getData1();
    String data= response.body;
    var link=await jsonDecode(data)[0]['poster']['url'];
    print (link);
    String l1="https://www.assetplus.in/cms";
    l1=l1+link;
    print(l1);
    return l1;
  }

}
