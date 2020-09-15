import 'package:flutter/material.dart';
import 'package:jobportal_working/utils/rating_tag.dart';

import 'candidate_dashboard.dart';

class DragableListSheetComment extends StatelessWidget {
  DragableListSheetComment(this.reviews, this.ratingOf);
  final List<Review> reviews;
  final String ratingOf;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.0,
      maxChildSize: 1.0,
      builder: (BuildContext context, myscrollController) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100), topRight: Radius.circular(100)),
            color: Theme.of(context).primaryColor,
          ),
          child: ListView.builder(
            controller: myscrollController,
            itemCount: reviews.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 140.0, vertical: 10.0),
                        child: Divider(
                          color: Colors.white,
                          thickness: 3.0,
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(left: 20.0),
                      //   child: ListTile(
                      //     leading: CircleAvatar(
                      //       backgroundColor: Colors.white.withOpacity(0.5),
                      //       child: Text(
                      //         "R",
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //     ),
                      //     title: Container(
                      //       child: Text("Rishab Jain",
                      //           style: TextStyle(
                      //               color: Colors.grey, fontSize: 16.0)),
                      //     ),
                      //   ),
                      // ),
                      Text(
                        "Reviews of $ratingOf",
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.grey[300]),
                      ),
                      Divider(
                        thickness: 3.0,
                      )
                    ],
                  ),
                );
              }
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: Text(
                    reviews[index - 1].name[0],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(reviews[index - 1].name,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 16.0)),
                      ),
                      Container(
                        child: Text(
                          reviews[index - 1].comment,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: RatingTag(
                    rating: reviews[index].rating,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
