// ignore_for_file: non_constant_identifier_names

import 'package:dm_project/widgets/bar_chart_sample_1.dart';
import 'package:dm_project/consts/constants.dart';
import 'package:dm_project/widgets/loading_widget.dart';
import 'package:dm_project/widgets/prediction_row.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var predValue = [];
  final now = DateTime.now();

  double weekday = 0;
  List<List<dynamic>> all_data = [];

  @override
  void initState() {
    super.initState();
    weekday = Constants.days[DateFormat('EEEE').format(now)]!;
    get_all_predictions(weekday);
  }

  var all_predictions = [];
  get_all_predictions(double d) {
    for (var i = 0; i < 3; i++) {
      predData(d, Constants.all_data[d.round()][2][i],
          Constants.all_data[d.round()][1]);
    }
  }

  void predData(double d, double n, double h) async {
    final interpreter = await Interpreter.fromAsset('mymodel.tflite');
    var input = [
      [d, n, h]
    ];
    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(input, output);

    setState(() {
      predValue.add(output[0][0].toString()[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    double media_hight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Constants.mov,
      body: Center(
        child: predValue.isEmpty
            ? const LoadingWidget()
            : Column(
                children: [
                  SizedBox(
                    height: media_hight * .07,
                  ),
                  const Text(
                    "Hack of the day",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: media_hight * 0.07,
                        bottom: media_hight * 0.02,
                        left: media_hight * 0.02,
                        right: media_hight * 0.02),
                    height: media_hight * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(media_hight * 0.04),
                      // color: Constants.bmba,
                    ),
                    child: const BarChartSample1(),
                  ),
                  const Text(
                    "predictions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "At the end of ${Constants.all_data[weekday.round()][1] - 1}0 you should make ",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      // color: Colors.green,
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return PredictionRow(
                            item: Constants.foodnames[Constants
                                .all_data[weekday.round()][2][index]
                                .round()],
                            quntity: predValue[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
