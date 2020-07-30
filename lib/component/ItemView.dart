import 'package:flutter/material.dart';
import 'package:wwdc/model/models.dart';
import 'package:wwdc/views/LandmarkDetail.dart';



class ItemView extends StatelessWidget {
  final Landmark landmark;
  final double width;
  final double height;
  List<Landmark> landmarks;
  ItemView({Key key, this.landmark,this.width,this.height,this.landmarks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height+40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LandmarkDetail(
                    landmark: landmark,
                    landmarks: landmarks,
                  ),
                ),
              );
            },
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(landmark.getImageName()),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(5, 5))
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(landmark.name,style: TextStyle(fontSize: 14),),
          )
        ],
      ),
    );
  }
}

