import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:jobportal_working/model/api_model.dart';
import 'package:jobportal_working/model/user_model.dart';
import 'package:jobportal_working/signup/model/employee_signup.dart';
import 'package:jobportal_working/signup/model/jobseeker_signup.dart';

class JobPortalApi {
  final _baseUrl = "http://job.educarep.com/";

  // Login Api with login and Email

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

  // Sign Up for Job Seeker

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

  // SignUp for Employee

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

  // Get Job List
  Future<dynamic> getListofJobs() async {
    final url = "Api/job_list";

    print(_baseUrl + url);

    var dio = Dio();

    var response = await dio.post(
      _baseUrl + url,
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

  Future<Map<String, dynamic>> addSkill(String skill, User user) async {
    final url = "Api/add_skill";

    print(_baseUrl + url);

    var dio = Dio();

    FormData formData = new FormData.fromMap({
      "skill": skill,
      "user_id": user.userId,
      "user_type": user.userType,
      "mobile_token": user.mobileToken,
    });

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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

  Future<Map<String, dynamic>> deleteSkill(String skillId, User user) async {
    final url = "Api/remove_skill";

    print(_baseUrl + url);

    var dio = Dio();

    FormData formData = new FormData.fromMap({
      "skill_id": skillId,
      "user_id": user.userId,
      "user_type": user.userType,
      "mobile_token": user.mobileToken,
    });

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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

  // Change Password
  Future<Map<String, dynamic>> changePassword(
      String oldPassword, String newPassword, User user) async {
    final url = "Api/change_password";

    print(_baseUrl + url);

    var dio = Dio();

    FormData formData = new FormData.fromMap({
      "old_password": oldPassword,
      "new_password": newPassword,
      "confirm_password": newPassword,
      "user_id": user.userId,
      "user_type": user.userType,
      "mobile_token": user.mobileToken
    });

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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

  Future<Map<String, dynamic>> updateSummary(String summary, User user) async {
    final url = "Api/update_summary";

    print(_baseUrl + url);

    var dio = Dio();

    FormData formData = new FormData.fromMap({
      "summary": summary,
      "user_id": user.userId,
      "user_type": user.userType,
      "mobile_token": user.mobileToken
    });

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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

  Future<Map<String, dynamic>> updateProfile(
      Map<String, dynamic> sendData) async {
    final url = "Api/update_profile";

    print(_baseUrl + url);

    var dio = Dio();

    FormData formData = new FormData.fromMap(sendData);

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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

  Future<Map<String, dynamic>> addUpdateExperience(
      Map<String, dynamic> sendData) async {
    final url = "Api/add_update_exerience";

    print(_baseUrl + url);

    var dio = Dio();

    FormData formData = new FormData.fromMap(sendData);

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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

  // Get Dashboard Data
  Future<dynamic> getDashboardData(User user) async {
    final url = "Api/employee_dashboard";

    FormData formData = new FormData.fromMap({
      "user_id": user.userId,
      "user_type": user.userType,
      "mobile_token": user.mobileToken
    });

    print(_baseUrl + url);

    var dio = Dio();

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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

  Future<dynamic> deleteExperience(String experienceId, User user) async {
    final url = "Api/delete_experience";

    FormData formData = new FormData.fromMap({
      "id": experienceId,
      "user_id": user.userId,
      "user_type": user.userType,
      "mobile_token": user.mobileToken
    });

    print(_baseUrl + url);

    var dio = Dio();

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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

  Future<Map<String, dynamic>> addUpdateQualification(
      Map<String, dynamic> sendData) async {
    final url = "Api/add_update_education";

    print(_baseUrl + url);

    var dio = Dio();

    FormData formData = new FormData.fromMap(sendData);

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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

  Future<dynamic> deleteQualification(String qualificationId, User user) async {
    final url = "Api/delete_education";

    FormData formData = new FormData.fromMap({
      "id": qualificationId,
      "user_id": user.userId,
      "user_type": user.userType,
      "mobile_token": user.mobileToken
    });

    print(_baseUrl + url);

    var dio = Dio();

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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

  Future<dynamic> deleteAppliedJob(String appliedJobId, User user) async {
    final url = "Api/delete_applied_job";

    FormData formData = new FormData.fromMap({
      "id": appliedJobId,
      "user_id": user.userId,
      "user_type": user.userType,
      "mobile_token": user.mobileToken
    });

    print(_baseUrl + url);

    var dio = Dio();

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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

  Future<dynamic> listOfSkill(User user) async {
    final url = "Api/skill_list";

    FormData formData = new FormData.fromMap({
      "user_id": user.userId,
      "user_type": user.userType,
      "mobile_token": user.mobileToken
    });

    print(_baseUrl + url);

    var dio = Dio();

    var response = await dio.post(
      _baseUrl + url,
      data: formData,
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
