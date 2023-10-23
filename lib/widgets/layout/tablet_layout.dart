import 'package:expensive_tracker_app/models/expense_model.dart';
import 'package:expensive_tracker_app/widgets/tiles/dropdow_tile.dart';
import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  final void Function(Category?)? onDropDownPressed;
  final TextEditingController titleController,
      amountController;

  final DateTime? selectedDate;
  final Category selectedCategory = Category.leisure;

  final void Function() onDateTimePickerPressed,
      submitExpenseData;

  const TabletLayout({
    super.key,
    this.onDropDownPressed,
    this.selectedDate,
    required this.onDateTimePickerPressed,
    required this.submitExpenseData,
    required this.titleController,
    required this.amountController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: '\$ ',
                  label: Text('Amount'),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            // !: DropDownButton
            DropDownButtonTile(
              selectedCategory: selectedCategory,
              onDropDownPressed: onDropDownPressed,
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    selectedDate == null
                        ? 'No date selected'
                        : formatter.format(
                            selectedDate!,
                          ),
                  ),
                  IconButton(
                    onPressed: onDateTimePickerPressed,
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: submitExpenseData,
              child: const Text('Save Expense'),
            ),
          ],
        )
      ],
    );
  }
}
