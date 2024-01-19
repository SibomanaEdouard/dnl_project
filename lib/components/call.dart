import 'package:flutter/cupertino.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';



class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID, required this.type})
      : super(key: key);
final String type;
  final String callID;


  @override
  Widget build(BuildContext context) {
    ZegoUIKitPrebuiltCallConfig config;

    // Use a conditional statement to set the appropriate configuration based on the type
    if (type =="audio") {
      config = ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();
    } else {
      config = ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall();
    }

    return ZegoUIKitPrebuiltCall(
      appID: 1595946617, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          "d89e3f0555ba1484680b661b8126df9947f980d74fd346de79d5340952a1bbd9", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: 'user_id',
      userName: 'user_name',
      callID: callID,
      config: config, // Set the configuration based on the type
    );
  }
}
