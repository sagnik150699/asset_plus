import 'package:asset_plus/services/bloc.dart';
import 'package:asset_plus/services/networking.dart';
import 'package:asset_plus/widgets/containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyPage extends StatefulWidget {
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  PageController pageController = PageController(initialPage: 0);
  List<Container> cc=[];
  GetData _getData=new GetData();
  Containers _containers = new Containers();
  var title;
  var link;
  var date;


  Future getInfo()async{
     title= await _getData.getTitle();
     link = await _getData.getLink();
     date = await _getData.getDate();
     cc.add(await _containers.container(title, date, link));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height;
    final double categoryWidth = size.width;
    final PageCounterBloc pageCounterBloc =
        Provider.of<PageCounterBloc>(context);
    return Column(
      children: [
        SizedBox(height: 20.0),
        //search Bar
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: SizedBox(
            height: 40.0,
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                hintText: "Search by title",
                hintStyle: TextStyle(
                  letterSpacing: 3.0,
                ),
              ),
            ),
          ),
        ),
        //Titles
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MaterialButton(
                  child: Text(
                    "What's New",
                    style: TextStyle(
                        color: (pageCounterBloc.counter == 0)
                            ? Colors.black
                            : Colors.grey),
                  ),
                  onPressed: () async{
                    pageCounterBloc.valuesCounter(0);
                    pageController.animateToPage(0, duration: Duration(milliseconds: 250), curve: Curves.bounceIn);
                  }),
              MaterialButton(
                  child: Text(
                    "SIP",
                    style: TextStyle(
                        color: (pageCounterBloc.counter == 1)
                            ? Colors.black
                            : Colors.grey),
                  ),
                  onPressed: () {
                    pageCounterBloc.valuesCounter(1);
                    pageController.animateToPage(1, duration: Duration(milliseconds: 250), curve: Curves.bounceIn);
                  }),
              MaterialButton(
                  child: Text(
                    "Retirement",
                    style: TextStyle(
                        color: (pageCounterBloc.counter == 2)
                            ? Colors.black
                            : Colors.grey),
                  ),
                  onPressed: () {
                    pageCounterBloc.valuesCounter(2);
                    pageController.animateToPage(2, duration: Duration(milliseconds: 250), curve: Curves.bounceIn);
                  }),
              MaterialButton(
                  child: Text(
                    "Tax Saving",
                    style: TextStyle(
                        color: (pageCounterBloc.counter == 3)
                            ? Colors.black
                            : Colors.grey),
                  ),
                  onPressed: () {
                    pageCounterBloc.valuesCounter(3);
                    pageController.animateToPage(3, duration: Duration(milliseconds: 250), curve: Curves.bounceIn);
                  }),
              MaterialButton(
                  child: Text(
                    "Planning",
                    style: TextStyle(
                        color: (pageCounterBloc.counter == 4)
                            ? Colors.black
                            : Colors.grey),
                  ),
                  onPressed: () {
                    pageCounterBloc.valuesCounter(4);
                    pageController.animateToPage(4, duration: Duration(milliseconds: 250), curve: Curves.bounceIn);
                  }),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (e) {
              pageCounterBloc.valuesCounter(e);
            },
            pageSnapping: true,
            children: [
             ListView(
               children: [
               Container(
                 height: 200,
                 color: Colors.white,
                 child: Row(
                   children: [
                     Image.network('https://www.assetplus.in/cms/uploads/marketing_sip_05cc68a759.jpeg',width: categoryWidth/2.5,),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("SIP smoothens out unpredictability",
                         ),
                         Text("2021-03-05"),

                       ],
                     )

                   ],
                 ),

               )
               ],
             ),
              FutureBuilder(
                future: getInfo(),
                builder:(BuildContext context, AsyncSnapshot snapshot){
                  return cc[0];
                },
              ),
              ListView(
                children: [
                  Container(height: 300,
                    color: Colors.black,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
