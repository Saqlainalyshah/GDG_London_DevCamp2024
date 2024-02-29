List<String> semester = [
  "1st Semester",
  "2nd Semester",
  "3rd Semester",
  "4th Semester",
  "5th Semester",
  "6th Semester",
  "7th Semester",
  "8th Semester"
];
List<String> university = [
  "Aga Khan University",
  "Karakoram International University",
  "COMSATS University Islamabad",
  "National University of Sciences & Technology (NUST)",
  "University of Lahore",
  "Institute of Space Technology",
  "FAST National University",
  "Quaid-i-Azam University"
];
List<String> location = [
  "Gilgit Baltistan",
  "Azad Jammu and Kashmir",
  "Balochistan",
  "Khyber Pakhtunkhwa",
  "Punjab",
  "Sindh",
];

class UserModelClass {
  String? name, image;
  int? Id;
  String? subTitle;
  UserModelClass({this.name, this.Id, this.image, this.subTitle});
}

List<UserModelClass> SliderList = [
  UserModelClass(
      Id: 1,
      subTitle: "What do you want to learn today ?",
      image: "assets/images/profile11.jpg"),
  UserModelClass(
      Id: 2, subTitle: "Let's Coding", image: "assets/images/image2.png"),
  UserModelClass(
      Id: 3, subTitle: "Hi! Students", image: "assets/images/profile1.jpg"),
];
