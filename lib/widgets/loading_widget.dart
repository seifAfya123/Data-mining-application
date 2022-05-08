import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double media_hight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: media_hight * 0.001,
              right: media_hight * 0.001,
              top: media_hight * 0.08,
            ),
            padding: EdgeInsets.all(media_hight * 0.01),
            width: double.infinity,
            height: media_hight * 0.7,
            child: Image.asset('assets/imgs/loading.gif'),
          ),
        ],
      ),
    );
  }
}
