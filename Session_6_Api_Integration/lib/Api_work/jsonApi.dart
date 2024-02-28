class ApiUserModelClass{
  List<Result>? attributes;
  ApiUserModelClass({this.attributes});
  factory ApiUserModelClass.fromJson(var parse){
    return ApiUserModelClass(
      attributes: List<Result>.from(parse["results"].map((item){
        return Result.fromJson(item);
      }))
    );
  }
}
class Result{
  Name? name;
  Picture? image;
  String? email;

  Result({this.name,this.email,this.image,});
  factory Result.fromJson(var parse){
    return Result(
      name: Name.fromJson(parse["name"]),
      image: Picture.fromJson(parse["picture"]),
      email: parse["email"],
    );
  }
}

class Name{
  String? fName;
  String? lName;
  Name({this.fName,this.lName});
  factory Name.fromJson(var parse){
    return Name(
      fName: parse['first'],
      lName: parse['last'],
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

class UserModel{
  String? name;
  String? job;
  String? id;
  String? createAt;
  UserModel({this.name,this.job,this.id,this.createAt});
  factory UserModel.fromJson( var parse){
    return UserModel(
      name: parse['name'],
      job: parse['job'],
      id: parse['id'],
      createAt: parse['createdAt']
    );
  }
}