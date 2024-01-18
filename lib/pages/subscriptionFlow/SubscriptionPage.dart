import 'package:dnl_ui/components/call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  // List to store chat messages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/back.svg'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading:
              true, // Set this to true to show the back button

          title: Text("Subscription")),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Upgrade your profile to the new Premium to access more packages",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 56,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 13, bottom: 13, left: 21, right: 21),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffe94057)),
                    borderRadius: BorderRadius.circular(5)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Current plan"), Text("Free")],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 1,
                    width:100,
                    color: const Color(0xffe94057),
                  ),
                  
                  Container(
                    
                    decoration:
                        BoxDecoration(
                          color: const Color(0xffd9d9d9),
                          
                          borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.only(
                        top: 11, bottom: 11, left: 48, right: 48),
                    child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Plans",
                            style: TextStyle(),
                          )
                        ]),
                  ),
                  Container(
                    height: 1,
                    width:100,
                    color: const Color(0xffe94057),
                  ),
                ],
              ),
               Container(
                padding: const EdgeInsets.only(
                    top: 18, bottom: 21, left: 21, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffe94057)),
                    borderRadius: BorderRadius.circular(15)),
                child: const Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("30 Day Free Trial",style: TextStyle(color: Color(0xffd1939b),fontSize: 22,fontWeight: FontWeight.w700),),
                     SizedBox(
                      width: 258,
                      child:Text("Potential to earn money but not allowed to cash out unless a plus, premium or exclusive package is purchased at the end of the trial",style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,

                    )
                    
                    ,)),
                    Row(
                      children: [
                      SizedBox(
                       
                        child: Icon(CupertinoIcons.check_mark_circled,color: Color(0xffd1939b),),
                      ),
                      SizedBox(width: 4,height: 30,),

                      Text("500 free coins",style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300
                      ),)
                      ],
                    ),
                    Row(
                      children: [
                      SizedBox(
                       
                        child: Icon(CupertinoIcons.check_mark_circled,color: Color(0xffd1939b),),
                      ),
                      SizedBox(width: 4,height: 30,),

                      Text("Choice of 3 music genres",style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300
                      ),)
                      ],
                    )
                  
                    ])
                    , Text("Free")],
                ),
              ),
            ],
          )),
    );
  }
}
