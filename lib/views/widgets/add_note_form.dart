import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note_model.dart';

import '../../view model/cubit/note/note_cubit.dart';
import 'color_item.dart';
import 'custom_add_bottom.dart';
import 'custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final formKey = GlobalKey<FormState>();
  String? title, subtitle;
  AutovalidateMode validator = AutovalidateMode.disabled;
  final List<Color> colors = [
    Color(int.parse('0xff839788')),
    Color(int.parse('0xffEEE0CB')),
    Color(int.parse('0xffBAA898')),
    Color(int.parse('0xffBFD7EA')),
    Color(int.parse('0xff7D70BA')),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: validator,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 33),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomTextField(
              hintText: "Title",
              onSaved: (value) {
                title = value;
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomTextField(
              hintText: "Content",
              Maxlines: 5,
              onSaved: (value) {
                subtitle = value;
              },
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 74,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      setState(() {});
                    },
                    child: ColorItem(
                      active: currentIndex == index,
                      color: colors[index],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 100),
          BlocBuilder<NoteCubit, NoteStates>(
            builder: (BuildContext context, state) {
              return CustomAddButton(
                isLoading: state is NoteLoading,
                formKey: formKey,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    BlocProvider.of<NoteCubit>(context).addNote(
                        title: title!, subtitle: subtitle!,color: colors[currentIndex].toARGB32());
                        } else {
                    validator = AutovalidateMode.always;
                    setState(() {});
                    }
                    },
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
