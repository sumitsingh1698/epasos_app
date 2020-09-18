import 'dart:async';

import 'package:flutter/material.dart';

class NetworkImageModified extends StatelessWidget {
  final String url;
  NetworkImageModified(this.url);
  Future<bool> cacheImage(String url, BuildContext context) async {
    bool hasNoError = true;
    var output = Completer<bool>();
    precacheImage(
      NetworkImage(url),
      context,
      onError: (e, stackTrace) => hasNoError = false,
    ).then((_) => output.complete(hasNoError));
    return output.future;
  }

  @override
  Widget build(context) {
    return FutureBuilder(
      future: cacheImage(url, context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.hasError) {
          return Container(
              height: 80.0,
              decoration: BoxDecoration(color: Colors.grey),
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        }
        if (snapshot.data == false) {
          return Container(
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        }

        return Image.network(url);
      },
    );
  }
}
