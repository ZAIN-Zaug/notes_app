
import 'note_model.dart';

import 'notes_exception.dart';
import 'notes_service.dart';

class NotesRepository {
  NotesRepository(this._service);
  final  NotesService _service;

  List<NoteModel> getNotes() {
    try {
      return _service.readAll();
    } catch (e) {
      throw NotesException('Could not load the notes');
    }
  }

  Future<void> addNote(NoteModel note) async {
    try {
      await _service.add(note);
    } catch (e) {
      throw NotesException('Could not add the note');
    }
  }

  Future<void> updateNote(NoteModel note) async {
    try {
      await _service.save(note);
    } catch (e) {
      throw NotesException('Could not update the note');
    }
  }

  Future<void> deleteNote(NoteModel note) async {
    try {
      await _service.remove(note);
    } catch (e) {
      throw NotesException('Could not delete the note');
    }
  }
}