import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/list_of_jobs/api_model/listJobs.dart';
import 'package:jobportal_working/list_of_jobs/bloc/listofjob_bloc.dart';
import 'package:jobportal_working/urls.dart';
import 'package:jobportal_working/utils/network_image_modifier.dart';
import 'package:jobportal_working/utils/rating_tag.dart';

class ListOfJobListView extends StatefulWidget {
  bool isDeletedAble;
  ListJobs listJobs;

  ListOfJobListView(this.listJobs, {this.isDeletedAble = false});
  @override
  _ListOfJobListViewState createState() => _ListOfJobListViewState();
}

class _ListOfJobListViewState extends State<ListOfJobListView> {
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
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          width: 60.0,
                          height: 60.0,
                          child: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: widget.listJobs.data[index].companyLogo ==
                                      null
                                  ? Container()
                                  : NetworkImageModified(
                                      Urls.imageBaseUrlOfEmployer +
                                          widget.listJobs.data[index]
                                              .companyLogo))),
                      if (widget.isDeletedAble == true)
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<ListofjobBloc>(context).add(
                                DeleteMyApplicationEvent(
                                    deleteId: widget.listJobs.data[index].iD));
                          },
                          icon: Icon(
                            Icons.cancel,
                            size: 35.0,
                          ),
                        )
                    ],
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
