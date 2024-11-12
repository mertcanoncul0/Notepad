import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/core/constants.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.isInGrid,
    super.key,
  });

  final bool isInGrid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          border: Border.all(
            color: primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(0.5),
              offset: const Offset(4, 4),
            )
          ]),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "This is a note title be opening",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: gray900,
            ),
          ),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                4,
                (index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: gray100,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 3,
                  ),
                  margin: const EdgeInsets.only(
                    right: 4,
                  ),
                  child: const Text(
                    "First Chip",
                    style: TextStyle(
                      fontSize: 12,
                      color: gray700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (isInGrid)
            const Expanded(
              child: Text(
                "This is a note content",
                maxLines: 3,
                style: TextStyle(
                  color: gray700,
                ),
              ),
            )
          else
            const Text(
              "This is a note content",
              maxLines: 3,
              style: TextStyle(
                color: gray700,
              ),
            ),
          const Row(
            children: [
              Text(
                "02 Nov 2024",
                style: TextStyle(
                  fontSize: 12,
                  color: gray500,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              FaIcon(
                FontAwesomeIcons.trash,
                semanticLabel: "delete note",
                color: gray500,
                size: 16,
              )
            ],
          )
        ],
      ),
    );
  }
}
