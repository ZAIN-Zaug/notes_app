import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/views/widgets/note_body_view.dart';



class NotesView extends StatelessWidget {
  const NotesView({super.key});

  final String id = 'note view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: const NoteViewBody(),
    );
  }
}
