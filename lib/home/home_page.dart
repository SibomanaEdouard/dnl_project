// ignore_for_file: depend_on_referenced_packages

import 'package:dnl_ui/core/values/constants.dart';
import 'package:dnl_ui/core/widgets/countdown_timer/timer_countdown.dart';
import 'package:dnl_ui/invite/invite_friend_page.dart';
import 'package:dnl_ui/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';

import '../core/values/colors.dart';
import '../core/values/custom_text_style.dart';
import '../core/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static Page<void> page() => const MaterialPage<void>(child: HomePage());
  static Route<void> route() =>
      MaterialPageRoute<void>(builder: (_) => const HomePage());

  @override
  Widget build(BuildContext context) {
    double currentDate = DateTime.now().millisecondsSinceEpoch / 1000;
    double releaseDate = Constants.release_date.millisecondsSinceEpoch / 1000;
    double seconds = releaseDate - currentDate;
    return Scaffold(
        backgroundColor: ThemeColors.background,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/images/04.jpg",
                fit: BoxFit.cover,
              )),
          Container(
              decoration: const BoxDecoration(
                gradient: ThemeColors.gradient,
              ),
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        const SizedBox(
                          height: 61,
                        ),
                        SvgPicture.asset(
                          "assets/icons/done.svg",
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Well done!",
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.getHeaderStyle(
                              Theme.of(context).colorScheme.secondary, 40),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "The app will be available soon",
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.getTitleStyle(
                              Theme.of(context).colorScheme.secondary),
                        ),
                        const SizedBox(
                          height: 72,
                        ),
                        Countdown(
                          // controller: _controller,
                          seconds: seconds.toInt(),
                          build: (_, double time) => Row(
                            children: [
                              Expanded(
                                child: Column(children: [
                                  Container(
                                    height: 80,
                                    padding: time ~/ 86400 <= 99
                                        ? const EdgeInsets.all(12)
                                        : const EdgeInsets.symmetric(
                                            vertical: 12),
                                    decoration: ShapeDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      time ~/ 86400 <= 99
                                          ? NumberFormat('00')
                                              .format(time ~/ 86400)
                                          : NumberFormat('000')
                                              .format(time ~/ 86400),
                                      style: CustomTextStyle.getHeaderStyle(
                                          Theme.of(context)
                                     .colorScheme
                                              .secondary,
                                          44,
                                          FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Days",
                                    style: CustomTextStyle.getDescStyle(
                                        Theme.of(context).colorScheme.secondary,
                                        16,
                                        FontWeight.w700),
                                  )
                                ]),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(children: [
                                  Container(
                                    height: 80,
                                    padding: const EdgeInsets.all(12),
                                    decoration: ShapeDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      NumberFormat('00')
                                          .format((time % 86400) ~/ 3600),
                                      style: CustomTextStyle.getHeaderStyle(
                                          Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          44,
                                          FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Hours",
                                    style: CustomTextStyle.getDescStyle(
                                        Theme.of(context).colorScheme.secondary,
                                        16,
                                        FontWeight.w700),
                                  )
                                ]),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(children: [
                                  Container(
                                    height: 80,
                                    padding: const EdgeInsets.all(12),
                                    decoration: ShapeDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      NumberFormat('00').format(
                                          (((time % 86400) % 3600) ~/ 60)),
                                      style: CustomTextStyle.getHeaderStyle(
                                          Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          44,
                                          FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Min",
                                    style: CustomTextStyle.getDescStyle(
                                        Theme.of(context).colorScheme.secondary,
                                        16,
                                        FontWeight.w700),
                                  )
                                ]),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(children: [
                                  Container(
                                    height: 80,
                                    padding: const EdgeInsets.all(12),
                                    decoration: ShapeDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      NumberFormat('00')
                                          .format(((time % 60).toInt())),
                                      style: CustomTextStyle.getHeaderStyle(
                                          Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          44,
                                          FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Sec",
                                    style: CustomTextStyle.getDescStyle(
                                        Theme.of(context).colorScheme.secondary,
                                        16,
                                        FontWeight.w700),
                                  )
                                ]),
                              )
                            ],
                          ),
                          interval: const Duration(milliseconds: 1000),
                          onFinished: () {
                            Row(
                              children: [
                                Expanded(
                                  child: Column(children: [
                                    Container(
                                      height: 80,
                                      padding: const EdgeInsets.all(12),
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        '00',
                                        style: CustomTextStyle.getHeaderStyle(
                                            Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            44,
                                            FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Days",
                                      style: CustomTextStyle.getDescStyle(
                                          Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          16,
                                          FontWeight.w700),
                                    )
                                  ]),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  flex: 1,
                                  child: Column(children: [
                                    Container(
                                      height: 80,
                                      padding: const EdgeInsets.all(12),
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        '00',
                                        style: CustomTextStyle.getHeaderStyle(
                                            Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            44,
                                            FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Hours",
                                      style: CustomTextStyle.getDescStyle(
                                          Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          16,
                                          FontWeight.w700),
                                    )
                                  ]),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  flex: 1,
                                  child: Column(children: [
                                    Container(
                                      height: 80,
                                      padding: const EdgeInsets.all(12),
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        '00',
                                        style: CustomTextStyle.getHeaderStyle(
                                            Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            44,
                                            FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Min",
                                      style: CustomTextStyle.getDescStyle(
                                          Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          16,
                                          FontWeight.w700),
                                    )
                                  ]),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  flex: 1,
                                  child: Column(children: [
                                    Container(
                                      height: 80,
                                      padding: const EdgeInsets.all(12),
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        '00',
                                        style: CustomTextStyle.getHeaderStyle(
                                            Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            44,
                                            FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Sec",
                                      style: CustomTextStyle.getDescStyle(
                                          Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          16,
                                          FontWeight.w700),
                                    )
                                  ]),
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(children: <Widget>[
                          Expanded(
                              child: Button(
                                  title: "NOTIFY ME ABOUT RELEASE",
                                  onPressed: () {
                                    //richard
                                    Navigator.of(context).push<void>(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MainPage()
                                            // const SignupPage(),
                                      ),
                                    );
                                  })),
                        ]),
                        const SizedBox(height: 16),
                        Row(children: <Widget>[
                          Expanded(
                              child: Button(
                                  title: "INVITE MORE PEOPLE",
                                  outlined: true,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push<void>(InviteFriendPage.route());
                                  })),
                        ]),
                        const SizedBox(height: 50),
                      ],
                    )
                  ]))
        ]));
  }
}
