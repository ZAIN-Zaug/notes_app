import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:notes_app/models/notes_exception.dart';
import 'package:notes_app/models/notes_repository.dart';

import '../../../models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit(super.initialState, this.repo);

  NotesRepository repo;
  Future<void> addNote({required String title,
    required String subtitle,
    required int color,
  }) async {
    emit(NoteLoading());
    NoteModel note = NoteModel(
      title: title,
      subTitle: subtitle,
      date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      color: color,
    );
    try {
      await repo.addNote(note);
      emit(NoteSuccess( notes:repo.getNotes(),));
    } on NotesException catch (e) {
      emit(NoteFailure(e.message));
    }
  }

  void fetchNotes() {
    emit(NoteLoading());
    try {
      emit(NoteSuccess(notes: repo.getNotes()));
    } on NotesException catch (e) {
      emit(NoteFailure(e.message));
    }
  }

  Future<void> deleteNote(NoteModel note) async {
    emit(NoteLoading());
    try {
      await repo.deleteNote(note);
      emit(NoteSuccess(notes:repo.getNotes(),));
    } on NotesException catch (e) {
      emit(NoteFailure(e.message));
    }
  }

  Future<void> updateNote(
      NoteModel note, {
        String? title,
        String? subTitle,
      }) async {
    emit(NoteLoading());
    try {
      note.title = title ?? note.title;
      note.subTitle = subTitle ?? note.subTitle;
      await repo.updateNote(note);
      emit(NoteSuccess(notes: repo.getNotes()));
    } on NotesException catch (e) {
      emit(NoteFailure(e.message));
    }
  }
}
