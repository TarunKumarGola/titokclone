import 'package:flutter/material.dart';
import 'package:titokclone/variable.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  buildprofile() {
    return Container(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Positioned(
              left: (60 / 2) - (50 / 2),
              child: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(
                        'https://www.accountingweb.co.uk/sites/all/modules/custom/sm_pp_user_profile/img/default-user.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Positioned(
              bottom: 0,
              left: 20,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(15)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // video
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(color: Colors.black),
          ),
          Column(
            children: [
              Container(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Following",
                      style: mystyle(17, Colors.white, FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "For You",
                      style: mystyle(17, Colors.white, FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        height: 70,
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Bata Shoes",
                              style: mystyle(15, Colors.white, FontWeight.bold),
                            ),
                            Text(
                              "Rs 500",
                              style: mystyle(15, Colors.white, FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                                Text(
                                  "10% off",
                                  style: mystyle(
                                      15, Colors.white, FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // right Section
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(top: 150),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildprofile(),
                          Column(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 40,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "50",
                                style: mystyle(20, Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.comment,
                                size: 40,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "10",
                                style: mystyle(20, Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.share,
                                size: 40,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "20",
                                style: mystyle(20, Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
