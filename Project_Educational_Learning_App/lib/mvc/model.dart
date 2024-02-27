class UserDataModelClass{
  List<UserDetailsModelClass>? userAttributes;
  UserDataModelClass({this.userAttributes});
  factory UserDataModelClass.fromJson(var parse){
    return UserDataModelClass(
      userAttributes: List<UserDetailsModelClass>.from(parse["results"].map((item){
        return UserDetailsModelClass.fromJson(item);
      }))
    );
  }
}
class UserDetailsModelClass{
  Name? nameModelClass;
  Picture? userPicsModelClass;
  UserName? userNameModelClass;
  UserDetailsModelClass({this.nameModelClass,this.userPicsModelClass,this.userNameModelClass});
  factory UserDetailsModelClass.fromJson(var parse){
  return UserDetailsModelClass(
      nameModelClass: Name.fromJson(parse["name"]),
      userPicsModelClass:Picture.fromJson(parse["picture"]),
      userNameModelClass:UserName.fromJson(parse["login"])
  );
  }


}

class Name{
  String? firstName;
  String? lastName;
  Name({this.firstName,this.lastName});
  factory Name.fromJson(var parse){
    return Name(
      firstName: parse["first"],
      lastName: parse["last"],
    );
  }
}
class Picture{
  String? large;
  String? medium;
  String? thumbnail;
  Picture({this.large,this.medium,this.thumbnail});
  factory Picture.fromJson(var parse){
    return Picture(
        large: parse['large'],
        medium: parse['medium'],
        thumbnail: parse['thumbnail']
    );
  }
}
class UserName{
  String? userName;
  UserName({this.userName});
  factory UserName.fromJson(var parse){
    return UserName(
      userName: parse["username"]
    );
  }
}