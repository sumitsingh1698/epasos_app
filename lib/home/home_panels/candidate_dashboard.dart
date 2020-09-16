import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/api_connection/api_connection.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/home/home_panels/qualification_page.dart';
import 'package:jobportal_working/home/home_panels/experiences_page.dart';
import 'package:jobportal_working/home/home_widget/additional_dashboard_widget.dart';
import 'package:jobportal_working/home/model/dashboard_model.dart';
import 'package:jobportal_working/update_profile/update_profile_page.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:jobportal_working/utils/customRaisedCircularButton.dart';
import 'package:jobportal_working/utils/mycustomDialogBox.dart';
import 'package:jobportal_working/utils/mytoast.dart';

import 'dragableListSheetComment.dart';

class CandidateDashboard extends StatefulWidget {
  final DashboardModel dashboardModel;

  CandidateDashboard(this.dashboardModel);
  @override
  _CandidateDashboardState createState() => _CandidateDashboardState();
}

class _CandidateDashboardState extends State<CandidateDashboard> {
  UserRepository userRepository;

  final summaryTextController = TextEditingController();

  String countryInput = "India";

  bool isCommentShow = false;

  List<Review> reviews = [
    Review("Sumit Kumar", "It was Amazing", "4.0"),
    Review(
        "Sumit Kumar",
        "It was the worst experience in my life. I have 1 yr experience.",
        "4.0"),
    Review("Sumit Kumar", "It was Amazing", "4.0"),
    Review("Sumit Kumar", "It was Amazing", "4.0"),
    Review("Sumit Kumar", "It was Amazing", "4.0"),
    Review("Sumit Kumar", "It was Amazing", "4.0"),
    Review("Sumit Kumar", "It was Amazing", "4.0"),
    Review("Sumit Kumar", "It was Amazing", "4.0"),
    Review("Sumit Kumar", "It was Amazing", "4.0"),
  ];

  void initState() {
    userRepository = RepositoryProvider.of<UserRepository>(context);
    super.initState();
  }

  String getText(String text) {
    if (text == null) return '';
    return text;
  }

  Future<void> updateSummary() async {
    print("here");
    print(summaryTextController.text);

    try {
      await userRepository.updateSummary(
        summaryTextController.text,
      );
      print("here now");

      MyToast.showToastMeasgage("Updated Successfully", color: Colors.green);
      BlocProvider.of<AuthenticationBloc>(context).add(ViewDashboardEvent());
      Navigator.pop(context);
    } catch (e) {
      print(e);
      MyToast.showToastMeasgage("$e", color: Colors.red);
    }
  }

