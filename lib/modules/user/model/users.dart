class Users {
  int? id;
  String? createDateTime;
  String? createdBy;
  String? lastChangedDateTime;
  String? lastChangedBy;
  String? userName;
  String? email;
  String? phoneNumber;
  String? password;
  String? accessToken;
  String? country;
  int? registrationNo;
  String? address;
  String? workStatus;
  String? gender;
  String? birthdate;
  String? passportNo;
  String? syndicateId;
  int? emailcode;
  bool? isverify;
  String? fingerPatternCode;
  int? resetCode;
  String? userType;
  String? userRole;
  String? lastLogin;
  bool? isSuspended;

  Users(
      {this.id,
      this.createDateTime,
      this.createdBy,
      this.lastChangedDateTime,
      this.lastChangedBy,
      this.userName,
      this.email,
      this.phoneNumber,
      this.password,
      this.accessToken,
      this.country,
      this.registrationNo,
      this.address,
      this.workStatus,
      this.gender,
      this.birthdate,
      this.passportNo,
      this.syndicateId,
      this.emailcode,
      this.isverify,
      this.fingerPatternCode,
      this.resetCode,
      this.userType,
      this.userRole,
      this.lastLogin,
      this.isSuspended});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDateTime = json['createDateTime'];
    createdBy = json['createdBy'];
    lastChangedDateTime = json['lastChangedDateTime'];
    lastChangedBy = json['lastChangedBy'];
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    accessToken = json['access_token'];
    country = json['country'];
    registrationNo = json['registrationNo'];
    address = json['address'];
    workStatus = json['workStatus'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    passportNo = json['PassportNo'];
    syndicateId = json['syndicateId'];
    emailcode = json['emailcode'];
    isverify = json['isverify'];
    fingerPatternCode = json['fingerPatternCode'];
    resetCode = json['reset_code'];
    userType = json['userType'];
    userRole = json['userRole'];
    lastLogin = json['lastLogin'];
    isSuspended = json['isSuspended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createDateTime'] = createDateTime;
    data['createdBy'] = createdBy;
    data['lastChangedDateTime'] = lastChangedDateTime;
    data['lastChangedBy'] = lastChangedBy;
    data['userName'] = userName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['access_token'] = accessToken;
    data['country'] = country;
    data['registrationNo'] = registrationNo;
    data['address'] = address;
    data['workStatus'] = workStatus;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['PassportNo'] = passportNo;
    data['syndicateId'] = syndicateId;
    data['emailcode'] = emailcode;
    data['isverify'] = isverify;
    data['fingerPatternCode'] = fingerPatternCode;
    data['reset_code'] = resetCode;
    data['userType'] = userType;
    data['userRole'] = userRole;
    data['lastLogin'] = lastLogin;
    data['isSuspended'] = isSuspended;
    return data;
  }
}