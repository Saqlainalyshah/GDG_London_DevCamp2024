import 'package:flutter/material.dart';
import 'package:learning_app/screen_body/edit_profile.dart';
import '../mvc/view.dart';
import '../widgets/text_field_widget.dart';

class DiscoverTutorBody extends StatefulWidget {
  const DiscoverTutorBody({Key? key}) : super(key: key);

  @override
  State<DiscoverTutorBody> createState() => _DiscoverTutorBodyState();
}

class _DiscoverTutorBodyState extends State<DiscoverTutorBody> {
  final TextEditingController _conSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          TextFieldWidget(
            controller: _conSearch,
            color: const Color(0xFFEBECF0),
            leadingIcon: Icons.search,
            hintText: "Search by Name",
            trailingIcon: Icons.clear,
          ),
          buildSizedBox(),
          const Expanded(child: UserView()),
        ],
      ),
    );
  }
}
