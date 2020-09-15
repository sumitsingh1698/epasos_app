import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/list_of_jobs/listofJobs_listview.dart';
import 'package:jobportal_working/list_of_jobs/listofJobs_page.dart';
import 'package:jobportal_working/login/login_page.dart';
import 'package:jobportal_working/manageskill/mangage_skill_page.dart';
import 'package:jobportal_working/signup/signup_page.dart';
import 'package:jobportal_working/utils/loading_indicator.dart';

import 'home/homepage.dart';
import 'login/splash_page/splash_page.dart';
import 'utils/customPrimarySach.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF354c80)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUnintialized) {
            return SplashPage();
          }
          // if (state is AuthenticationAuthenticated) {
          //   print("authentication Builder");
          //   return Homepage();
          // }
          // if (state is AuthenticationUnauthenticated) {
          //   return Homepage();
          // }

          if (state is AuthenticationLoadingState) {
            return LoadingIndicator();
          }
          if (state is GoForLoggedInState) {
            return LoginPage();
          }
          // if (state is BacktoHomeState) {
          //   return Homepage();
          // }
          if (state is GoForSignUpState) {
            return EmployeeSignUpPage(state.type);
          }
          if (state is GoToListOfJobState) {
            return ListOfJobsPage(state.type);
          }
          if (state is GotoManageSkillState) {
            return ManageSkillPage();
          }
          // if (state is ViewDashboardState || state is ViewHomeState) {
          //   return Homepage();
          // }
          return Homepage();
        },
      ),
      routes: {
        '/homepage': (context) => Homepage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
