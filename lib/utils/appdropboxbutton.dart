import 'package:flutter/material.dart';

class AppDropDownBox extends StatelessWidget {
  final List<String> list;
  final String hint;
  final double width;
  AppDropDownBox(
      {@required this.list, @required this.hint, @required this.width});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, bottom: 5, top: 5),
      child: Container(
        height: 50, //gives the height of the dropdown button
        width: width, //gives the width of the dropdown button
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Colors.white),
        // padding: const EdgeInsets.symmetric(horizontal: 13), //you can include padding to control the menu items
        child: Theme(
            data: Theme.of(context).copyWith(
                // canvasColor: Colors
                //     .yellowAccent, // background color for the dropdown items
                buttonTheme: ButtonTheme.of(context).copyWith(
              alignedDropdown:
                  true, //If false (the default), then the dropdown's menu will be wider than its button.
            )),
            child: DropdownButtonHideUnderline(
              // to hide the default underline of the dropdown button
              child: DropdownButton<String>(
                iconSize: 40.0,
                iconEnabledColor:
                    Colors.grey[500], // icon color of the dropdown button
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    ),
                  );
                }).toList(),
                hint: Text(
                  hint,
                  style: TextStyle(color: Color(0xFF8B8B8B), fontSize: 15),
                ), // setting hint
                onChanged: (String value) {
                  // setState(() {
                  //   bankSelected = value; // saving the selected value
                  // });
                },
                value: list[0], // displaying the selected value
              ),
            )),
      ),
    );

    // return Container(

    //   child: DropdownButtonHideUnderline(

    //     child: DropdownButton<String>(
    //       value: items[0],
    //       icon: Icon(Icons.arrow_downward),
    //       iconSize: 24,
    //       elevation: 16,
    //       style: TextStyle(
    //         color: Colors.black,
    //       ),
    //       underline: Container(
    //         height: 2,
    //         color: Theme.of(context).primaryColor,
    //       ),
    //       onChanged: (String newValue) {},
    //       items: items.map<DropdownMenuItem<String>>((String value) {
    //         return DropdownMenuItem<String>(
    //           value: value,
    //           child: Text(value),
    //         );
    //       }).toList(),
    //     ),
    //   ),
    // );
  }
}
