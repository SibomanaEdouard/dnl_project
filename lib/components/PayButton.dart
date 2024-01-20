import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:dnl_ui/pages/subscriptionFlow/payment/payment_configuration.dart'
    as payment_configurations;

// Assume you have already initialized _payClient
late final Pay _payClient = Pay({
  PayProvider.google_pay: PaymentConfiguration.fromJsonString(
    payment_configurations.defaultGooglePay,
  ),
  PayProvider.apple_pay: PaymentConfiguration.fromJsonString(
    payment_configurations.defaultApplePay,
  ),
});

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  ),
];

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Platform.isIOS
              ? CustomApplePayButton(
                  payClient: _payClient,
                  onPaymentResult: (result) {
                    // Handle Apple Pay result
                    print('Apple Pay Result: $result');
                  },
                )
              : CustomGooglePayButton(
                  payClient: _payClient,
                  onPaymentResult: (result) {
                    // Handle Google Pay result
                    print('Google Pay Result: $result');
                  },
                )
        ],
      ),
    );
  }
}

class CustomGooglePayButton extends StatelessWidget {
  final Pay payClient;
  final void Function(Map<String, dynamic> result) onPaymentResult;

  const CustomGooglePayButton({
    required this.payClient,
    required this.onPaymentResult,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _startGooglePayFlow(context),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  backgroundColor: "" == ""
                      ? const Color(0xffd1939b)
                      : const Color(0xffe94057),
                  foregroundColor: Colors.white),
              child: Text("Subscribe"),
            )));
  }

  void _startGooglePayFlow(BuildContext context) async {
    try {
      final result = await payClient.showPaymentSelector(
        PayProvider.google_pay,
        _paymentItems,
      );
      onPaymentResult(result);
    } catch (error) {
      // Handle error
      print('Google Pay Error: $error');
    }
  }
}

class CustomApplePayButton extends StatelessWidget {
  final Pay payClient;
  final void Function(Map<String, dynamic> result) onPaymentResult;

  const CustomApplePayButton({
    required this.payClient,
    required this.onPaymentResult,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _startApplePayFlow(context),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  backgroundColor: "" == ""
                      ? const Color(0xffd1939b)
                      : const Color(0xffe94057),
                  foregroundColor: Colors.white),
              child: Text("Subscribe"),
            )));
  }

  void _startApplePayFlow(BuildContext context) async {
    try {
      final result = await payClient.showPaymentSelector(
        PayProvider.apple_pay,
        _paymentItems,
      );
      onPaymentResult(result);
    } catch (error) {
      // Handle error
      print('Apple Pay Error: $error');
    }
  }
}
