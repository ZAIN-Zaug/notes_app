import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

import '../../view model/cubit/note/note_cubit.dart';


class NoteItem extends StatelessWidget {
  const NoteItem({super.key,required this.note});
  final NoteModel note ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, EditNoteView().id,arguments:note);
      },
      child: Container(
        padding: EdgeInsets.only(top: 24,bottom: 26,left: 22,right: 20),
        decoration:  BoxDecoration(
          color: Color(note.color),
              borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              titleAlignment: ListTileTitleAlignment.top,
               contentPadding: EdgeInsets.zero,
                title: Text(note.title,
                    style: TextStyle(fontSize: 26,color: Colors.black,fontFamily: 'Poppins')),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(note.subTitle,
                    style: TextStyle(fontSize: 20,color: Colors.black.withValues(alpha: 0.4))),
              ),
               trailing: Transform.translate(
                 offset: Offset(0,7),
                 child: IconButton
                   (
                   onPressed: () {
                     BlocProvider.of<NoteCubit>(context).deleteNote(note);
                   },
                   icon:Icon(Icons.delete),
                 iconSize: 30,
                 color: Colors.black,),
               ),

            ),
             Padding(padding: EdgeInsets.symmetric(horizontal: 12),
             child: Text(note.date,style: TextStyle(fontSize: 16,color:Colors.black.withValues(alpha: 0.4)),)),
          ],
        ),
      ),
    );
  }
}
