import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/database.dart';
import '../util/notesDialog_box.dart';
import '../util/notes_tile.dart';


class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final _notesBox = Hive.box('notesBox');
  NotesDataBase db = NotesDataBase();

  @override
  void initState() {
    // if this is the 1st time ever opening the app, then create default data
    if (_notesBox.get("Notes") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _titleController = TextEditingController();
  final _paraController = TextEditingController();

  // save new task
  void saveNewNote() {
    setState(() {
      db.notesList.add([
        _titleController.text,
        _paraController.text,
      ]);
      _titleController.clear();
      _paraController.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }


  // create a new task
  void createNewNote() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          titleController: _titleController,
          paraController: _paraController,
          onSave: saveNewNote,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
  // delete task
  void deleteNote(int index) {
    setState(() {
      db.notesList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text("Journal"),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Journal Entry',
        onPressed: createNewNote,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.notesList.length,
        itemBuilder: (context, index) {
          return NotesTile(
            noteTitle: db.notesList[index][0],
            noteDesc: db.notesList[index][1],
            deleteFunction: (context) => deleteNote(index),
          );
        },
      ),
    );
  }

}