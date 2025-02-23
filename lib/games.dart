import 'package:flutter/material.dart';
import 'package:myapp/chatbot.dart';
import 'package:myapp/dash.dart';
import 'package:myapp/main.dart';
import 'package:url_launcher/url_launcher.dart';


class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.teal.shade700,
          backgroundColor:Color.fromRGBO(159, 95, 238, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(username: '', authUser: null,),
                                  ),
                                );
            },
          ),
          title: Text("Hello"),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.notifications, color: Colors.black),
          //     onPressed: () {},
          //   ),
          // ],
        ),
        body: GradientBackground(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GameTile(
                  title: "Sudoku",
                  imagePath: "assets/sudoku.png",
                  url: "https://play.google.com/store/apps/details?id=com.zeeron.sudoku.puzzle",
                ),
                GameTile(
                  title: "CrossWord",
                  imagePath: "assets/crossword.png",
                  url: "https://play.google.com/store/apps/details?id=com.appspot.orium_blog.crossword.eng",
                ),
              ],
            ),
          ),
        ),
              bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //const Icon(Icons.home, color: Color(0xFF5F9EA0)),
              IconButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeScreen(username: '',),
                  //   ),
                  // );
                },
                icon: Icon(
                  Icons.home,
                  color: Color.fromRGBO(151, 149, 149, 0.612),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MedicalBotScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.monitor,
                  color: Color.fromRGBO(151, 149, 149, 0.612),
                ),
              ),
              Image.asset(
                'assets/3rd.png',
                height: 80,
                width: 80,
              ),
              Image.asset(
                'assets/4th.png',
                height: 80,
                width: 80,
              ),
              const Icon(Icons.access_time, color: Color.fromRGBO(151, 149, 149, 0.612)),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GameSelectionScreen()),
                  );
                },
                child: Image.asset(
                  'assets/6th.png',
                  height: 80,
                  width: 80,
                  color: Color(0xFF5F9EA0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final String url;

  const GameTile({super.key, required this.title, required this.imagePath, required this.url});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(title, style: TextStyle(fontSize: 18)),
        onTap: () => _launchURL(url),
      ),
    );
  }
}