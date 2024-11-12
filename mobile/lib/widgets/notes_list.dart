import 'package:flutter/material.dart';
import 'package:mobile/widgets/note_card.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      itemBuilder: (context, int index) {
        return const NoteCard(
          isInGrid: false,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
