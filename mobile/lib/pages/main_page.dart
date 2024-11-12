import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/core/constants.dart';
import 'package:mobile/widgets/note_fab.dart';
import 'package:mobile/widgets/notes_grid.dart';
import 'package:mobile/widgets/notes_list.dart';
import 'package:mobile/widgets/search_field.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> dropdownOptions = ["Date modified", "Date created"];

  late String dropdownValue = dropdownOptions.first;

  bool isDescending = true;
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awesome Notes 📒"),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
            style: IconButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: black),
                )),
          )
        ],
      ),
      floatingActionButton: const NoteFab(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SearchField(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => {
                      setState(() {
                        isDescending = !isDescending;
                      })
                    },
                    icon: FaIcon(
                      isDescending
                          ? FontAwesomeIcons.arrowDown
                          : FontAwesomeIcons.arrowUp,
                    ),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: const BoxConstraints(),
                    style: IconButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    iconSize: 18,
                    color: gray700,
                  ),
                  const SizedBox(width: 16),
                  DropdownButton(
                      value: dropdownValue,
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: FaIcon(
                          FontAwesomeIcons.arrowDownWideShort,
                          size: 18,
                          color: gray700,
                        ),
                      ),
                      underline: const SizedBox.shrink(),
                      borderRadius: BorderRadius.circular(16),
                      isDense: true,
                      items: dropdownOptions
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    Text(e),
                                    if (e == dropdownValue) ...[
                                      const SizedBox(width: 6),
                                      const Icon(Icons.check)
                                    ]
                                  ],
                                ),
                              ))
                          .toList(),
                      selectedItemBuilder: (context) =>
                          dropdownOptions.map((e) => Text(e)).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue.toString();
                        });
                      }),
                  const Spacer(),
                  IconButton(
                    onPressed: () => {
                      setState(() {
                        isGridView = !isGridView;
                      })
                    },
                    icon: FaIcon(
                      isGridView
                          ? FontAwesomeIcons.tableCells
                          : FontAwesomeIcons.bars,
                    ),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: const BoxConstraints(),
                    style: IconButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    iconSize: 18,
                    color: gray700,
                  )
                ],
              ),
            ),
            Expanded(
              child: isGridView ? const NotesGrid() : const NotesList(),
            )
          ],
        ),
      ),
    );
  }
}
