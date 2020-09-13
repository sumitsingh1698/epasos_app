import 'package:dio/dio.dart';

class JobSeekerSignup {
  String email;
  String pass;
  String fullName;
  String gender;
  String dobDay;
  String dobMonth;
  String dobYear;
  String currentAddress;
  String country;
  String city;
  String nationality;
  String mobileNo;
  String phone;
  String cvLocation;

  JobSeekerSignup(
      {this.email,
      this.pass,
      this.fullName,
      this.gender,
      this.dobDay,
      this.dobMonth,
      this.dobYear,
      this.currentAddress,
      this.city,
      this.country,
      this.nationality,
      this.mobileNo,
      this.phone,
      this.cvLocation});

  Future<Map<String, dynamic>> toJson() async => {
        "email": email,
        "pass": pass,
        "full_name": fullName,
        "gender": gender,
        "dob_day": dobDay,
        "dob_month": dobMonth,
        "dob_year": dobYear,
        "current_address": currentAddress,
        "country": country,
        "city": city,
        "nationality": nationality,
        "mobile_number": mobileNo,
        "phone": phone,
        "cv_file":
            await MultipartFile.fromFile(cvLocation, filename: "mycv.pdf")
      };
}
