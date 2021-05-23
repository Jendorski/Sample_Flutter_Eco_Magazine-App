class UserProfile {
  String lastName;
  String email;
  String firstName;
  String password;
  String dateCreated;
  String phoneNumber;


  UserProfile({
    this.lastName, this.email, this.firstName, this.password,
    this.dateCreated, this.phoneNumber
});

  UserProfile.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    password = json['password'];
    lastName = json['lastName'];
    dateCreated = json['dateCreated'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['password'] = this.password;
    data['lastName'] = this.lastName;
    data['dateCreated'] = this.dateCreated;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
