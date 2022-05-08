import 'package:dm_project/consts/constants.dart';
import 'package:dm_project/screens/home_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const routeName = 'OnBoardingScreen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  gotoHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  double _currentOPa = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
// Here you can write your code
      _currentOPa = 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double media_hight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Constants.mov,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: media_hight * 0.001,
              right: media_hight * 0.001,
              top: media_hight * 0.08,
            ),
            padding: EdgeInsets.all(media_hight * 0.01),
            width: double.infinity,
            height: MediaQuery.of(context).size.width,
            child: Image.asset('assets/imgs/Group1.png'),
          ),
          AnimatedOpacity(
            duration: const Duration(seconds: 3),
            opacity: _currentOPa,
            curve: Curves.linear,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ANA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: media_hight * .05,
                      ),
                    ),
                    Text(
                      "LAYS",
                      style: TextStyle(
                        color: Constants.lightG,
                        fontSize: media_hight * .05,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media_hight * 0.05,
                ),
                const Text(
                  "prediction eats the competition",
                  style: TextStyle(
                    color: Colors.white24,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gotoHome(context);
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.arrow_forward_ios,
          color: Constants.mov,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
