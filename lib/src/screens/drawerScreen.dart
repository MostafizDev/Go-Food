import 'package:flutter/material.dart';
import 'package:go_food/src/configuration.dart';
import 'package:go_food/src/constants/constants.dart';
class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      padding: EdgeInsets.only(top:50,bottom: 70,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person, color: kPrimaryColor,),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Md. Mostafizur Rahman',style: TextStyle(color: kPrimaryLightColor,fontWeight: FontWeight.bold),),
                  Text('Flutter Developer',style: TextStyle(color: kPrimaryLightColor,fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),

          Column(
            children: drawerItems.map((element) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(element['icon'],color: Colors.black,size: 24,),
                  SizedBox(width: 10,),
                  Text(element['title'],style: TextStyle(color: kPrimaryLightColor,fontWeight: FontWeight.bold,fontSize: 20))
                ],

              ),
            )).toList(),
          ),

          Row(
            children: [
              Icon(Icons.settings,color: Colors.black,),
              SizedBox(width: 10,),
              Text('Settings',style:TextStyle(color: kPrimaryLightColor,fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Container(width: 2,height: 20,color: Colors.black,),
              SizedBox(width: 10,),
              Text('Log out',style:TextStyle(color: kPrimaryLightColor,fontWeight: FontWeight.bold),)


            ],

          )


        ],
      ),

    );
  }
}