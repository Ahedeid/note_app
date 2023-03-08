


import 'package:flutter/widgets.dart';
import 'package:note_app/model/note_model.dart';

class NoteService extends ChangeNotifier{

   final List<NoteDescription> _note =  <NoteDescription>[];
   final List<NoteDescription> _favorites = [];

   List<NoteDescription> get getNote {
     return _note ;
   }
   List<NoteDescription> get getFavorites => _favorites;

   void addNote (String noteDescription){
     NoteDescription note = NoteDescription(noteDescription);
     _note.add(note);
     notifyListeners();
   }

   void removeItem(int index) {
     _note.removeAt(index);
     notifyListeners();
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