  Widget firstBlock() {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 120,
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(
                      MediaQuery.of(context).size.width / 2, 100),
                  bottomRight: Radius.elliptical(
                      MediaQuery.of(context).size.width / 2, 100),
                )),
            width: double.infinity,
            height: 80.0,
          ),
          Positioned(
            top: 25,
            left: MediaQuery.of(context).size.width / 2 - 45,
            height: 90,
            width: 90,
            child: CircleAvatar(
              radius: 1200.0,
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
          Positioned(
            top: 30,
            left: MediaQuery.of(context).size.width / 2 - 40,
            height: 80,
            width: 80,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdn03.boxcdn.net/sites/default/files/2018-10/icon-24.png"),
              radius: 1000.0,
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget secondBlock() {
    return Container(
      child: Column(
        children: [
          Text(
            getText(widget.dashboardModel.data.row.firstName),
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2.0,
          ),
          Text(
            getText(widget.dashboardModel.data.row.email),
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3.0,
          ),
          Text(
            getText(widget.dashboardModel.data.row.mobile),
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomRaisedCircularButton(
            color: Colors.grey[500],
            onPressed: () {
              setState(() {
                // initialDragableSize = 0.3;
                isCommentShow == true
                    ? isCommentShow = false
                    : isCommentShow = true;
              });
            },
            title: "Review",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateProfilePage(
                                RepositoryProvider.of<UserRepository>(context),
                                detail: widget.dashboardModel.data.row,
                              )));
                },
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(Icons.edit),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget thirdBlock() {
    summaryTextController.text =
        widget.dashboardModel.data.rowAdditional.summary;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Professional Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      MyCustomDialog.showMe(
                          context: context,
                          title: "Professional Summary",
                          widgets: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: TextField(
                              controller: summaryTextController,
                              minLines: 5,
                              maxLines: 5,
                            ),
                          ),
                          onSubmit: updateSummary);
                    })
              ],
            ),
            color: Colors.grey[300],
            width: double.infinity,
            height: 40,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text(summaryTextController.text)),
        ],
      ),
    );
  }

  Widget forthBlock() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Experiences",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ExperiencePage(this.userRepository)));
                  },
                  child: Row(
                    children: [
                      Text(
                        "Add Another",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(icon: Icon(Icons.add_box), onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
            color: Colors.grey[300],
            width: double.infinity,
            height: 40,
          ),
        ],
      ),
    );
  }

  SliverChildBuilderDelegate fifthBlock() {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.grey[300],
            width: 1.0,
          ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getText(widget
                          .dashboardModel.data.experience[index].jobTitle),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      getText(widget
                          .dashboardModel.data.experience[index].companyName),
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      getText(widget
                              .dashboardModel.data.experience[index].city) +
                          " " +
                          getText(widget
                              .dashboardModel.data.experience[index].country),
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    Text(
                      getText(widget.dashboardModel.data.experience[index]
                              .startDate) +
                          "  " +
                          getText(widget
                              .dashboardModel.data.experience[index].endDate),
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExperiencePage(
                                      this.userRepository,
                                      experience: widget.dashboardModel.data
                                          .experience[index],
                                    )));
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        MyCustomDialog.showMe(
                            context: context,
                            title: "Warning !!!",
                            widgets: Container(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Are you sure for want to delete your Experience ?? ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " ${widget.dashboardModel.data.experience[index].jobTitle} ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onSubmit: () {
                              try {
                                JobPortalApi()
                                    .deleteExperience(
                                        widget.dashboardModel.data
                                            .experience[index].iD,
                                        RepositoryProvider.of<UserRepository>(
                                                context)
                                            .user)
                                    .then((value) =>
                                        BlocProvider.of<AuthenticationBloc>(
                                                context)
                                            .add(ViewDashboardEvent()));

                                Navigator.of(context).pop();
                                MyToast.showToastMeasgage(
                                    "Deleted Successfully",
                                    color: Colors.green);
                              } catch (e) {
                                MyToast.showToastMeasgage("$e",
                                    color: Colors.red);
                              }
                            });
                      }),
                ],
              )
            ],
          ),
        );
      },
      // Or, uncomment the following line:
      childCount: widget.dashboardModel.data.experience.length,
    );
  }

  Widget sixthBlock() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Education",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "Add Another",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(icon: Icon(Icons.add_box), onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
            color: Colors.grey[300],
            width: double.infinity,
            height: 40,
          ),
        ],
      ),
    );
  }

  SliverChildBuilderDelegate seventhBlock() {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.grey[300],
            width: 1.0,
          ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        getText(widget.dashboardModel.data.degrees[index].text),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      getText(
                        widget.dashboardModel.data.degrees[index].val,
                      ),
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      getText(
                        widget.dashboardModel.data.degrees[index].displayOrder,
                      ),
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      onPressed: () {}),
                ],
              )
            ],
          ),
        );
      },
      // Or, uncomment the following line:
      childCount: widget.dashboardModel.data.qualification.length,
    );
  }

  Widget qualificationTitleBlock() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Qualitfication",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QualificationPage(userRepository)));
                  },
                  child: Row(
                    children: [
                      Text(
                        "Add Another",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(icon: Icon(Icons.add_box), onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
            color: Colors.grey[300],
            width: double.infinity,
            height: 40,
          ),
        ],
      ),
    );
  }

  SliverChildBuilderDelegate qualificationBlock() {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.grey[300],
            width: 1.0,
          ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        getText(widget.dashboardModel.data.qualification[index]
                            .institude),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      getText(
                        widget.dashboardModel.data.qualification[index]
                            .degreeTitle,
                      ),
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      getText(
                        widget.dashboardModel.data.qualification[index].major,
                      ),
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    // Text(
                    //   getText(
                    //     widget.dashboardModel.data.qualification[index]
                    //         .degreeLevel,
                    //   ),
                    //   style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    // ),
                    // SizedBox(
                    //   height: 4.0,
                    // ),
                    Text(
                      "Completion Year :" +
                          getText(
                            widget.dashboardModel.data.qualification[index]
                                .completionYear,
                          ),
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      getText(
                            widget
                                .dashboardModel.data.qualification[index].city,
                          ) +
                          " " +
                          getText(
                            widget.dashboardModel.data.qualification[index]
                                .country,
                          ),
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QualificationPage(
                                      userRepository,
                                      qualification: widget.dashboardModel.data
                                          .qualification[index],
                                    )));
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        MyCustomDialog.showMe(
                            context: context,
                            title: "Warning !!!",
                            widgets: Container(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Are you sure for want to delete your Qualification ?? ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " ${widget.dashboardModel.data.experience[index].jobTitle} ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onSubmit: () {
                              try {
                                JobPortalApi()
                                    .deleteQualification(
                                        widget.dashboardModel.data
                                            .qualification[index].iD,
                                        RepositoryProvider.of<UserRepository>(
                                                context)
                                            .user)
                                    .then((value) =>
                                        BlocProvider.of<AuthenticationBloc>(
                                                context)
                                            .add(ViewDashboardEvent()));
                                Navigator.of(context).pop();
                                MyToast.showToastMeasgage(
                                    "Deleted Successfully",
                                    color: Colors.green);
                              } catch (e) {
                                MyToast.showToastMeasgage("$e",
                                    color: Colors.red);
                              }
                            });
                      })
                ],
              )
            ],
          ),
        );
      },
      // Or, uncomment the following line:
      childCount: widget.dashboardModel.data.qualification.length,
    );
  }

  // Widget eighthBlock() {
  //   return Container(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(left: 18.0),
  //                 child: Text(
  //                   "My Job Applications",
  //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               GestureDetector(
  //                 onTap: () {
  //                   // Navigator.push(
  //                   //     context,
  //                   //     MaterialPageRoute(
  //                   //         builder: (context) => MyApplications()));
  //                 },
  //                 child: Row(
  //                   children: [
  //                     Text(
  //                       "View All",
  //                       style: TextStyle(
  //                           fontSize: 14, fontWeight: FontWeight.bold),
  //                     ),
  //                     IconButton(
  //                         icon: Icon(Icons.edit),
  //                         onPressed: () {
  //                           // Navigator.push(
  //                           //     context,
  //                           //     MaterialPageRoute(
  //                           //         builder: (context) => MyApplications()));
  //                         }),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //           color: Colors.grey[300],
  //           width: double.infinity,
  //           height: 40,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // SliverChildBuilderDelegate ninthBlock() {
  //   return SliverChildBuilderDelegate(
  //     (BuildContext context, int index) {
  //       return Container(
  //         decoration: BoxDecoration(
  //             border: Border(
  //                 bottom: BorderSide(
  //           color: Colors.grey[300],
  //           width: 1.0,
  //         ))),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Expanded(
  //               flex: 6,
  //               child: Container(
  //                 padding:
  //                     EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Container(
  //                       child: Text(
  //                         "PHP Web Developer",
  //                         style: TextStyle(
  //                           fontSize: 16,
  //                           color: Colors.black,
  //                           // fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 4.0,
  //                     ),
  //                     Text(
  //                       "Facebook",
  //                       style: TextStyle(
  //                           fontSize: 16,
  //                           color: Theme.of(context).primaryColor,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                     SizedBox(
  //                       height: 4.0,
  //                     ),
  //                     Text(
  //                       "15, Jul 2020",
  //                       style: TextStyle(fontSize: 14, color: Colors.grey[600]),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               flex: 1,
  //               child: Container(
  //                 child: IconButton(
  //                     icon: Icon(
  //                       Icons.cancel,
  //                       color: Colors.red,
  //                     ),
  //                     onPressed: () {}),
  //               ),
  //             )
  //           ],
  //         ),
  //       );
  //     },
  //     // Or, uncomment the following line:
  //     childCount: 1,
  //   );
  // }

  Widget tenthBlock() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "My Additional Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "Add / Edit",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(icon: Icon(Icons.add_box), onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
            color: Colors.grey[300],
            width: double.infinity,
            height: 40,
          ),
        ],
      ),
    );
  }

  SliverChildBuilderDelegate eleventhBlock() {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.grey[300],
            width: 1.0,
          ))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              flex: 6,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AdditionalDashboardWidget(
                            title: getText("Intrest"),
                            result: getText(widget
                                .dashboardModel.data.rowAdditional.interest)),
                        AdditionalDashboardWidget(
                            title: getText("Description"),
                            result: getText(widget.dashboardModel.data
                                .rowAdditional.description)),
                        AdditionalDashboardWidget(
                            title: getText("Languages"),
                            result: getText(widget
                                .dashboardModel.data.rowAdditional.languages)),
                        AdditionalDashboardWidget(
                            title: getText("Additional Quanlities"),
                            result: getText(widget.dashboardModel.data
                                .rowAdditional.additionalQualities)),
                        AdditionalDashboardWidget(
                            title: getText("Bad Habits"),
                            result: getText(widget
                                .dashboardModel.data.rowAdditional.badHabits)),
                        AdditionalDashboardWidget(
                            title: getText("Awards"),
                            result: getText(widget
                                .dashboardModel.data.rowAdditional.awards)),
                        AdditionalDashboardWidget(
                            title: getText("Convicted Crime"),
                            result: getText(widget.dashboardModel.data
                                .rowAdditional.convictedCrime)),
                        AdditionalDashboardWidget(
                            title: getText("Salary"),
                            result: getText(widget
                                .dashboardModel.data.rowAdditional.salary)),
                      ])),
            ),
          ]),
        );
      },
      // Or, uncomment the following line:
      childCount: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: firstBlock(),
            ),
            SliverToBoxAdapter(
              child: secondBlock(),
            ),
            SliverToBoxAdapter(
              child: thirdBlock(),
            ),
            SliverToBoxAdapter(
              child: forthBlock(),
            ),
            SliverList(
              delegate: fifthBlock(),
            ),
            SliverToBoxAdapter(
              child: qualificationTitleBlock(),
            ),
            SliverList(
              delegate: qualificationBlock(),
            ),
            SliverToBoxAdapter(
              child: sixthBlock(),
            ),
            SliverList(
              delegate: seventhBlock(),
            ),
            // SliverToBoxAdapter(
            //   child: eighthBlock(),
            // ),
            // SliverList(
            //   delegate: ninthBlock(),
            // ),
            SliverToBoxAdapter(
              child: tenthBlock(),
            ),
            SliverList(
              delegate: eleventhBlock(),
            )
          ],
        ),
        isCommentShow == false
            ? Container()
            : DragableListSheetComment(reviews, "Rishab Jain")
      ]),
    );
  }
}

class Review {
  String name;
  String comment;
  String rating;
  Review(this.name, this.comment, this.rating);
}
