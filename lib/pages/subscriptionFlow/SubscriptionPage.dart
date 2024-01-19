import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class SubscriptionContainer {
  String title;
  String price;
  List<String> features;
  SubscriptionContainer(this.title, this.price, this.features);
}

class Subscription {
  DateTime startDate;
  DateTime endDate;
  String name;
  Subscription(this.startDate, this.endDate, this.name);
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  Subscription subscription =
      Subscription(DateTime.now(), DateTime.now(), "Free");
  String os = Platform.operatingSystem;

  String subscriptionSelected = "";
  List<SubscriptionContainer> containers = [
    SubscriptionContainer("Plus", "\$4.99/month", [
      "2500 free coins",
      "Choice of 2 music genres(unlimited access)",
      "Unlimited Likes",
      "Rewind",
      "Passport",
      "No Ads",
      "Boost"
    ]),
    SubscriptionContainer(
        "Premium", "\$9.99/month", ["Coins monthly", "Like you", "Top picks"]),
    SubscriptionContainer("Exclusive", "\$19.99/month", [
      "All DNL Plus  and DNL Premium Features",
      "30,000 coins",
      "Unlimited access to all music genres",
      "Priority Likes",
      "Message Before Matching",
      "Top Picks",
      "Control Who Sees You"
    ])
  ];
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

            title: const Text("Subscription")),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Upgrade your profile to the new Premium to access more packages",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 56,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 13, bottom: 13, left: 21, right: 21),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffe94057)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Current plan"),
                        Text(subscription.name)
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 1,
                        width: 100,
                        color: const Color(0xffe94057),
                      ),
                      Container(
                        decoration: BoxDecoration(
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
                        width: 100,
                        color: const Color(0xffe94057),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  GestureDetector(
                      onTap: () {
                        subscriptionSelected = "Free";
                        subscription = Subscription(
                            DateTime.now(), DateTime.now(), "Free");

                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 18, bottom: 21, left: 21, right: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: subscriptionSelected != "Free"
                                    ? const Color(0xffd1939b)
                                    : const Color(0xffe94057),
                                width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "30 Day Free Trial",
                                          style: TextStyle(
                                            color:
                                                subscriptionSelected == "Free"
                                                    ? const Color(0xffe94057)
                                                    : const Color(0xffd1939b),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          subscriptionSelected != "Free"
                                              ? 'assets/icons/premium.svg'
                                              : 'assets/icons/premiumSelected.svg',
                                          height: 50,
                                        ),
                                      ])),
                              const SizedBox(
                                  width: 238,
                                  child: Text(
                                    "Potential to earn money but not allowed to cash out unless a plus, premium or exclusive package is purchased at the end of the trial",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Icon(
                                      CupertinoIcons.check_mark_circled,
                                      color: subscriptionSelected == "Free"
                                          ? const Color(0xffe94057)
                                          : const Color(0xffd1939b),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                    height: 30,
                                  ),
                                  const Text(
                                    "500 free coins",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Icon(
                                      CupertinoIcons.check_mark_circled,
                                      color: subscriptionSelected == "Free"
                                          ? const Color(0xffe94057)
                                          : const Color(0xffd1939b),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                    height: 30,
                                  ),
                                  const Text(
                                    "Choice of 3 music genres",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              )
                            ]),
                      )),

                  for (SubscriptionContainer container in containers)
                    Container(
                        child: Column(children: [
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                          onTap: () {
                            subscriptionSelected = container.title;
                            subscription = Subscription(DateTime.now(),
                                DateTime.now(), container.title);

                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 18, bottom: 21, left: 21, right: 15),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        subscriptionSelected != container.title
                                            ? const Color(0xffd1939b)
                                            : const Color(0xffe94057),
                                    width: 2),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    container.title,
                                                    style: TextStyle(
                                                      color:
                                                          subscriptionSelected ==
                                                                  container
                                                                      .title
                                                              ? const Color(
                                                                  0xffe94057)
                                                              : const Color(
                                                                  0xffd1939b),
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 238,
                                                      child: Text(
                                                        container.price,
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      )),
                                                ]),
                                            SvgPicture.asset(
                                              subscriptionSelected !=
                                                      container.title
                                                  ? 'assets/icons/premium.svg'
                                                  : 'assets/icons/premiumSelected.svg',
                                              height: 50,
                                            ),
                                          ])),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  for (String feature in container.features)
                                    Row(
                                      children: [
                                        SizedBox(
                                          child: Icon(
                                            CupertinoIcons.check_mark_circled,
                                            color: subscriptionSelected ==
                                                    container.title
                                                ? const Color(0xffe94057)
                                                : const Color(0xffd1939b),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                          height: 30,
                                        ),
                                        Text(
                                          feature,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                ]),
                          ))
                    ])),

                  const SizedBox(
                    height: 25,
                  ),

                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            padding: const EdgeInsets.only(top: 16, bottom: 16),
                            backgroundColor: subscriptionSelected == ""
                                ? const Color(0xffd1939b)
                                : const Color(0xffe94057),
                            foregroundColor: Colors.white),
                        child: const Text("Subscribe now"),
                      ))
                ],
              )),
        ));
  }
}


void pay(){
  
}
