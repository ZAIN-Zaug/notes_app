import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/bloc_observer.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/view%20model/cubit/note/note_cubit.dart';
import 'package:notes_app/views/Notes_view.dart';
import 'package:notes_app/views/edit_note_view.dart';

import 'models/notes_repository.dart';
import 'models/notes_service.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  Bloc.observer=MyBlocObserver();
  runApp(const NotesApp());

}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        NotesService service = NotesService();
        NotesRepository repo= NotesRepository(service);
        return NoteCubit(NoteInitial(),repo) .. fetchNotes();
      },
      child: MaterialApp(

        routes: {
         EditNoteView().id:(context)=> EditNoteView(),
         NotesView().id  : (context)=>NotesView()
        },
        debugShowCheckedModeBanner: false,
        theme:ThemeData(brightness: Brightness.dark,
        fontFamily: 'Poppins',),

        home:const NotesView(),
      ),
    );
  }
}





