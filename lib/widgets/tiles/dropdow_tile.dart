import 'package:expensive_tracker_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class DropDownButtonTile extends StatefulWidget {
  final Category selectedCategory;
  final void Function(Category?)? onDropDownPressed;

  const DropDownButtonTile({
    super.key,
    required this.selectedCategory,
    this.onDropDownPressed,
  });

  @override
  State<DropDownButtonTile> createState() =>
      _DropDownButtonTileState();
}

class _DropDownButtonTileState
    extends State<DropDownButtonTile> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: widget.selectedCategory,
        items: Category.values
            .map(
              (category) => DropdownMenuItem(
                value: category,
                child: Text(category.name.toUpperCase()),
              ),
            )
            .toList(),
        onChanged: widget.onDropDownPressed

        //  (value) {
        //   if (value == null) {
        //     return;
        //   }
        //   setState(() {
        //     _selectedCategory = value;
        //   });
        // },
        );
  }
}
