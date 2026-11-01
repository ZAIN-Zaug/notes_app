import 'package:hive_flutter/hive_flutter.dart';
import '../constants.dart';
import 'note_model.dart';

class NotesService {
  Box<NoteModel> get _box => Hive.box<NoteModel>(kNoteBox);

  List<NoteModel> readAll() => _box.values.toList();
  Future<void> add(NoteModel note) => _box.add(note);
  Future<void> save(NoteModel note) => note.save();
  Future<void> remove(NoteModel note) => note.delete();
}