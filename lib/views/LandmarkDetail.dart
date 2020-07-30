import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wwdc/model/models.dart';
import '../component/Avatar.dart';
import 'RowWithEffect.dart';
import '../component/MapView.dart';

class LandmarkDetail extends StatelessWidget {
  final Landmark landmark;
  final List<Landmark> landmarks;
  LandmarkDetail({this.landmark,this.landmarks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          iconTheme: Theme.of(context).iconTheme,
          title: Text(landmark.name,
              style: TextStyle(
                color: Colors.black,
              )),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(height: 300,
                  child: MapView(landmark: landmark,),
                ),
                Padding(padding: const EdgeInsets.only(top: 200,left: 110),
                  child: Avatar(imageName:landmark.getImageName(),),
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.all(10.0),
              child: Text(landmark.name,style: TextStyle(fontSize: 20),),
            ),
            RowWithEffect(name: "All",landmarks: landmarks, )
          ],),
      )
    );
  }
}




