import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import '../../view model/cubit/note/note_cubit.dart';
import 'custom_app_bar.dart';
import 'custom_textfield.dart';


class EditBodyView extends StatefulWidget {
  const EditBodyView({super.key, required this.note});
  final  NoteModel note;


  @override
  State<EditBodyView> createState() => _EditBodyViewState();
}

class _EditBodyViewState extends State<EditBodyView> {
  String ?title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 46,
          ),
          CustomAppBar(
            onPressed:() async {
              await BlocProvider.of<NoteCubit>(context).updateNote(widget.note,title: title,subTitle: subtitle);
              if (!context.mounted) return;
              Navigator.pop(context);
            },
            pageTitle: "Edit Note",
            iconName: Icons.check,),
          Padding(
            padding: const EdgeInsets.only(top:40,bottom: 15),
            child: CustomTextField(hintText: 'Title',text: widget.note.title,
            onChange: (value){
             title= value ;
            },),
          ),
           CustomTextField(
             onChange: (value){
             subtitle=value;
             },
             text: widget.note.subTitle,
             hintText: 'Content',
             Maxlines: 5,)

        ],
      ),
    );
  }
}
