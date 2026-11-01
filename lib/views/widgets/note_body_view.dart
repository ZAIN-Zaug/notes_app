import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'note_list_view.dart';
class NoteViewBody extends StatelessWidget {
  const NoteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(

        children: [
          Container(
            height: 46,
            width: 46,
          ),
          const CustomAppBar(pageTitle: 'Notes',iconName: Icons.search,),
          const NoteListView()
        ],
      ),
    );
  }
}