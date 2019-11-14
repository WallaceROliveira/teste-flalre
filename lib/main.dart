import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _animation = "liquid";
  bool play = true;

  _changeAnimation() {
    setState(() {
      if (_animation == "circle expand") {
        _animation = "liquid";
      } else {
        _animation = "circle expand";
      }
    });
  }

  _pausePlay() {
    setState(() {
      if(play) {
        play = false;
      } else {
        play = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(play ? _animation : "Paused"),
            actions: <Widget>[
              play ?
              IconButton(icon: Icon(Icons.pause), onPressed: _pausePlay) : IconButton(icon: Icon(Icons.play_arrow), onPressed: _pausePlay)
            ]
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.compare_arrows), onPressed: _changeAnimation,
        ),
        body:
            Center(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              child: play ? FlareActor(
                "assets/Logo_Prevent.flr",
                animation: _animation,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ) : Image.asset("assets/logo_PS.png"),
            )),
         );
  }
}
