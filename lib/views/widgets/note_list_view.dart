import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/note_model.dart';
import '../../view model/cubit/note/note_cubit.dart';
import 'note_item.dart';

class NoteListView extends StatelessWidget {


  const NoteListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NoteCubit,NoteStates>(

        builder: (context, state) {
          if(state is NoteLoading){
            return
              CircularProgressIndicator();
        }
          List<NoteModel> notes= (state as NoteSuccess).notes ;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: NoteItem(note: notes[index]),
              );
            },
          );
        },
      ),
    );
  }
}