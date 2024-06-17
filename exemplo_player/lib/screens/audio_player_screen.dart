import 'package:audioplayers/audioplayers.dart';
import 'package:exemplo_player/models/music_model.dart';
import 'package:flutter/material.dart';

class AudioPlayerScreen extends StatefulWidget {
  final AudioModel audio;
  const AudioPlayerScreen({super.key, required this.audio});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    // _audioPlayer.setSource(UrlSource(widget.audio.url));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
  
  @override
  void setState(fn) {
    super.setState(fn);
  }
  void _playPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      _audioPlayer.play(UrlSource(widget.audio.url));
      setState(() {
        _isPlaying = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.audio.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_isPlaying? Icons.pause : Icons.play_arrow),
              iconSize: 64.0,
              onPressed: () {
                _playPause();
              },
            ),
            Text(
              _isPlaying? 'Reproduzindo':'Pausado',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

  