import 'package:flutter/material.dart';
import '../widgets/jobContainer.dart';
import '../widgets/largeButton.dart';

Widget Home(){
  return SingleChildScrollView(
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
          },
          child: largeButton(
              title: "Learn New Skill",
              subTitle: "Increase your chance to get job faster",
              onPressed: () {},
              isOutlined: false),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => null,
          child: largeButton(
              title: "Government Scheme",
              subTitle: "Schemes which can benefit you",
              onPressed: () {},
              isOutlined: true),
        ),
        JobContainer(
            title: " Cleaner",
            index: 0,
            description: "I want a job cleaner",
            wageRange: "wageRange"),
        JobContainer(
            title: " Electrician",
            index: 0,
            description: "I want a job cleaner",
            wageRange: "wageRange"),
        JobContainer(
            title: "Carpenter",
            index: 0,
            description: "I want a job cleaner",
            wageRange: "wageRange"),
        JobContainer(
            title: "Sweeper",
            index: 0,
            description: "I want a job cleaner",
            wageRange: "wageRange"),
      ],
    ),
  );
}



