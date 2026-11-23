import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/note_model.dart';
import '../../models/notes_provider.dart';


class NotesNotifier extends AsyncNotifier<List<NoteModel>> {
  @override
  Future<List<NoteModel>> build() async {
    return ref.watch(notesRepositoryProvider).getNotes();
  }

  Future<void> addNote({
    required String title,
    required String subtitle,
    required int color,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(notesRepositoryProvider);
      final note = NoteModel(
        title: title,
        subTitle: subtitle,
        date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        color: color,
      );
      await repo.addNote(note);
      return repo.getNotes();
    });
  }

  Future<void> deleteNote(NoteModel note) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(notesRepositoryProvider);
      await repo.deleteNote(note);
      return repo.getNotes();
    });
  }

  Future<void> updateNote(
      NoteModel note, {
        String? title,
        String? subTitle,
      }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(notesRepositoryProvider);
      note.title = title ?? note.title;
      note.subTitle = subTitle ?? note.subTitle;
      await repo.updateNote(note);
      return repo.getNotes();
    });
  }
}

final notesProvider =
AsyncNotifierProvider<NotesNotifier, List<NoteModel>>(NotesNotifier.new);