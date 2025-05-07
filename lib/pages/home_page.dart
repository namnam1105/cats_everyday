import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scale = 1.0;
  int _meows = 0;
  final catFiles = [
    'hiss1.wav',
    'meow11.mp3',
    'meow2.mp3',
    'meow4.wav',
    'meow6.wav',
    'meow8.wav',
    'meow10.wav',
    'meow1.ogg',
    'meow3.wav',
    'meow5.wav',
    'meow7.wav',
    'meow9.wav',
  ];
  final _player = AudioPlayer();
  final _random = Random();
  late String _catImage = "";

  void _playRandomMeow() {
    final randomIndex = _random.nextInt(catFiles.length);
    final randomFile = catFiles[randomIndex];
    _player.play(AssetSource('audio/$randomFile'));
  }

  @override
  void initState() {
    super.initState();
    _pullNewImage();
  }

  Future<void> _pullNewImage() async {
    final url = Uri.parse('https://api.thecatapi.com/v1/images/search');
    final response = await get(url);

    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final imageUrl = json[0]['url'];
        setState(() {
          _catImage = imageUrl;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error: ${response.statusCode} HTTP',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error: $e',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
      );
    }
  }

  void _onTap() {
    setState(() {
      _scale = 1.2;
      _meows++;
      _playRandomMeow();
    });

    // Возврат обратно через 50 мс
    Future.delayed(Duration(milliseconds: 50), () {
      if (mounted) {
        setState(() => _scale = 1.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // _pullNewImage();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cats Everyday"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                // color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    child: GestureDetector(
                      onTap: _onTap,
                      child: AnimatedScale(
                        scale: _scale,
                        duration: Duration(milliseconds: 200),
                        child:
                            _catImage.isNotEmpty
                                ? Image.network(_catImage)
                                : CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cat :3",
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.only(left: 50)),
                Text(
                  "${_meows}x Meow",
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pullNewImage();
        },
        tooltip: "Pull a new image of a cat",
        child: Icon(Icons.refresh),
      ),
    );
  }
}
