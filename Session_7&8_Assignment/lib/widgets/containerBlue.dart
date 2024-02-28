import 'package:flutter/cupertino.dart';

class BlueContainer extends StatelessWidget {
   BlueContainer({super.key,
  required this.child,
    this.height=0,
     this.color=const Color(0xFFB3E7FA),
  });

  Widget child;
  double height;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height,
      margin:  const EdgeInsets.symmetric(horizontal: 5),
      padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 20.0),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
      ),
      child: child,
    );
  }
}
