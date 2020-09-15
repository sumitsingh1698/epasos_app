class ListJobs {
  List<Data> data;

  ListJobs({this.data});

  ListJobs.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String iD;
  String jobTitle;
  String jobSlug;
  String employerID;
  String companyID;
  String jobDescription;
  String city;
  String dated;
  String lastDate;
  String isFeatured;
  String sts;
  String companyName;
  String companyLogo;
  String companySlug;
  String score;

  Data(
      {this.iD,
      this.jobTitle,
      this.jobSlug,
      this.employerID,
      this.companyID,
      this.jobDescription,
      this.city,
      this.dated,
      this.lastDate,
      this.isFeatured,
      this.sts,
      this.companyName,
      this.companyLogo,
      this.companySlug,
      this.score});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    jobTitle = json['job_title'];
    jobSlug = json['job_slug'];
    employerID = json['employer_ID'];
    companyID = json['company_ID'];
    jobDescription = json['job_description'];
    city = json['city'];
    dated = json['dated'];
    lastDate = json['last_date'];
    isFeatured = json['is_featured'];
    sts = json['sts'];
    companyName = json['company_name'];
    companyLogo = json['company_logo'];
    companySlug = json['company_slug'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['job_title'] = this.jobTitle;
    data['job_slug'] = this.jobSlug;
    data['employer_ID'] = this.employerID;
    data['company_ID'] = this.companyID;
    data['job_description'] = this.jobDescription;
    data['city'] = this.city;
    data['dated'] = this.dated;
    data['last_date'] = this.lastDate;
    data['is_featured'] = this.isFeatured;
    data['sts'] = this.sts;
    data['company_name'] = this.companyName;
    data['company_logo'] = this.companyLogo;
    data['company_slug'] = this.companySlug;
    data['score'] = this.score;
    return data;
  }
}
