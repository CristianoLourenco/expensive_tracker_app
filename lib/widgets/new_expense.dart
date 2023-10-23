import 'dart:io';
import 'package:expensive_tracker_app/widgets/layout/mobile_layout.dart';
import 'package:expensive_tracker_app/widgets/layout/tablet_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expensive_tracker_app/models/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(ExpenseModel) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace =
        MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  16, 48, 16, keyboardSpace + 16),
              child: width >= 600
                  ? TabletLayout(
                      onDateTimePickerPressed:
                          _onDateTimePickerPressed,
                      submitExpenseData: _submitExpenseData,
                      titleController: _titleController,
                      amountController: _amountController,
                      onDropDownPressed: _dropDownPressed,
                      selectedDate: _selectedDate,
                    )
                  : MobileLayout(
                      onDateTimePickerPressed:
                          _onDateTimePickerPressed,
                      submitExpenseData: _submitExpenseData,
                      selectedDate: _selectedDate,
                      onDropDownPressed: _dropDownPressed,
                    ),
            ),
          ),
        );
      },
    );
  }

  // ! Methods
  void _dropDownPressed(dynamic value) {
    (value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedCategory = value;
      });
    };
  }

  void _onDateTimePickerPressed() async {
    // ! dateTimePicker
    final now = DateTime.now();
    final firstDate =
        DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showDialogPlataform() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  void _submitExpenseData() {
    final enteredAmount =
        double.tryParse(_amountController.text);
    final amountIsInvalid =
        enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _showDialogPlataform();
      return;
    }
    final model = ExpenseModel(
      amount: enteredAmount,
      category: _selectedCategory,
      date: _selectedDate!,
      title: _titleController.text,
    );

    widget.onAddExpense(model);
    Navigator.pop(context);
  }
}
