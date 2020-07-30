import 'package:flutter/cupertino.dart';
import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:wwdc/model/models.dart';
import 'RowView.dart';
import 'RowWithEffect.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Map<String, List<Landmark>> categories;
  List<Landmark> landmarks;
  Landmark landmark;
  @override
  void initState() {
    super.initState();
    loadLandmarks();

  }

  @override
  Widget build(BuildContext context) {
    return landmark!=null?Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            landmark.name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/Los_Angeles.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                RowWithEffect(
                  name: "All",
                  landmarks: landmarks,
                ),
                Column(
                  children: categories.keys
                      .map((k) => RowView(
                            name: k,
                            landmarks: categories[k],
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        )):Container(color: Colors.white,);
  }

  void loadLandmarks() async {
    String jsonString =
        await rootBundle.loadString('assets/data/landmarkData.json');
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    landmarks = parsed.map<Landmark>((json) {
      return Landmark.fromJson(json);
    }).toList();
    landmark = landmarks[0];
    categories = groupBy(landmarks, (Landmark obj) => obj.category);
    setState(() {

    });
  }
}
