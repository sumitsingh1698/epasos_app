import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:jobportal_working/model/api_model.dart';
import 'package:jobportal_working/signup/model/employee_signup.dart';
import 'package:jobportal_working/signup/model/jobseeker_signup.dart';

class JobPortalApi {
  final _baseUrl = "http://job.educarep.com/";

  Future<Map<String, dynamic>> loginWithEmailAndPassword(
      UserLogin userLogin) async {
    final url = "Api/login";

    print(_baseUrl + url);
    print(userLogin.toDatabaseJson().toString());

    var dio = Dio();

    FormData formData = new FormData.fromMap(userLogin.toDatabaseJson());
    var response = await dio.post(_baseUrl + url, data: formData);

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(json.decode(response.data).toString());
      return json.decode(response.data);
    } else {
      print(json.decode(response.data).toString());
      throw Exception(json.decode(response.data));
    }
  }

  Future<Map<String, dynamic>> signUpforJobSeeker(
      JobSeekerSignup jobSeekerSignup) async {
    final url = "Api/jobseeker_signup";

    print(_baseUrl + url);
    print(jobSeekerSignup.toJson().toString());

    var dio = Dio();

    FormData formData = new FormData.fromMap(await jobSeekerSignup.toJson());

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(json.decode(response.data).toString());
      return json.decode(response.data);
    } else {
      print(json.decode(response.data).toString());
      throw Exception(json.decode(response.data));
    }
  }

  Future<Map<String, dynamic>> signUpforEmployee(
      EmployeeSignUp employeeSignUp) async {
    final url = "Api/employee_signup";

    print(_baseUrl + url);
    print(employeeSignUp.toJson().toString());

    var dio = Dio();

    FormData formData = new FormData.fromMap(await employeeSignUp.toJson());

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(json.decode(response.data).toString());
      return json.decode(response.data);
    } else {
      print(json.decode(response.data).toString());
      throw Exception(json.decode(response.data));
    }
  }
}
