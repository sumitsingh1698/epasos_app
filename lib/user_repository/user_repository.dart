import 'dart:async';
import 'package:jobportal_working/api_connection/api_connection.dart';
import 'package:jobportal_working/model/api_model.dart';
import 'package:jobportal_working/model/user_model.dart';
import 'package:jobportal_working/signup/model/employee_signup.dart';
import 'package:jobportal_working/signup/model/jobseeker_signup.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  User user;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<User> authenticate({
    @required String email,
    @required String pass,
  }) async {
    UserLogin userLogin = UserLogin(email: email, pass: pass);
    print("athu");
    Map<String, dynamic> data =
        await JobPortalApi().loginWithEmailAndPassword(userLogin);
    print(data['data']);
    print("done is ggg");
    if (data['status'] == true) {
      final SharedPreferences prefs = await _prefs;

      prefs.setString("email", email);
      prefs.setString("pass", pass);
      print("here is am now");

      user = User.fromJson(data['data']);
      // print(user.firstName);
      return user;
    } else {
      throw Exception("${data['message']}");
    }
  }

  bool isUser() {
    return user != null;
  }

  Future<bool> hasUser() async {
    final SharedPreferences prefs = await _prefs;

    String email =
        prefs.getString("email") != null ? prefs.getString("email") : null;
    String pass =
        prefs.getString("pass") != null ? prefs.getString("pass") : null;

    if (email != null && pass != null) {
      await authenticate(email: email, pass: pass);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> removeUser() async {
    user = null;
    final SharedPreferences prefs = await _prefs;
    prefs.setString("email", null);
    prefs.setString("pass", null);
    return true;
  }

  Future<bool> signUpJobSeeker(JobSeekerSignup employeeSignUp) async {
    Map<String, dynamic> data =
        await JobPortalApi().signUpforJobSeeker(employeeSignUp);
    print(data);

    if (data['status'] == true) {
      await authenticate(
          email: employeeSignUp.email, pass: employeeSignUp.pass);

      return true;
    } else {
      throw Exception("${data['message']}");
    }
  }

  Future<bool> signUpEmployee(EmployeeSignUp employeeSignUp) async {
    Map<String, dynamic> data =
        await JobPortalApi().signUpforEmployee(employeeSignUp);

    print(data);

    if (data['status'] == true) {
      await authenticate(
          email: employeeSignUp.email, pass: employeeSignUp.pass);

      return true;
    } else {
      throw Exception("${data['message']}");
    }
  }
}
