import 'package:epasos/models/job.dart';
import 'package:epasos/pages/candidate_detail_page.dart';
import 'package:flutter/material.dart';

class JobMatch extends StatefulWidget {
  @override
  _JobMatchState createState() => _JobMatchState();
}

class _JobMatchState extends State<JobMatch> {
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
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Job Matching")),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        ),
        body: Container(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                  child: Divider(
                thickness: 3.0,
              ));
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CandidateDetailPage()));
                },
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "${jobs[index].jobType}",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "${jobs[index].title}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "${jobs[index].company}",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.history,
                                      size: 18, color: Colors.grey[500]),
                                  Text(
                                    "${jobs[index].lastDate}",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "${jobs[index].salary}",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on,
                                      size: 18, color: Colors.grey[500]),
                                  Text(
                                    "${jobs[index].location}",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: Image.network("${jobs[index].imgUrl}"),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: 4,
          ),
        ));
  }
}
