
import 'package:agros/AboutUs.dart';
import 'package:agros/Login.dart';
import 'package:agros/Market.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class Navbar extends StatelessWidget {

  Color home_color;
  Color about_color;
  Color market_text_color;
  Color contact_color;
  Color login_color;
  Color market_container_color;

  Navbar(this.home_color,this.about_color,this.market_text_color,this.market_container_color,this.contact_color,this.login_color);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800)
      {
        return DesktopNavbar(home_color,about_color,market_text_color,market_container_color,contact_color,login_color);
      }else { return Container(); }
    });
  }
}


class DesktopNavbar extends StatefulWidget {
  Color home_color;
  Color about_color;
  Color market_text_color;
  Color contact_color;
  Color login_color;
  Color market_container_color;
  DesktopNavbar(this.home_color,this.about_color,this.market_text_color,this.market_container_color,this.contact_color,this.login_color);

  @override
  State<DesktopNavbar> createState() => _DesktopNavbarState(home_color,about_color,market_text_color,market_container_color,contact_color,login_color);
}
class _DesktopNavbarState extends State<DesktopNavbar> {

  Color home_color;
  Color about_color;
  Color market_text_color;
  Color contact_color;
  Color login_color;
  Color market_container_color;

  _DesktopNavbarState(this.home_color,this.about_color,this.market_text_color,this.market_container_color,this.contact_color,this.login_color);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 120,vertical: 15),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [GestureDetector(child:  Text('Agros',style: TextStyle(color: home_color,fontWeight: FontWeight.bold,fontSize: 30),),
          onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
          //navBarColorChange(const Color(0xff5092EF), Colors.green, Colors.white, Colors.green, Colors.green,Color(0xff0FB700));
          },),
          Row(children: [RichText(text: TextSpan(text: 'Home',style: TextStyle(color: home_color,fontWeight: FontWeight.bold,fontSize: 20),
              recognizer: TapGestureRecognizer()..onTap = () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
                //navBarColorChange(const Color(0xff5092EF), Colors.green, Colors.green, Colors.green, Colors.green);
              })),
            const SizedBox(width: 20),
            RichText(text: TextSpan(text: 'About Us',style:  TextStyle(color: about_color,fontSize: 20),
                recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutUsPage()),);
                }),),
            const SizedBox(width: 20),
            Container(
              //color: Colors.green,
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: market_container_color,
              ),
              alignment: Alignment.center,
              child: RichText(text: TextSpan(text: 'Market',style: TextStyle(color: market_text_color,fontSize: 20),
                  recognizer: TapGestureRecognizer()..onTap = (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const MarketPage()),);
                    },
              ),),
            ),
            const SizedBox(width: 20),
            RichText(text: TextSpan(text: 'Contact Us',style: TextStyle(color: contact_color,fontSize: 20),
                /*recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const EventsPage()),);
                  navBarColorChange(Colors.white, Colors.white, Colors.white, const Color(0xff5092EF), Colors.white);}*/
            )),
            const SizedBox(width: 20),
            RichText(text: TextSpan(text: 'Login',style: TextStyle(color: login_color,fontSize: 20),
                recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()),);}))
          ],)],
      ),
    );
  }
}

 //Drawer that contain navbar elements for mobile view
Widget createDrawer(BuildContext context)
{
  return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
          children: [
            ListTile(title: const Text('Home',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
            },),
            ListTile(title: const Text('About Us',style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutUsPage()),);
            },),
            ListTile(contentPadding: EdgeInsets.only(left: 90, right: 90),
              title: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff0FB700),),
                alignment: Alignment.center,
                child: const Text('Market',style: TextStyle(color: Colors.white,fontSize: 20),),),
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MarketPage()),);
            },),
            ListTile(title: const Text('Contact Us',style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,),/*onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const EventsPage()),);
            },*/),
            ListTile(title: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()),);
            },)
          ],),)
  );
}
