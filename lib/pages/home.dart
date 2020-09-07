import 'package:epasos/pages/listofJobspage.dart';
import 'package:epasos/utils/appdropboxbutton.dart';
import 'package:epasos/utils/apptextfield.dart';
import 'package:epasos/utils/headingofpages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _lowerValue = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.3), BlendMode.darken),
          image: AssetImage("assets/images/job.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
                width: 100.0,
                height: 100.0,
                child: Image.asset("assets/images/icon.jpg")),
            SizedBox(height: 50.0),
            Column(
              children: [
                Text(
                  "Find Jobs",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingOfPages(text: "Search From 1500+ Jobs"),
                        Container(
                          width: 60.0,
                          child: Divider(
                            color: Theme.of(context).primaryColor,
                            thickness: 4.0,
                          ),
                        ),
                        Text(
                          "Search From 1500+ Jobs",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        AppTextField(
                            icon: Icon(
                              Icons.search,
                              size: 25.0,
                            ),
                            label: "",
                            hint: "Search Keywords..",
                            obscureText: false),
                        AppDropDownBox(
                          list: ["Select Category", "Software", "Bussiness"],
                          hint: "categories",
                          width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "How many Jobs?",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            Container(
                                padding: EdgeInsets.only(right: 40),
                                child: Text(
                                  "${_lowerValue.ceil()}",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ))
                          ],
                        ),
                        Container(
                          child: FlutterSlider(
                            handlerHeight: 20.0,
                            step: FlutterSliderStep(
                                step: 1,
                                isPercentRange: false,
                                rangeList: [
                                  FlutterSliderRangeStep(
                                      from: 0, to: 10, step: 10),
                                  FlutterSliderRangeStep(
                                      from: 10, to: 20, step: 20),
                                  FlutterSliderRangeStep(
                                      from: 20, to: 30, step: 30),
                                  FlutterSliderRangeStep(
                                      from: 30, to: 40, step: 40),
                                  FlutterSliderRangeStep(
                                      from: 40, to: 50, step: 50),

                                  // FlutterSliderRangeStep(from:0,to:110,step: 100),
                                ]),
                            values: [_lowerValue],
                            trackBar: FlutterSliderTrackBar(
                              inactiveTrackBar: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                              ),
                              activeTrackBar: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            handler: FlutterSliderHandler(
                              decoration: BoxDecoration(),
                              child: Container(
                                padding: EdgeInsets.all(0),
                                child: FaIcon(
                                  FontAwesomeIcons.solidCircle,
                                  size: 20,
                                ),
                              ),
                            ),
                            max: 50,
                            min: 0,
                            // onDragging: (handlerIndex, lowerValue, upperValue) {
                            //   setState(() {
                            //     _lowerValue = lowerValue;
                            //   });
                            // },
                            onDragCompleted:
                                (handlerIndex, lowerValue, upperValue) {
                              setState(() {
                                _lowerValue = lowerValue;
                              });
                            },
                          ),
                        ),
                        Center(
                          child: ButtonTheme(
                            minWidth: 200,
                            child: RaisedButton(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListOfJobsPage()));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
