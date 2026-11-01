part of 'note_cubit.dart';


sealed class NoteStates {}

final class NoteInitial extends NoteStates {}
final class NoteSuccess extends NoteStates {
 final  List<NoteModel> notes;
  NoteSuccess({required this.notes});
}
final class NoteFailure extends NoteStates {
  final String error;
  NoteFailure(this.error);
}
final class NoteLoading extends NoteStates {}

