import 'package:flutter/material.dart';
import 'package:parallel/constants.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

class AudioRoomScreen extends StatelessWidget {
  final bool isHost;
  final String userName;
  final String roomId;
  const AudioRoomScreen(
      {super.key,
      required this.roomId,
      required this.userName,
      required this.isHost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ZegoUIKitPrebuiltLiveAudioRoom(
          appID: Credentials.appId,
          appSign: Credentials.appSignature,
          userID: "${userName}_${DateTime.now().millisecondsSinceEpoch}",
          userName: userName,
          roomID: roomId,
          config: isHost
              ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
              : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience(),
        ),
      ),
    );
  }
}
