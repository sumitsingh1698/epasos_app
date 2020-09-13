class User {
  String userId;
  String userEmail;
  String firstName;
  String slug;
  bool isUserLogin;
  bool isJobSeeker;
  bool isEmployer;
  String mobileToken;
  int userType;

  User(
      {this.userId,
      this.userEmail,
      this.firstName,
      this.slug,
      this.isUserLogin,
      this.isJobSeeker,
      this.isEmployer,
      this.mobileToken,
      this.userType});

  User.fromJson(Map<String, dynamic> json) {
    print("in here " + json.toString());
    userId = json['user_id'];
    print("1");

    userEmail = json['user_email'];
    print("1");

    firstName = json['first_name'];
    print("1");

    slug = json['slug'];
    print("1");

    isUserLogin = json['is_user_login'];
    print("1");

    isJobSeeker = json['is_job_seeker'];
    print("1");

    isEmployer = json['is_employer'];
    print("1");

    mobileToken = json['mobile_token'];
    print("1");

    userType = json['user_type'];
    print("1");

    print("done json");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_email'] = this.userEmail;
    data['first_name'] = this.firstName;
    data['slug'] = this.slug;
    data['is_user_login'] = this.isUserLogin;
    data['is_job_seeker'] = this.isJobSeeker;
    data['is_employer'] = this.isEmployer;
    data['mobile_token'] = this.mobileToken;
    data['user_type'] = this.userType;
    return data;
  }
}
