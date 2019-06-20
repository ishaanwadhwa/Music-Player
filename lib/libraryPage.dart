import 'package:flutter/material.dart';
import 'package:fluttery_audio/fluttery_audio.dart';

class libraryPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold
      (
      appBar: new AppBar(title: new Text("Music Library"),backgroundColor: Colors.black),
      body: new Container
        (
        padding: new EdgeInsets.all(20.0),
        child: new Center
          (
          child:new Column
            (children: <Widget>
          [
            new Text('Welcome to the Playlist Screen'),
            //new AudioPlaylist(playlist: const[],playlistBuilder: (BuildContext context,Playlist playlist,Widget child){
            //},child: ,),
            new RaisedButton(child: new Text('Perfect Saxophone'),onPressed: () {AudioPlayerState.playing.index;}),
            new RaisedButton(child: new Text('Simply'),onPressed: () {AudioPlayerState.playing.index;}),
            new RaisedButton(child: new Text('Electro Monotony'),onPressed: () {AudioPlayerState.playing.index;}),
            new RaisedButton(child: new Text('Debut Trance'),onPressed: () {AudioPlayerState.playing.index;}),
            new RaisedButton(child: new Text('Debut'),onPressed: () {AudioPlayerState.playing.index;}),
            new RaisedButton(child: new Text('Assn1-tribal-beat'),onPressed: () {AudioPlayerState.playing.index;}),
          ],

          )
        ),
      ),

    );
  }
}