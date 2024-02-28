import 'package:flutter/material.dart';
import 'package:fypkonnectjob/widgets/button_widget.dart';
class JobContainer extends StatelessWidget {
  String title;
  String description;
  // int totalQty;
  int index;
  String wageRange;
  // int qty;
  JobContainer({
    required this.title,
    required this.index,
    required this.description,
    // required this.totalQty,
    required this.wageRange,
    // required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xffF1F3F4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "I wanted ${title}",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 30),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                },
                child: Container(
                  width: 100,
                  height: 40,
                  child: ButtonWidget(onPress: () {  },title: "Details",)
                ),
              ),
              const Spacer(),
              const Text("Verified Job"),
              const Icon(Icons.check_circle, color: Colors.green)
            ],
          )
        ],
      ),
    );
  }
}
