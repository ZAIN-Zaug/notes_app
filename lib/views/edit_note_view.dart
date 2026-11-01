import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/edit_note_body_view.dart';


import '../models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
  final String id = "edit view";

  @override
  Widget build(BuildContext context) {
    final NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
        body: EditBodyView(note: note)
    );
  }

}
