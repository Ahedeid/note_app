import 'package:flutter/widgets.dart';
import 'package:note_app/model/note_model.dart';

class NoteService extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  final List<NoteDescription> _note = <NoteDescription>[];
  final List<NoteDescription> _favorites = [];

  List<NoteDescription> get getNote {
    //   if(_note.isEmpty){
    //     setLoading(true);
    //   }else {
    //     setLoading(false);
    //   }
    return _note;
  }

  List<NoteDescription> get getFavorites => _favorites;

  void addNote(String noteDescription) {
    setLoading(true);
    NoteDescription note = NoteDescription(noteDescription);
    _note.add(note);
    setLoading(false);
  }

  void editNote(String noteDescription, int index) {
    setLoading(true);
    _note[index].note = noteDescription;
    setLoading(false);
  }

  void removeItem(int index) {
    setLoading(true);
    _note.removeAt(index);
    setLoading(false);
  }

  void toggleFavorite(NoteDescription item) {
    item.isFavorite = !item.isFavorite;

    if (item.isFavorite) {
      _favorites.add(item);
    } else {
      _favorites.remove(item);
    }
    debugPrint(_favorites.toString());
    notifyListeners();
  }

  void removeItemFav(int index) {
    _favorites.removeAt(index);
    notifyListeners();
  }
}
