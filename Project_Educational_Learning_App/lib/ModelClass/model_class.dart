class UserModelClass{
  String? name,image;
  int? Id;
  String? subTitle;
  UserModelClass({
    this.name,
    this.Id,
    this.image,
    this.subTitle});
}
List<UserModelClass> userLists=[
  UserModelClass(Id: 1,name: "Mia Jackson",subTitle: "Computer |Cyber Security",image: "assets/images/profile1.jpg"),
  UserModelClass(Id: 2,name: "Kiran Sultana",subTitle: "Chemistry | Biology",image: "assets/images/profile0.jpg"),
  UserModelClass(Id: 3,name: "Sadia Ali Shah",subTitle: "Math | Physics",image: "assets/images/profile2.jpg"),
  UserModelClass(Id: 4,name: "Navaid Ali",subTitle: "Physics | Math",image: "assets/images/profile3.jpg"),
  UserModelClass(Id: 5,name: "Shoaib Akber",subTitle: "Pak-Study | General Science",image: "assets/images/profile4.jpg"),
  UserModelClass(Id: 6,name: "Jack Grealish",subTitle: "English | English Literature",image: "assets/images/profile5.jpg"),
  UserModelClass(Id: 7,name: "Peter John",subTitle: "Flutter | React Native",image: "assets/images/profile8.jpg"),
  UserModelClass(Id: 8,name: "Charles",subTitle: "React Native | Laravel",image: "assets/images/profile7.jpg"),
];