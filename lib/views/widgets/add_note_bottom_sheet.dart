import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/widgets/show_snack_bar.dart';


import '../../view model/cubit/note/note_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: BlocConsumer<NoteCubit,NoteStates>(
        listener : (BuildContext context, NoteStates state) {

          if(state is NoteFailure){
            showSnackBar(context, "there is a problem , try again");
          }
          else  if( state is NoteSuccess){
            showSnackBar(context, "success");
            Navigator.pop(context);
          }

        },
         builder: (BuildContext context, NoteStates state) {
          return AbsorbPointer(
            absorbing: state is NoteLoading,
            child: SingleChildScrollView(
                child: AddNoteForm()
            ),
          );
            }

      ),
    );
  }
}
