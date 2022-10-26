
import 'package:agros/Login.dart';
import 'package:agros/SignUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'NavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        // Desktop View
        return Scaffold(
            body:  SingleChildScrollView(child: Column(children: const [HeroSection(),MarketSection(),Footer()],))
        );
      }else{ //Mobile View
        return Scaffold(
            appBar: AppBar(
              title: Text('Agros',style: const TextStyle(color: Colors.white),),
              centerTitle: true,
            ),
            drawer: createDrawer(context),
            body:  SingleChildScrollView(child: Column(children: const [HeroSection(),MarketSection(),Footer()],))
        );
      }
    });
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  desktopView(BuildContext context)
  {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
            children: [
              RichText(text: const TextSpan(text:'FARMERS',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40),
                children: [
                  TextSpan(text: '|',style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 40,)),
                  TextSpan(text:'MARKET',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40)),
                  TextSpan(text: '|',style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 40,)),
                  TextSpan(text:'BUYERS',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40)),]),textAlign: TextAlign.center,),
              const Text("We are connecting farmers and buyers to their needs in agriculture.",textAlign: TextAlign.center,),
              const SizedBox(height: 10,),
              MaterialButton(
                onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpPage()),);
                    //navBarColorChange(const Color(0xff5092EF), Colors.green, Colors.white, Colors.green, Colors.green,Color(0xff0FB700));
              },color: Color(0xff196D12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const Text('Sign Up',style: TextStyle(color: Colors.white,),),)],),
            Image.asset('assets/images/farmer_and_buyer.png',height: 400,width: 0.35 * MediaQuery.of(context).size.width,)],);
  }
  mobileView(BuildContext context)
  {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
              children: [
                Image.asset('assets/images/farmer_and_buyer.png',height: 200,width: 300,fit: BoxFit.fill,),
                RichText(text: const TextSpan(text:'FARMERS',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                    children: [
                      TextSpan(text: '|',style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 20,)),
                      TextSpan(text:'MARKET',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                      TextSpan(text: '|',style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 20,)),
                      TextSpan(text:'BUYERS',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),]),textAlign: TextAlign.center,),
                const Text("We are connecting farmers and buyers to their needs in agriculture.",textAlign: TextAlign.center,),
                const SizedBox(height: 10,),
                MaterialButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpPage()),);
                },color:  Color(0xff196D12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: const Text('Sign Up',style: TextStyle(color: Colors.white),),),
      ]),
    );
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        return Container(
          height: 500,
          //color: Colors.white,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/flower.png'),
                fit: BoxFit.fitWidth,
              )
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(children: [Navbar(const Color(0xff0FB700),Color(0xff0FB700),Colors.white,Color(0xff0FB700),Color(0xff0FB700),Color(0xff0FB700)),desktopView(context)],),
        );
      }else {
        return Container(
          height: 350,
          //color: Colors.white,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/flower.png'),
                fit: BoxFit.fitWidth,
              )
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(children: [Navbar(const Color(0xff0FB700),Color(0xff0FB700),Colors.white,Color(0xff0FB700),Color(0xff0FB700),Color(0xff0FB700)),mobileView(context)],),
        );
      }
    });
  }
}

class MarketSection extends StatelessWidget {
  const MarketSection({Key? key}) : super(key: key);

