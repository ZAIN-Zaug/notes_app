import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/notes_exception.dart';
import '../../view model/cubit/note/note_cubit.dart';
import '../../view model/notifier/note_notifier.dart';
import 'note_item.dart';

class NoteListView extends ConsumerWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsync = ref.watch(notesProvider);

    return Expanded(
      child: BlocListener<NoteCubit, NoteStates>(
        listenWhen: (previous, current) => current is NoteSuccess,
        listener: (context, state) => ref.invalidate(notesProvider),
        child: notesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text(
              error is NotesException ? error.message : 'Something went wrong',
            ),
          ),
          data: (notes) => ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: NoteItem(note: notes[index]),
            ),
          ),
        ),
      ),
    );
  }
}