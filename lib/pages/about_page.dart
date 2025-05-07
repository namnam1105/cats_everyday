import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("About Cats Everyday"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Card(
                  margin: EdgeInsets.all(width * 0.01),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: Image.asset("img/logo.png", scale: width / 100),
                  ),
                ),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(width * 0.01),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cats Everyday",
                            style: TextStyle(fontSize: width * 0.06),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            "Made by namnam",
                            style: TextStyle(fontSize: width * 0.06),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            "Written on flutter",
                            style: TextStyle(fontSize: width * 0.055),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Card(
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(fontSize: width * 0.07),
                    ),
                    SizedBox(height: height * 0.005),
                    Text(
                      "Cats Everyday is a Flutter app that is very cat. meow "
                      "I really just got an idea of this app randomly. hi ig",
                      style: TextStyle(fontSize: width * 0.045),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Card(
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Socials", style: TextStyle(fontSize: width * 0.07)),
                    SizedBox(height: height * 0.005),
                    _socialTile(Icons.telegram, "Telegram - @n4n4m", width),
                    _socialTile(
                      MaterialCommunityIcons.matrix,
                      "Matrix - @nonam:tchncs.de",
                      width,
                    ),
                    _socialTile(Icons.discord, "Discord - @nn4m", width),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Card(
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Text(
                  "Thank you for has using this very cat app kthx bye",
                  style: TextStyle(fontSize: width * 0.07745),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialTile(IconData icon, String label, double width) {
    return Padding(
      padding: EdgeInsets.only(top: width * 0.02),
      child: Row(
        children: [
          Icon(icon, size: width * 0.07),
          SizedBox(width: width * 0.04),
          Expanded(
            child: Text(label, style: TextStyle(fontSize: width * 0.055)),
          ),
        ],
      ),
    );
  }
}