  produce(BuildContext context,double size)
  {
    return Container(
      height: 200,
      width: size * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/produce.jpg'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            offset: Offset(0,7),
            color: Colors.black26,
          )
        ]
      ),
      alignment: Alignment.center,
      child: Text("Produces",style: const TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
    );
  }

  land(BuildContext context,double size) {
    return Container(
      height: 200,
      width: size * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/land.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0,7),
              color: Colors.black26,
            )
          ]
      ),
      alignment: Alignment.center,
      child: const Text("Farm Land",style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
    );
  }

  inputs(BuildContext context,double size)
  {
    return Container(
      height: 200,
      width: size * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/inputs.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0,7),
              color: Colors.black26,
            )
          ]
      ),
      alignment: Alignment.center,
      child: const Text("Farm Inputs",style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
    );
  }

  machinery(BuildContext context,double size)
  {
    return Container(
      height: 200,
      width: size * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tractor.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0,7),
              color: Colors.black26,
            )
          ]
      ),
      alignment: Alignment.center,
      child: const Text("Farm Machinery",style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
    );
  }

  storage(BuildContext context,double size)
  {
    return Container(
      height: 200,
      width: size * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/storage.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0,7),
              color: Colors.black26,
            )
          ]
      ),
      alignment: Alignment.center,
      child: const Text("Storage",style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
    );
  }

  warehouse(BuildContext context,double size)
  {
    return Container(
      height: 200,
      width: size * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/warehouse.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0,7),
              color: Colors.black26,
            )
          ]
      ),
      alignment: Alignment.center,
      child: const Text("Warehouse",style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
    );
  }

  finance(BuildContext context,double size)
  {
    return Container(
      height: 200,
      width: size * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/finance.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0,7),
              color: Colors.black26,
            )
          ]
      ),
      alignment: Alignment.center,
      child: const Text("Finance",style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
    );
  }

  logistic(BuildContext context,double size)
  {
    return Container(
      height: 200,
      width: size * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logistic.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0,7),
              color: Colors.black26,
            )
          ]
      ),
      alignment: Alignment.center,
      child: const Text("Logistics",style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 600,
      color: const Color(0xffF4F4F4),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        return Column( // Desktopview
          children: [
            const Text('Market',style: TextStyle(color: Color(0xff0FB700),fontSize: 40,fontWeight: FontWeight.bold),),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                produce(context,0.2),land(context,0.2),inputs(context,0.2),machinery(context,0.2)
              ],
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                storage(context,0.2),warehouse(context,0.2),finance(context,0.2),logistic(context,0.2)
              ],
            )
          ],);
      }else {
        // mobileview
        return Column(
          children: [
            const Text('Market',style: TextStyle(color: Color(0xff0FB700),fontSize: 30,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            produce(context,0.6),
            const SizedBox(height: 30,),
            land(context,0.6),
            const SizedBox(height: 30,),
            inputs(context,0.6),
            const SizedBox(height: 30,),
            machinery(context,0.6),
            const SizedBox(height: 30,),
            storage(context,0.6),
            const SizedBox(height: 30,),
            warehouse(context,0.6),
            const SizedBox(height: 30,),
            finance(context,0.6),
            const SizedBox(height: 30,),
            logistic(context,0.6)
          ],);
      }
    }),
    );
  }

}

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<Footer> {



// Validate Newsletter email address before submit.
  String? message;
  validateEmail(String email){

    if(email.isEmpty){
      setState(() {
        message = "Email can not be empty";
      });
    }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(email)){
      setState(() {
        message = "Invalid Email Address";
      });
    }else{
      setState(() {
        //message = "Sent Successful";
      });
    }
  }

  Column leftContents(BuildContext context,CrossAxisAlignment alignment,bool mobileView)
  {
    return Column(
      crossAxisAlignment: alignment,
      children: [RichText(text: TextSpan(text: 'Home',style: TextStyle(color: Colors.white,fontSize: 20),
          /*recognizer: TapGestureRecognizer()..onTap = (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutPage(),));}*/)),
        const SizedBox(height: 15,),
        RichText(text: TextSpan(text: 'About Us',style: TextStyle(color: Colors.white,fontSize: 20),
            /*recognizer: TapGestureRecognizer()..onTap = (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ContactPage(),));}*/)),
        const SizedBox(height: 15,),
        RichText(text: const TextSpan(text: 'Market',style: TextStyle(color: Colors.white,fontSize: 20),)),
        SizedBox(height: 15,),
        RichText(text: const TextSpan(text: 'Contact Us',style: TextStyle(color: Colors.white,fontSize: 20),)),
        SizedBox(height: 15,),
        RichText(text: const TextSpan(text: 'Account',style: TextStyle(color: Colors.white,fontSize: 20),)),
        SizedBox(height: 40,),
        RichText(text: const TextSpan(text: 'Term of service',style: TextStyle(color: Colors.white,fontSize: 20),)),
        SizedBox(height: 15,),
        RichText(text: const TextSpan(text: 'Privacy Policy',style: TextStyle(color: Colors.white,fontSize: 20),)),
        const SizedBox(height: 30,),
      ],
    );
  }

  Column centerContents(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(text: TextSpan(text: 'Our Services',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),
        const SizedBox(height: 10,),
        RichText(text: TextSpan(text: 'Farmland',style: TextStyle(color: Colors.white,fontSize: 20,),)),
        const SizedBox(height: 10,),
        RichText(text: const TextSpan(text: 'Farm machinery',style: TextStyle(color: Colors.white,fontSize: 20),)),
        SizedBox(height: 10,),
        RichText(text: const TextSpan(text: 'Agri-inputs',style: TextStyle(color: Colors.white,fontSize: 20),)),
        SizedBox(height: 10,),
        RichText(text: const TextSpan(text: 'Produces',style: TextStyle(color: Colors.white,fontSize: 20),)),
        SizedBox(height: 10,),
        RichText(text: const TextSpan(text: 'Storage',style: TextStyle(color: Colors.white,fontSize: 20),)),
        SizedBox(height: 10,),
        RichText(text: const TextSpan(text: 'Warehouse',style: TextStyle(color: Colors.white,fontSize: 20),)),
        const SizedBox(height: 10,),
        RichText(text: const TextSpan(text: 'Finance',style: TextStyle(color: Colors.white,fontSize: 20),)),
        SizedBox(height: 10,),
        RichText(text: const TextSpan(text: 'Logistics',style: TextStyle(color: Colors.white,fontSize: 20),)),
      ],
    );
  }

  Column rightContents(CrossAxisAlignment alignment,double size)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Agros',style: TextStyle(color: Color(0xff18FB04),fontWeight: FontWeight.bold,fontSize: 30),),
        SizedBox(height: 15,),
        Text('Get in Touch',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
        SizedBox(height: 15,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(FontAwesomeIcons.phone,color: Colors.white,size: 20,),Text('  +2348079279899',style: TextStyle(color: Colors.white),),]),
        const SizedBox(height: 10,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(FontAwesomeIcons.envelope,color: Colors.white,size: 20,),Text('  hello@agros.com',style: TextStyle(color: Colors.white),),]),
        SizedBox(height: 30,),
        const Text('Join Our Newsletter',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        const SizedBox(height: 5,),
        SizedBox(width: size * MediaQuery.of(context).size.width,
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Your Email',fillColor: Colors.white,filled: true,),
          ), ),
        const SizedBox(height: 10,),
        MaterialButton(onPressed: (){

        },
          color:  Color(0xff196D12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Text('Subscribe',style: TextStyle(color: Colors.white,fontStyle: FontStyle.normal),),),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff3D3F3D),
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: LayoutBuilder(builder: (context,constraints){
        //Desktop view of footer
        if(constraints.biggest.width > 800){
          return Column(
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [leftContents(context,CrossAxisAlignment.start,true),centerContents(context,),rightContents(CrossAxisAlignment.start,0.2)],
            ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('\u00a9 2022 Agros Limited',style: TextStyle(color: Colors.white,fontSize: 18),),
                  SizedBox(width: 80,),
                  Row(
                  children: [
                    const Text('Follow us on',style: TextStyle(color: Colors.white,fontFamily: 'Poppins-Regular'),),
                    IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.instagram,color: Colors.white,size: 20,)),
                    IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.facebook,color: Colors.white,size: 20,)),
                    IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 20,)),],),
            ]),

            ]);
        }// Mobile view of footer
        else {
          return Column(
            children: [
              leftContents(context,CrossAxisAlignment.center,false),
              SizedBox(height: 30,),
              centerContents(context),
              SizedBox(height: 40,),
              rightContents(CrossAxisAlignment.center,0.5),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Follow us on',style: TextStyle(color: Colors.white,fontFamily: 'Poppins-Regular'),),
                  IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.instagram,color: Colors.white,size: 20,)),
                  IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.facebook,color: Colors.white,size: 20,)),
                  IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 20,)),],),
        const SizedBox(height: 20,),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
        Text('\u00a9 2022 Agros Limited',style: TextStyle(color: Colors.white,fontSize: 15),),
            ],),
            ]);
        }
      }),
    );

  }
}
