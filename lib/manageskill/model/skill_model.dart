class Skill {
  List<Data> data;

  Skill({this.data});

  Skill.fromJson(Map<String, dynamic> json) {
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
  String seekerID;
  String skillName;

  Data({this.iD, this.seekerID, this.skillName});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    seekerID = json['seeker_ID'];
    skillName = json['skill_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['seeker_ID'] = this.seekerID;
    data['skill_name'] = this.skillName;
    return data;
  }
}
