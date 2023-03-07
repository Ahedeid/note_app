


import 'package:flutter/widgets.dart';
import 'package:note_app/model/note_model.dart';

class NoteService extends ChangeNotifier{

   final List<NoteDescription> _note =  <NoteDescription>[];

   List<NoteDescription> get getNote {
     return _note ;
   }

   void addNote (String noteDescription){
     NoteDescription note = NoteDescription(noteDescription);
     _note.add(note);
     notifyListeners();
   }

}