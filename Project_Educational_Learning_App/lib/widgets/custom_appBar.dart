import 'package:flutter/material.dart';
import 'package:learning_app/widgets/Text_Widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leadingTitle,
    this.backIcon,
    this.backIconFunction,
    this.title = '',
    this.trailingTitle = '',
    this.trailingIconWidget1,
    this.trailingIconWidget2,
    this.onTap,
    this.color = Colors.black54,
  }) : super(key: key);
  final String? leadingTitle;
  final Widget? backIcon;
  final VoidCallback? backIconFunction;
  final String title;
  final Color color;
  final String trailingTitle;
  final Widget? trailingIconWidget1;
  final Widget? trailingIconWidget2;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10 / 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: leadingTitle == null
                  ? InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.teal,
                        size: 25.0,
                      ),
                    )
                  : Center(
                      child: TextWidget(
                        text: leadingTitle.toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    )),
          Center(
            child: TextWidget(
              text: title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Container(
              child:
                  (trailingIconWidget1 == null && trailingIconWidget2 == null)
                      ? Center(
                          child: TextWidget(
                            text: trailingTitle,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: trailingIconWidget1,
                            ),
                            Center(
                              child: trailingIconWidget2,
                            ),
                          ],
                        ))
        ],
      ),
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 65);
}
