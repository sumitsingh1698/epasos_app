class UserLogin {
  String email;
  String pass;

  UserLogin({this.email, this.pass});

  Map<String, dynamic> toDatabaseJson() => {"email": email, "pass": pass};
}

class Token {
  String token;

  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['token']);
  }
}
