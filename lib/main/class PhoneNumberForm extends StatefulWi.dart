// import 'package:flutter/material.dart';

// class PhoneNumberForm extends StatefulWidget {
//   @override
//   _PhoneNumberFormState createState() => _PhoneNumberFormState();
// }

// class _PhoneNumberFormState extends State<PhoneNumberForm> {
//   final _formKey = GlobalKey<FormState>();
//   String _phoneNumber;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Phone Number'),
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter a phone number';
//               }
//               if (!_isValidPhoneNumber(value)) {
//                 return 'Please enter a valid phone number';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               _phoneNumber = value;
//             },
//           ),
//           RaisedButton(
//             onPressed: () {
//               if (_formKey.currentState.validate()) {
//                 _formKey.currentState.save();
//                 // Perform further actions with the valid phone number
//                 print('Phone number: $_phoneNumber');
//               }
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }

//   bool _isValidPhoneNumber(String phoneNumber) {
//     // Regular expression to validate phone number format
//     RegExp phoneRegex = RegExp(r'^\+?[0-9]{10,12}$');
//     return phoneRegex.hasMatch(phoneNumber);
//   }
// }