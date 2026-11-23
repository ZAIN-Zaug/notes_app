import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notes_repository.dart';
import 'notes_service.dart';

final notesServiceProvider = Provider<NotesService>((ref) {
  return NotesService();
});

final notesRepositoryProvider = Provider<NotesRepository>((ref) {
  return NotesRepository(ref.watch(notesServiceProvider));
});