import 'package:flutter/material.dart';
import 'songs.dart';
import 'package:fluttery_audio/fluttery_audio.dart';
import 'libraryPage.dart';

void main() => runApp(new MyApp());




class MyApp extends StatelessWidget
{
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp
      (
      title: 'Music Player',
      routes: <String,WidgetBuilder>
      {
        '/Library' : (BuildContext context ) => new libraryPage(),


      },
      home: new homePage(),

      );
  }
}

class homePage extends StatefulWidget {

  _homePageState createState() => new _homePageState();
}

class _homePageState extends State<homePage>
{
@override
  Widget build(BuildContext context) {
    // TODO: implement build
  return new AudioPlaylist(
    playlist: demoPlaylist.songs.map((DemoSong song){
      return song.audioUrl;
    }).toList(growable: false),
     child: Audio(
      audioUrl: demoPlaylist.songs[0].audioUrl,
      playbackState: PlaybackState.paused,
      child: new Scaffold
        (
        appBar: new AppBar
          (
          backgroundColor: Colors.black,
          leading: IconButton(icon: new Icon(Icons.arrow_back), onPressed: (){}),
          title: new Text('Music Player'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.menu), onPressed: (){Navigator.of(context).pushNamed('/Library');})
          ],
        ),
        body: new Column
          (
          children: <Widget>
          [
            //Seekbar
            new Expanded(

              child: new Center(
                child: new Container(
                  width: 300.0,
                  height: 300.0,

                  child: new AudioPlaylistComponent(
                    playlistBuilder: (BuildContext context, Playlist playlist, Widget child){
                      final songTitle = demoPlaylist.songs[playlist.activeIndex].songTitle;
                      return new Image.network(
                        demoPlaylist.songs[playlist.activeIndex].albumArtUrl,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                   ),

                ),
              ),

            //Visualiser
           // new Container(

             // width: double.infinity,
              //height: 150.0,
              //color: Colors.pink,
            //),
            //Other things
             new Container(
               padding: EdgeInsets.only(top: 40.0,bottom: 50.0),
                color: Colors.black


                  ,child :new Column(
                  children: <Widget>[
                    new AudioPlaylistComponent(
                      playlistBuilder: (BuildContext context, Playlist playlist, Widget child){
                        final songTitle = demoPlaylist.songs[playlist.activeIndex].songTitle;
                        return new Text('${songTitle.toUpperCase()}\n',style:new TextStyle(color: Colors.white,fontSize: 20.0 ,fontWeight: FontWeight.bold ,letterSpacing: 4.0,height: 1.5) ,);
                      },
                    ),
                    new AudioPlaylistComponent(
                      playlistBuilder: (BuildContext context, Playlist playlist, Widget child){
                        final artistName = demoPlaylist.songs[playlist.activeIndex].artist;
                        return new Text('${artistName.toUpperCase()}\n',style:new TextStyle(color: Colors.white,fontSize: 18.0 ,letterSpacing: 4.0,height: 1.5) ,);
                        },
                    ),
                    //new Text('${songTitle.toUppercase}\n',style:new TextStyle(color: Colors.black,fontSize: 20.0 ,fontWeight: FontWeight.bold ,letterSpacing: 4.0,height: 1.5) ,),
                    //new Text('${artistName.toLowerCase}\n',style:new TextStyle(color: Colors.black,fontSize: 18.0 ,letterSpacing: 4.0,height: 1.5) ,),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: new Row(

                        children: <Widget>[
                          new Expanded(child: new Container()),
                          new AudioPlaylistComponent(
                              playlistBuilder: (BuildContext context, Playlist playlist, Widget child){
                                return new IconButton(icon: new Icon(Icons.skip_previous),color: Colors.white, onPressed: playlist.previous);
                              },
                          ),
                          new Expanded(child: new Container()),
                          new AudioComponent(
                            updateMe: [
                              WatchableAudioProperties.audioPlayerState
                            ],
                            playerBuilder: (BuildContext context, AudioPlayer player, Widget child){
                              IconData icon= Icons.music_note;
                              Function onpressed;
                              if(player.state==AudioPlayerState.playing){
                                icon=Icons.pause;
                                onpressed = player.pause;
                              }
                                else if((player.state==AudioPlayerState.paused)||(player.state==AudioPlayerState.completed)){
                                  icon=Icons.play_arrow;
                                  onpressed = player.play;
                                }
                              return new RawMaterialButton(shape: CircleBorder(),fillColor: Colors.white,elevation: 10.0,highlightElevation: 5.0,onPressed: onpressed,
                              child: new Icon(icon) ,);
                            },
                          ),
                          new Expanded(child: new Container()),
                          new AudioPlaylistComponent(
                            playlistBuilder: (BuildContext context,Playlist playlist,Widget child){
                              return new IconButton(icon: new Icon(Icons.skip_next),color: Colors.white, onPressed: playlist.next);
                            }
                          ),
                          new Expanded(child: new Container()),
                        ],
                      ),
                    )
                  ],
              ),
              ),
          ]
          ),
        ),
    )
  );
}
}






