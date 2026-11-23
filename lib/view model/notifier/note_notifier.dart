import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/note_model.dart';
import '../../models/notes_provider.dart';


class NotesNotifier extends AsyncNotifier<List<NoteModel>> {
  @override
  Future<List<NoteModel>> build() async {
    return ref.watch(notesRepositoryProvider).getNotes();
  }
}

final notesProvider =
AsyncNotifierProvider<NotesNotifier, List<NoteModel>>(NotesNotifier.new);