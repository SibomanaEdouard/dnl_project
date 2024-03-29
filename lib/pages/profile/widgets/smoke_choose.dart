// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:dnl_ui/core/widgets/custom_radio_group.dart';

class SmokeChoose extends StatefulWidget {
  final String? smoke;
  final Function onChange;

  const SmokeChoose({
    super.key,
    this.smoke,
    required this.onChange,
  });

  @override
  _SmokeChooseState createState() => _SmokeChooseState();
}

class _SmokeChooseState extends State<SmokeChoose> {
  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      'Smoker',
      'Non Smoker',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRadioGroup(
            value: widget.smoke, options: options, onChanged: widget.onChange),
      ],
    );
  }
}
