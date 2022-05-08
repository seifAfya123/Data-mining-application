import 'package:dm_project/consts/constants.dart';
import 'package:flutter/material.dart';

class PredictionRow extends StatelessWidget {
  String item;
  String quntity;

  PredictionRow({
    Key? key,
    required this.item,
    required this.quntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.17,
        vertical: MediaQuery.of(context).size.width * 0.02,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.035,
            width: MediaQuery.of(context).size.width * 0.035,
            decoration: BoxDecoration(
              color: Constants.bmba,
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
          Text(
            " $item",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Spacer(),
          Text(
            quntity,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
