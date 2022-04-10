import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black,
        //
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1) Top bar

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Expanded(
                            child: Text(
                          "Good evening",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),

                        // SizedBox(width: 220),
                        Icon(
                          Icons.notifications,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.history),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.settings,
                        ),
                      ],
                    ),
                  ),

                  // 2.)playlist

                  const RecomendedSongsAndPlaylistRow(
                    playlistname1: "Daily Mix 1",
                    playlistname2: " Liked Songs",
                  ),
                  const RecomendedSongsAndPlaylistRow(
                    playlistname1: "Bawla",
                    playlistname2: "Punjabi Pop",
                  ),
                  const RecomendedSongsAndPlaylistRow(
                    playlistname1: "Bolloywood Butter",
                    playlistname2: "The Ranveer Show",
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Shows you might like

                  const TitleCard(title: "Shows you might like"),

                  // horizontal scrool view

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        children: const [
                          ShowsCard(showName: "Khan Sir"),
                          ShowsCard(showName: "SHRIMAD BhagwadGeeta"),
                          ShowsCard(showName: "Think Fast ,Talk Small"),
                          ShowsCard(showName: "Billinaire Mindset"),
                          ShowsCard(
                            showName: "Motivational Speech",
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const TitleCard(
                    title: "Your top Mixes",
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        children: const [
                          ShowsCard(showName: "Siddhu Moosewala"),
                          ShowsCard(showName: "Khasa aala chahar"),
                          ShowsCard(showName: "Amanraj Gill"),
                          ShowsCard(showName: "Kd Desi Rockstar"),
                          ShowsCard(showName: "Karan Aujla"),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const TitleCard(title: "Recentaly Played"),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        children: const [
                          ShowsCard(showName: "Siddhu Moosewala"),
                          ShowsCard(showName: "Khasa aala chahar"),
                          ShowsCard(showName: "Amanraj Gill"),
                          ShowsCard(showName: "Kd Desi Rockstar"),
                          ShowsCard(showName: "Karan Aujla"),
                        ],
                      ),
                    ),
                  ),
                ],
              )),

              // navigaation bar and player column above in stack

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  // player using app bar

                  MusicPlayerUsingAppBar(),

                  // bottom navigation bar with transparent baground

                  BottomNavBar(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.85),
        elevation: 2,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded),
            label: "Library",
          ),
        ]);
  }
}

class MusicPlayerUsingAppBar extends StatelessWidget {
  const MusicPlayerUsingAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
      child: AppBar(
        elevation: 5,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(5)),
            child: const Center(
              child: Text(
                "Song\n Image",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
        title: const Text("Song Name goes here",
            textAlign: TextAlign.start, style: TextStyle(fontSize: 12)),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Icon(
              Icons.devices_rounded,
              size: 30.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Icon(
              Icons.favorite_border_rounded,
              size: 32.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
            child: Icon(
              Icons.play_arrow,
              size: 40.0,
            ),
          ),
        ],
        backgroundColor: Colors.grey.shade900,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}

class TitleCard extends StatelessWidget {
  final String title;

  const TitleCard({Key? key, this.title = "Your title look like this"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
          wordSpacing: 1,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ShowsCard extends StatelessWidget {
  final String showName;
  const ShowsCard({Key? key, this.showName = "ShowName"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: Text(
              "Image \n Here",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
            width: 150,
            height: 120,
          ),
          SizedBox(
            // color: Colors.grey.shade900,
            child: Center(
                child: Text(
              showName,
              textAlign: TextAlign.center,
            )),
            height: 40,
            width: 150,
          )
        ],
      ),
    );
  }
}

class RecomendedSongsAndPlaylistRow extends StatelessWidget {
  final String playlistname1;
  final String playlistname2;

  const RecomendedSongsAndPlaylistRow(
      {Key? key,
      this.playlistname1 = "playlist1",
      this.playlistname2 = "playlist2"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(5)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Song\nImage  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
              Expanded(
                // flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    playlistname1,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(5)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Song\nImage  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    playlistname2,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
