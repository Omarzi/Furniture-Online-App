import 'package:flutter/material.dart';
import 'package:furniture_online_app/constant/data.dart';
import 'package:furniture_online_app/pages/product_detail_page.dart';
import 'package:furniture_online_app/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }
  Widget getBody(){
    return SafeArea(
          child: ListView(
        padding: const EdgeInsets.only(left: 20,right: 20),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text("Furniture",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500
              ),),
              Row(
                children: const <Widget>[
                  Icon(LineIcons.heart,size: 28,),
                  SizedBox(width: 10,),
                  Icon(LineIcons.search,size: 28,)
                ],
              )
            ],
          ),
          const SizedBox(height: 30,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
                      child: Row(children: List.generate(menus.length, (index) => 
            InkWell(
              onTap: (){
                setState(() {
                  activeIndex = index;
                });
              },
                          child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: activeIndex == index ? primary : Colors.transparent,
                    border: Border.all(
                      color: activeIndex == index ? Colors.transparent : primary
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(menus[index],style: TextStyle(
                      color: activeIndex == index ? white : primary,
                      fontSize: 16
                    ),),
                  ),
                ),
              ),
            )
            )),
          ),
          const SizedBox(height: 50,),
          Column(
            children: List.generate(items.length, (index) => 
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(
                  id: items[index]['id'],
                  name: items[index]['name'],
                  img: items[index]['img'],
                  code: items[index]['code'],
                  pPrice: items[index]['p_price'].toString(),
                  pPromotionPrice: items[index]['p_promotion_price'].toString(),
                )));
              },
                          child: Card(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: items[index]['id'].toString(),
                                      child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(items[index]['img']),fit: BoxFit.cover)
                    ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(items[index]['name'],style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),),
                      const SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          // ignore: prefer_interpolation_to_compose_strings
                          Text(items[index]['p_promotion_price'].toString()+" USD",style: const TextStyle(
                        fontSize: 16,
                      ),),
                      const SizedBox(width: 20,),
                      // ignore: prefer_interpolation_to_compose_strings
                      Text(items[index]['p_price'].toString()+" USD",style: const TextStyle(
                        fontSize: 17,
                        color: warning,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough
                      ),),
                        ],
                      )
                    ],
                  )
                ],
              ),
          ),
            )
            ),
          )
        ],
      ),
    );
  }
}