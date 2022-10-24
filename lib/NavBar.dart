
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800)
      {
        return const DesktopNavbar();
      }else { return Container(); }
    });
  }
}
// Colors of NavBar texts
Color home_color = const Color(0xff5092EF);
Color about_color = Colors.white;
Color techtalk_color = Colors.white;
Color events_color = Colors.white;
Color lab_color = Colors.white;

class DesktopNavbar extends StatefulWidget {
  const DesktopNavbar({Key? key}) : super(key: key);

  @override
  State<DesktopNavbar> createState() => _DesktopNavbarState();
}
class _DesktopNavbarState extends State<DesktopNavbar> {

  // Change of navbar text color from to blue
  navBarColorChange(Color x,Color y,Color z, Color w,Color t)
  {
    setState((){
      home_color = x;
      about_color = y;
      techtalk_color = z;
      events_color = w;
      lab_color = t;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 120,vertical: 15),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [GestureDetector(child: const Text('Agros',style: TextStyle(color: Color(0xff0FB700),fontWeight: FontWeight.bold,fontSize: 30),),
          onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
          navBarColorChange(const Color(0xff5092EF), Colors.green, Colors.green, Colors.green, Colors.green);
          },),
          Row(children: [RichText(text: TextSpan(text: 'Home',style: TextStyle(color: Color(0xff0FB700),fontWeight: FontWeight.bold,fontSize: 20),
              recognizer: TapGestureRecognizer()..onTap = () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
                navBarColorChange(const Color(0xff5092EF), Colors.green, Colors.green, Colors.green, Colors.green);
              })),
            const SizedBox(width: 20),
            RichText(text: const TextSpan(text: 'About Us',style:  TextStyle(color: Color(0xff0FB700),fontSize: 20),
                /*recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutPage()),);
                  navBarColorChange(Colors.white, const Color(0xff5092EF), Colors.white, Colors.white, Colors.white);
                }*/),),
            const SizedBox(width: 20),
            Container(
              //color: Colors.green,
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff0FB700),
              ),
              alignment: Alignment.center,
              child: RichText(text: TextSpan(text: 'Market',style: TextStyle(color: Colors.white,fontSize: 20),
                  /*recognizer: TapGestureRecognizer()..onTap = (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const CodeTalkPage()),);
                    navBarColorChange(Colors.white, Colors.white, const Color(0xff5092EF), Colors.white, Colors.white);},*/
              ),),
            ),
            const SizedBox(width: 20),
            RichText(text: TextSpan(text: 'Contact Us',style: TextStyle(color: Color(0xff0FB700),fontSize: 20),
                /*recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const EventsPage()),);
                  navBarColorChange(Colors.white, Colors.white, Colors.white, const Color(0xff5092EF), Colors.white);}*/
            )),
            const SizedBox(width: 20),
            RichText(text: TextSpan(text: 'Login',style: TextStyle(color: Color(0xff0FB700),fontSize: 20),
                /*recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewsPage()),);
                  navBarColorChange(Colors.white, Colors.white, Colors.white, Colors.white, const Color(0xff5092EF));}*/))
          ],)],
      ),
    );
  }
}

// Drawer that contain navbar elements for mobile view
/*Widget createDrawer(BuildContext context)
{
  return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(padding: EdgeInsets.zero,
          children: [
            ListTile(title: const Text('Home',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
            },),
            ListTile(title: const Text('About',style: TextStyle(color: Colors.white,fontSize: 20)),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutPage()),);
            },),
            ListTile(title: const Text('CodeTalk',style: TextStyle(color: Colors.white,fontSize: 20)),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CodeTalkPage()),);
            },),
            ListTile(title: const Text('Events',style: TextStyle(color: Colors.white,fontSize: 20)),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const EventsPage()),);
            },),
            ListTile(title: const Text('News',style: TextStyle(color: Colors.white,fontSize: 20)),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewsPage()),);
            },)
          ],),)
  );
}*/
