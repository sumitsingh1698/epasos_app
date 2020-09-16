class DashboardModel {
  Data data;

  DashboardModel({this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Detail row;
  List<Experience> experience;
  List<Qualification> qualification;
  int appliedJobs;
  List<Degrees> degrees;
  List<Resume> resume;
  RowAdditional rowAdditional;
  String photo;
  String latestJobTitle;
  String latestJobCompanyName;

  Data(
      {this.row,
      this.experience,
      this.qualification,
      this.appliedJobs,
      this.degrees,
      this.resume,
      this.rowAdditional,
      this.photo,
      this.latestJobTitle,
      this.latestJobCompanyName});

  Data.fromJson(Map<String, dynamic> json) {
    row = json['row'] != null ? new Detail.fromJson(json['row']) : null;
    if (json['experience'] != null) {
      experience = new List<Experience>();
      json['experience'].forEach((v) {
        experience.add(new Experience.fromJson(v));
      });
    }
    if (json['qualification'] != null) {
      qualification = new List<Qualification>();
      json['qualification'].forEach((v) {
        qualification.add(new Qualification.fromJson(v));
      });
    }
    appliedJobs = json['applied_jobs'];
    if (json['degrees'] != null) {
      degrees = new List<Degrees>();
      json['degrees'].forEach((v) {
        degrees.add(new Degrees.fromJson(v));
      });
    }
    if (json['resume'] != null) {
      resume = new List<Resume>();
      json['resume'].forEach((v) {
        resume.add(new Resume.fromJson(v));
      });
    }
    rowAdditional = json['row_additional'] != null
        ? new RowAdditional.fromJson(json['row_additional'])
        : null;
    photo = json['photo'];
    latestJobTitle = json['latest_job_title'];
    latestJobCompanyName = json['latest_job_company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.row != null) {
      data['row'] = this.row.toJson();
    }
    if (this.experience != null) {
      data['experience'] = this.experience.map((v) => v.toJson()).toList();
    }
    if (this.qualification != null) {
      data['qualification'] =
          this.qualification.map((v) => v.toJson()).toList();
    }
    data['applied_jobs'] = this.appliedJobs;
    if (this.degrees != null) {
      data['degrees'] = this.degrees.map((v) => v.toJson()).toList();
    }
    if (this.resume != null) {
      data['resume'] = this.resume.map((v) => v.toJson()).toList();
    }
    if (this.rowAdditional != null) {
      data['row_additional'] = this.rowAdditional.toJson();
    }
    data['photo'] = this.photo;
    data['latest_job_title'] = this.latestJobTitle;
    data['latest_job_company_name'] = this.latestJobCompanyName;
    return data;
  }
}

class Detail {
  String iD;
  String firstName;
  String lastName;
  String email;
  String password;
  String presentAddress;
  String permanentAddress;
  String dated;
  String country;
  String city;
  String gender;
  String dob;
  String phone;
  String photo;
  String defaultCvId;
  String mobile;
  String homePhone;
  String cnic;
  String nationality;
  String careerObjective;
  String sts;
  String verificationCode;
  String firstLoginDate;
  String lastLoginDate;
  String slug;
  String ipAddress;
  String oldId;
  String flag;
  String queueEmailSts;
  String sendJobAlert;

  Detail(
      {this.iD,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.presentAddress,
      this.permanentAddress,
      this.dated,
      this.country,
      this.city,
      this.gender,
      this.dob,
      this.phone,
      this.photo,
      this.defaultCvId,
      this.mobile,
      this.homePhone,
      this.cnic,
      this.nationality,
      this.careerObjective,
      this.sts,
      this.verificationCode,
      this.firstLoginDate,
      this.lastLoginDate,
      this.slug,
      this.ipAddress,
      this.oldId,
      this.flag,
      this.queueEmailSts,
      this.sendJobAlert});

  Detail.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    presentAddress = json['present_address'];
    permanentAddress = json['permanent_address'];
    dated = json['dated'];
    country = json['country'];
    city = json['city'];
    gender = json['gender'];
    dob = json['dob'];
    phone = json['phone'];
    photo = json['photo'];
    defaultCvId = json['default_cv_id'];
    mobile = json['mobile'];
    homePhone = json['home_phone'];
    cnic = json['cnic'];
    nationality = json['nationality'];
    careerObjective = json['career_objective'];
    sts = json['sts'];
    verificationCode = json['verification_code'];
    firstLoginDate = json['first_login_date'];
    lastLoginDate = json['last_login_date'];
    slug = json['slug'];
    ipAddress = json['ip_address'];
    oldId = json['old_id'];
    flag = json['flag'];
    queueEmailSts = json['queue_email_sts'];
    sendJobAlert = json['send_job_alert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['present_address'] = this.presentAddress;
    data['permanent_address'] = this.permanentAddress;
    data['dated'] = this.dated;
    data['country'] = this.country;
    data['city'] = this.city;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['default_cv_id'] = this.defaultCvId;
    data['mobile'] = this.mobile;
    data['home_phone'] = this.homePhone;
    data['cnic'] = this.cnic;
    data['nationality'] = this.nationality;
    data['career_objective'] = this.careerObjective;
    data['sts'] = this.sts;
    data['verification_code'] = this.verificationCode;
    data['first_login_date'] = this.firstLoginDate;
    data['last_login_date'] = this.lastLoginDate;
    data['slug'] = this.slug;
    data['ip_address'] = this.ipAddress;
    data['old_id'] = this.oldId;
    data['flag'] = this.flag;
    data['queue_email_sts'] = this.queueEmailSts;
    data['send_job_alert'] = this.sendJobAlert;
    return data;
  }
}

class Experience {
  String iD;
  String seekerID;
  String jobTitle;
  String companyName;
  String startDate;
  String endDate;
  String city;
  String country;
  String responsibilities;
  String dated;
  String flag;
  String oldId;

  Experience(
      {this.iD,
      this.seekerID,
      this.jobTitle,
      this.companyName,
      this.startDate,
      this.endDate,
      this.city,
      this.country,
      this.responsibilities,
      this.dated,
      this.flag,
      this.oldId});

  Experience.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    seekerID = json['seeker_ID'];
    jobTitle = json['job_title'];
    companyName = json['company_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    city = json['city'];
    country = json['country'];
    responsibilities = json['responsibilities'];
    dated = json['dated'];
    flag = json['flag'];
    oldId = json['old_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['seeker_ID'] = this.seekerID;
    data['job_title'] = this.jobTitle;
    data['company_name'] = this.companyName;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['city'] = this.city;
    data['country'] = this.country;
    data['responsibilities'] = this.responsibilities;
    data['dated'] = this.dated;
    data['flag'] = this.flag;
    data['old_id'] = this.oldId;
    return data;
  }
}

class Qualification {
  String iD;
  String seekerID;
  String degreeLevel;
  String degreeTitle;
  String major;
  String institude;
  String country;
  String city;
  String completionYear;
  String dated;
  String flag;
  String oldId;

  Qualification(
      {this.iD,
      this.seekerID,
      this.degreeLevel,
      this.degreeTitle,
      this.major,
      this.institude,
      this.country,
      this.city,
      this.completionYear,
      this.dated,
      this.flag,
      this.oldId});

  Qualification.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    seekerID = json['seeker_ID'];
    degreeLevel = json['degree_level'];
    degreeTitle = json['degree_title'];
    major = json['major'];
    institude = json['institude'];
    country = json['country'];
    city = json['city'];
    completionYear = json['completion_year'];
    dated = json['dated'];
    flag = json['flag'];
    oldId = json['old_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['seeker_ID'] = this.seekerID;
    data['degree_level'] = this.degreeLevel;
    data['degree_title'] = this.degreeTitle;
    data['major'] = this.major;
    data['institude'] = this.institude;
    data['country'] = this.country;
    data['city'] = this.city;
    data['completion_year'] = this.completionYear;
    data['dated'] = this.dated;
    data['flag'] = this.flag;
    data['old_id'] = this.oldId;
    return data;
  }
}

class Degrees {
  String iD;
  String val;
  String text;
  String displayOrder;

  Degrees({this.iD, this.val, this.text, this.displayOrder});

  Degrees.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    val = json['val'];
    text = json['text'];
    displayOrder = json['display_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['val'] = this.val;
    data['text'] = this.text;
    data['display_order'] = this.displayOrder;
    return data;
  }
}

class Resume {
  String iD;
  String seekerID;
  String isUploadedResume;
  String fileName;
  String resumeName;
  String dated;
  String isDefaultResume;

  Resume(
      {this.iD,
      this.seekerID,
      this.isUploadedResume,
      this.fileName,
      this.resumeName,
      this.dated,
      this.isDefaultResume});

  Resume.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    seekerID = json['seeker_ID'];
    isUploadedResume = json['is_uploaded_resume'];
    fileName = json['file_name'];
    resumeName = json['resume_name'];
    dated = json['dated'];
    isDefaultResume = json['is_default_resume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['seeker_ID'] = this.seekerID;
    data['is_uploaded_resume'] = this.isUploadedResume;
    data['file_name'] = this.fileName;
    data['resume_name'] = this.resumeName;
    data['dated'] = this.dated;
    data['is_default_resume'] = this.isDefaultResume;
    return data;
  }
}

class RowAdditional {
  String iD;
  String seekerID;
  String languages;
  String interest;
  String awards;
  String additionalQualities;
  String convictedCrime;
  String crimeDetails;
  String summary;
  String badHabits;
  String salary;
  String keywords;
  String description;

  RowAdditional(
      {this.iD,
      this.seekerID,
      this.languages,
      this.interest,
      this.awards,
      this.additionalQualities,
      this.convictedCrime,
      this.crimeDetails,
      this.summary,
      this.badHabits,
      this.salary,
      this.keywords,
      this.description});

  RowAdditional.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    seekerID = json['seeker_ID'];
    languages = json['languages'];
    interest = json['interest'];
    awards = json['awards'];
    additionalQualities = json['additional_qualities'];
    convictedCrime = json['convicted_crime'];
    crimeDetails = json['crime_details'];
    summary = json['summary'];
    badHabits = json['bad_habits'];
    salary = json['salary'];
    keywords = json['keywords'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['seeker_ID'] = this.seekerID;
    data['languages'] = this.languages;
    data['interest'] = this.interest;
    data['awards'] = this.awards;
    data['additional_qualities'] = this.additionalQualities;
    data['convicted_crime'] = this.convictedCrime;
    data['crime_details'] = this.crimeDetails;
    data['summary'] = this.summary;
    data['bad_habits'] = this.badHabits;
    data['salary'] = this.salary;
    data['keywords'] = this.keywords;
    data['description'] = this.description;
    return data;
  }
}
