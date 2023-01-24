import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class allsongsList extends GetxController {
  var songcount;
  var songsList = [];
  getSonngCount() async {
    try {
      var response = await Dio().get(
          'https://devshamseer.github.io/all-audio-songs/allsongcount.json');
      songcount = await response.data["count"];
      print("Data${response.data["count"]}");
    } catch (e) {
      print(e);
    }
    update();
  }

  getSongList() async {
    await getSonngCount();
    for (var i = 1; i <= songcount; i++) {
      var songs =
          "https://devshamseer.github.io/all-audio-songs/allsongs/sonng${i}.mp3";
      songsList.add(songs);

      var seen = Set<String>();
      songsList = songsList.where((songs) => seen.add(songs)).toList();
    }

    update();
  }
}
