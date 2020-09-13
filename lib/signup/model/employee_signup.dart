import 'package:dio/dio.dart';

class EmployeeSignUp {
  String email;
  String pass;
  String fullName;
  String country;
  String city;
  String mobilePhone;
  String companyPhone;
  String companyLogoLocation;
  String companyWebsite;
  String noOfEmployees;
  String companyDescription;
  String companyName;
  String indrustyId;
  String companyLocation;
  String logoExtension;

  EmployeeSignUp(
      {this.email,
      this.pass,
      this.fullName,
      this.companyName,
      this.companyLocation,
      this.companyDescription,
      this.companyLogoLocation,
      this.logoExtension,
      this.companyPhone,
      this.city,
      this.country,
      this.companyWebsite,
      this.indrustyId,
      this.mobilePhone,
      this.noOfEmployees});

  Future<Map<String, dynamic>> toJson() async => {
        "email": email,
        "pass": pass,
        "full_name": fullName,
        "company_location": companyLocation,
        "country": country,
        "city": city,
        "industry_id": indrustyId,
        "mobile_phone": mobilePhone,
        "company_name": companyName,
        "company_description": companyDescription,
        "company_phone": companyPhone,
        "no_of_employees": noOfEmployees,
        "company_website": companyWebsite,
        "company_logo": await MultipartFile.fromFile(companyLogoLocation,
            filename: "mycv.$logoExtension")
      };
}
