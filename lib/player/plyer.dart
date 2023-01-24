import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import 'package:mokz_player/api/api.dart';
import 'package:mokz_player/home/home.dart';
import 'package:mokz_player/player/playerController/plyaerController.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

var selectedSongs;

class plyer extends StatelessWidget {
  final playerControllerall allPlyerControll = Get.put(playerControllerall());
  final allsongsList songsList = Get.find();

  // RecorderController ppcontroller = RecorderController();

  // PlayerController _controller = PlayerController();

  var selectedSong;

  plyer({required this.selectedSong});

  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: allPlyerControll,
        initState: (state) async {
          selectedSongs = selectedSong;
          await allPlyerControll.plyasong();
          await allPlyerControll.playPauseController();

          print("SelectedSong${selectedSong}");
        },
        dispose: (state) async {
          //  allPlyerControll.songStop();
        },
        builder: ((getxplyterController) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // getxplyterController.player.dispose();
                            getxplyterController.audioPlayePuse = false;
                            Get.offAll(home());
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 12,
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                )
                              ],
                              color: Color.fromARGB(255, 255, 254, 254),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                CupertinoIcons.back,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Now  Playing',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 12,
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                              )
                            ],
                            color: Color.fromARGB(255, 255, 254, 254),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.more_horiz_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Container(),
                  //   ],
                  // ),
                  Container(
                    // color: Colors.red,
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.only(left: 85, top: 9),
                                height: 160,
                                width: 180,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.16),
                                    )
                                  ],
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1608142521278-d2da5905428e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80'),
                                      fit: BoxFit.cover),
                                  color: Color.fromARGB(255, 18, 107, 203),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromARGB(255, 240, 145,
                                            174), //                   <--- border color
                                        width: 8.0,
                                      ),
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 12,
                                    color: Color.fromARGB(40, 0, 0, 0),
                                  )
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://images.unsplash.com/photo-1524678606370-a47ad25cb82a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.red,
                            )),
                        Text(
                          'Song Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.add,
                              color: Color.fromARGB(255, 11, 84, 144),
                              size: 31,
                            )),
                      ],
                    ),
                  ),
                  Text(
                    'shamesssr',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 65),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        // bottomRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                        // bottomLeft: Radius.circular(40.0)
                      ),
                    ),
                    child: Column(
                      children: [
                        Slider(
                            max: 100,
                            value: allPlyerControll.currentSliderValue,
                            onChanged: ((value) {
                              allPlyerControll.slider();
                              allPlyerControll.currentSliderValue = value;
                            })),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1:00",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '3:01',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 51),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: Icon(Icons.replay)),
                              IconButton(
                                  color: Colors.white,
                                  onPressed: ()async {
                                    allPlyerControll.backSkip();
                                    print("NNNR${allPlyerControll.skip}");
                                    await allPlyerControll.player
                                        .seek(Duration(seconds: allPlyerControll.skip));
                                  },
                                  icon: Icon(Icons.fast_rewind_rounded)),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment(0.8, 1),
                                    colors: <Color>[
                                      Color.fromARGB(255, 139, 180, 255),
                                      Color(0xff2771fa),
                                      Color.fromARGB(255, 111, 153, 230),
                                    ], // Gradient from https://learnui.design/tools/gradient-generator.html
                                    tileMode: TileMode.mirror,
                                  ),
                                ),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () async {
                                      getxplyterController.conumt();
                                      getxplyterController
                                          .playPauseController();
                                      print(
                                          getxplyterController.audioPlayePuse);
                                    },
                                    icon: getxplyterController.audioPlayePuse ==
                                            true
                                        ? Icon(Icons.pause)
                                        : Icon(Icons.play_arrow)),
                              ),
                              IconButton(
                                  color: Colors.white,
                                  onPressed: () async {
                                    // songsList.getSonngCount();
                                    // print(  songsList.songcount);
                                    allPlyerControll.skiping();
                                    print("NNNR${allPlyerControll.skip}");
                                    await allPlyerControll.player
                                        .seek(Duration(seconds: allPlyerControll.skip));
                                  },
                                  icon: Icon(Icons.fast_forward_rounded)),
                              IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.repeat))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
