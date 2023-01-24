import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mokz_player/api/api.dart';
import 'package:mokz_player/player/playerController/plyaerController.dart';
import 'package:mokz_player/player/plyer.dart';
import 'package:mokz_player/widgets/textfild/searchbar.dart';
import 'package:animate_do/animate_do.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final allsongsList songsList = Get.put(allsongsList());
  final playerControllerall oldplyerController = Get.put(playerControllerall());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text('data',style: TextStyle(color: Colors.white),)

                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: searchField(),
                    // )
                    SizedBox(
                      height: 50,
                    ),
                    // Text(
                    //   '20/12',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'MOKZ Player',
                            style: TextStyle(color: Colors.white, fontSize: 41),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                CupertinoIcons.device_desktop,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   'data kdfjkd jfdi',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 180),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'New songs',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                ),
                              ),
                              Text(
                                'All',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GetBuilder(
                        init: songsList,
                        initState: (state) {
                          songsList.getSongList();
                        },
                        builder: (sonsgsListController) {
                          return Container(
                            height: 170,
                            // color: Colors.red,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: sonsgsListController.songsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            print(sonsgsListController
                                                .songsList[index]);
                                            print(sonsgsListController
                                                .songsList.length);
                                            if (kIsWeb) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => plyer(
                                                          selectedSong:
                                                              sonsgsListController
                                                                      .songsList[
                                                                  index],
                                                        )),
                                              );
                                            }
                                            {
                                              Get.to(plyer(
                                                selectedSong:
                                                    sonsgsListController
                                                        .songsList[index],
                                              ));
                                            }
                                          },
                                          child: oldplyerController
                                                      .oldPlayPuse ==
                                                  true
                                              ? SpinPerfect(
                                                  infinite: true,
                                                  child: Container(
                                                    height: 150,
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          offset: Offset(2, 2),
                                                          blurRadius: 12,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.16),
                                                        )
                                                      ],
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              'https://images.unsplash.com/photo-1531651008558-ed1740375b39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                                                          fit: BoxFit.cover),
                                                      color: Color.fromARGB(
                                                          255, 18, 107, 203),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Center(
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors
                                                                .black, //                   <--- border color
                                                            width: 8.0,
                                                          ),
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  height: 150,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset: Offset(2, 2),
                                                        blurRadius: 12,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.16),
                                                      )
                                                    ],
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            'https://images.unsplash.com/photo-1531651008558-ed1740375b39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                                                        fit: BoxFit.cover),
                                                    color: Color.fromARGB(
                                                        255, 18, 107, 203),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors
                                                              .black, //                   <--- border color
                                                          width: 8.0,
                                                        ),
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text('data${index + 1}')
                                      ],
                                    ));
                              },
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My songs',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              'All',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        // color: Colors.red,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 12,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Container(
                                height: 160,
                                // color: Colors.green,
                                margin: EdgeInsets.only(top: 50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(left: 25, top: 9),
                                          height: 160,
                                          width: 180,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(2, 2),
                                                blurRadius: 12,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.16),
                                              )
                                            ],
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://images.unsplash.com/photo-1524678606370-a47ad25cb82a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'),
                                                fit: BoxFit.cover),
                                            color: Color.fromARGB(
                                                255, 18, 107, 203),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255,
                                                      240,
                                                      145,
                                                      174), //                   <--- border color
                                                  width: 5.0,
                                                ),
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 180,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(2, 2),
                                                blurRadius: 12,
                                                color:
                                                    Color.fromARGB(40, 0, 0, 0),
                                              )
                                            ],
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://images.unsplash.com/photo-1524678606370-a47ad25cb82a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'),
                                                fit: BoxFit.cover),
                                            color: Colors.green,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recommended songs',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              'All',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 170,
                        // color: Colors.red,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 125,
                                    width: 125,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://images.unsplash.com/photo-1516280440614-37939bbacd81?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                                            fit: BoxFit.cover),
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('data'),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150, left: 28),
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 12),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1516280440614-37939bbacd81?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                              fit: BoxFit.cover),
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60),
                        child: ListTile(
                          title: Text(
                            'data',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          subtitle: Text('data'),
                        ),
                      ),
                      Positioned(
                        right: 29,
                        top: 15,
                        child: Row(
                          children: [
                            GetBuilder(
                              init: oldplyerController,
                              builder: (oldcontroll) {
                                return GestureDetector(
                                  onTap: (() {
                                    // oldplyerController.audioPlayePuse =
                                    //     !oldplyerController.audioPlayePuse;
                                    // oldplyerController.audioPlayePuse=! oldplyerController.audioPlayePuse;
                                    oldplyerController.oldsong();
                                  }),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 18, 107, 203),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: oldplyerController.oldPlayPuse ==
                                                true
                                            ? Icon(
                                                CupertinoIcons.pause,
                                                color: Colors.white,
                                                size: 19,
                                              )
                                            : Icon(
                                                CupertinoIcons.play_arrow_solid,
                                                color: Color(0xFFFFFFFF),
                                                size: 19,
                                              )),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 241, 237, 237),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    // final player = AudioPlayer();
                                    // final duration = await player.setUrl(
                                    //     // Load a URL
                                    //    "https://devshamseer.github.io/all-audio-songs/allsongs/sonng17.mp3");
                                    // await player.play();

                                    Get.to(home());
                                  },
                                  child: Icon(
                                    CupertinoIcons.playpause_fill,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
