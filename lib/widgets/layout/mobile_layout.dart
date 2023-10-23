import 'package:expensive_tracker_app/models/expense_model.dart';
import 'package:expensive_tracker_app/widgets/tiles/dropdow_tile.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget { 
  final void Function(Category?)? onDropDownPressed;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final DateTime? selectedDate;
  final Category selectedCategory = Category.leisure;

  final void Function() onDateTimePickerPressed,
      submitExpenseData;

  MobileLayout({
    super.key,
    this.selectedDate,
    required this.onDateTimePickerPressed,
    required this.submitExpenseData, 
    required this.onDropDownPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          maxLength: 50,
          decoration: const InputDecoration(
            label: Text('Title'),
          ),
        ),
        Row(
          children: [
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
            const SizedBox(width: 16),
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
        const SizedBox(height: 16),
        Row(
          children: <Widget>[
            // !: DropDownButton
            DropDownButtonTile(
              selectedCategory: selectedCategory,
              onDropDownPressed: onDropDownPressed,
            ),

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
