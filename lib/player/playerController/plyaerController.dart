import 'dart:developer';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mokz_player/player/plyer.dart';

class playerControllerall extends GetxController {
  var audioPlayePuse = false;
  var oldPlayPuse = false;
     var skip = 5;
    var newvl = 10;

  double currentSliderValue = 0;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final player = AudioPlayer();
  var num = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    audioPlayePuse = true;
    playPauseController();
  }

  plyasong() async {
    var duration = await player.setUrl(
        // Load a URL
        selectedSongs!);
    // await player.play();
    oldPlayPuse = true;

    update();
  }

  playPauseController() async {
    audioPlayePuse = !audioPlayePuse;

    if (audioPlayePuse == true) {
      await player.play();
    } else {
      await player.pause();
    }
    update();
  }

  conumt() {
    num++;
    update();
    print(num);
    return num;
  }

  songStop() async {
    await player.stop();
    await player.dispose();
  }

  oldsong() async {
    oldPlayPuse = !oldPlayPuse;
    // conumt();
    update();
    if (oldPlayPuse == true) {
      await player.play();
      // player.dispose();
      // audioPlayePuse=true;
    } else {
      await player.pause();
      //  audioPlayePuse=false;

    }
  }

  formatTime(Duration duration) {
    String towigets(int n) => n.toString().padLeft(2, '0');
    final hours = towigets(duration.inHours);
    final minuts = towigets(duration.inMinutes.remainder(60));
    final seconts = towigets(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0)
        {
          minuts,
          seconts,
        }
    ].join(':');
  }

  slider() async {
    currentSliderValue;
    await player.seek(Duration(seconds: currentSliderValue.toInt()));
    update();
  }

  skiping() {
 
    skip =skip+5;
    update();
  }
  backSkip(){
      skip =skip-5;
    update();
  }
}
