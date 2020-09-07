import 'package:epasos/models/candidate.dart';
import 'package:epasos/pages/candidate_detail_page.dart';
import 'package:flutter/material.dart';

class EmployerListOfApplication extends StatefulWidget {
  @override
  _EmployerListOfApplicationState createState() =>
      _EmployerListOfApplicationState();
}

class _EmployerListOfApplicationState extends State<EmployerListOfApplication> {
  List<Candidate> candidates = [
    Candidate(
      name: "Rishi Partap Singh",
      experience: "1 years",
      skills: "Java",
      certification: "Ambedkar institute of Technology",
    ),
    Candidate(
      name: "Sumit kumar",
      experience: "No. experience",
      skills: "Java,python",
      certification: "G. B. pant govt engineering college",
    ),
    Candidate(
      name: "Priya verma",
      experience: "5 years",
      skills: "PHP, python",
      certification: "Dr. Akhlesh dash College",
    ),
    Candidate(
      name: "Ravi",
      experience: "2 years",
      skills: "Front Ends",
      certification: "Ambedbar Institute",
    ),
    Candidate(
      name: "Vishal",
      experience: "Full Time",
      skills: "Digital Marketing",
      certification: "World School",
    ),
    Candidate(
      name: "Rishi Partap Singh",
      experience: "1 years",
      skills: "Java",
      certification: "Ambedkar institute of Technology",
    ),
    Candidate(
      name: "Sumit kumar",
      experience: "No. experience",
      skills: "Java,python",
      certification: "G. B. pant govt engineering college",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("All Applications        ")),
        // actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "${candidates[index].experience}",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "${candidates[index].name}",
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
                              "${candidates[index].certification}",
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
                                Text(
                                  "Skills : ${candidates[index].skills}",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 15,
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
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(0.5),
                        child: Text(
                          "${candidates[index].name.substring(0, 1)}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: 6,
        ),
      ),
    );
  }
}
