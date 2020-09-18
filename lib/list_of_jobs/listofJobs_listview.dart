import 'package:flutter/material.dart';
import 'package:jobportal_working/list_of_jobs/api_model/listJobs.dart';
import 'package:jobportal_working/utils/rating_tag.dart';

class ListOfJobListView extends StatefulWidget {
  ListJobs listJobs;

  ListOfJobListView(this.listJobs);
  @override
  _ListOfJobListViewState createState() => _ListOfJobListViewState();
}

class _ListOfJobListViewState extends State<ListOfJobListView> {
  List<Job> jobs = [
    Job(
      company: "Facebook",
      jobType: "Full Time",
      title: "Software Developer",
      location: "New Delhi",
      imgUrl:
          "https://w7.pngwing.com/pngs/933/615/png-transparent-social-media-facebook-computer-icons-logo-facebook-blue-text-rectangle.png",
      lastDate: "10 Sep 2020",
      salary: "10k - 15k/month",
    ),
    Job(
      company: "Google",
      jobType: "Full Time",
      title: "Software Developer of Flutter",
      location: "Mumbai",
      imgUrl:
          "https://cdn03.boxcdn.net/sites/default/files/2018-10/icon-24.png",
      lastDate: "11 Aug 2020",
      salary: "100k - 105k/month",
    ),
    Job(
      company: "Apple",
      jobType: "Full Time",
      title: "Operating System Developer",
      location: "New Delhi",
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/505px-Apple_logo_black.svg.png",
      lastDate: "10 Dec 2020",
      salary: "10M - 15M/month",
    ),
    Job(
      company: "Infosis",
      jobType: "Part Time",
      title: "Flutter Intern",
      location: "New Delhi",
      imgUrl:
          "https://paymentweek.com/wp-content/uploads/2018/01/infosys-logo.jpg",
      lastDate: "30 Sep 2020",
      salary: "10k/month",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: widget.listJobs.data.length,
        separatorBuilder: (context, index) {
          return Container(
              child: Divider(
            thickness: 3.0,
          ));
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //   padding: EdgeInsets.all(4.0),
                        //   child: Text(
                        //     "Full time",
                        //     style: TextStyle(
                        //       color: Theme.of(context).primaryColor,
                        //       fontSize: 14,
                        //     ),
                        //   ),
                        // ),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            "${widget.listJobs.data[index].jobTitle}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(2.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new RatingTag(rating: "3.4"),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 6.0),
                                child: Text(
                                  "${widget.listJobs.data[index].companyName}",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Icon(Icons.history,
                                  size: 18, color: Colors.grey[500]),
                              Text(
                                "${widget.listJobs.data[index].lastDate}",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   padding: EdgeInsets.all(4.0),
                        //   child: Text(
                        //     "${widget.listJobs.data[index]}",
                        //     style: TextStyle(
                        //       color: Theme.of(context).primaryColor,
                        //       fontSize: 17,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   child: Text(""+widget.listJobs.data[index].jobSlug),
                        // ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 60.0,
                    height: 60.0,
                    // child: Image.network("${jobs[index].imgUrl}"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Job {
  String title;
  String location;
  String company;
  String jobType;
  String lastDate;
  String salary;
  String imgUrl;

  Job({
    @required this.title,
    @required this.location,
    @required this.company,
    @required this.imgUrl,
    @required this.jobType,
    @required this.lastDate,
    @required this.salary,
  });
}
