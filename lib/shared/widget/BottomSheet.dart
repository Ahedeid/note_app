import 'package:flutter/material.dart';
import 'package:note_app/provider/note_service.dart';
import 'package:note_app/utils/colors_manger.dart';
import 'package:note_app/utils/images_constant.dart';
import 'package:note_app/utils/sizes_in_app.dart';
import 'package:provider/provider.dart';
import 'my_button.dart';
import 'my_textFeild.dart';

class ContentOfBottomSheet extends StatefulWidget {
  const ContentOfBottomSheet({
    Key? key,
    required this.isEdit,
    this.noteText = '',
    this.index = 0,
  }) : super(key: key);
  final bool isEdit;

  final String noteText;
  final int index;

  @override
  State<ContentOfBottomSheet> createState() => _ContentOfBottomSheetState();
}

class _ContentOfBottomSheetState extends State<ContentOfBottomSheet> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.noteText;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context).size;
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.isEdit ? 'Edit Note' : ' Add Note',
                    style: const TextStyle(
                      fontSize: AppSizes.sizeTextEmptyNote,
                      color: Color(AppColor.grayColor),
                    ),
                  ),
                  const Text(''),
                ],
              ),
              const SizedBox(height: 15),
              MyTextField(
                controller: controller,
                hintText: widget.isEdit ? 'Edit Note' : ' Add Note',
                obscureText: false,
                keyboardType: TextInputType.text,
                icon: '',
                vertical: 200,
                height: 200,
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text(
                    '58/100',
                    style: TextStyle(color: Color(AppColor.grayColor)),
                  ),
                ],
              ),
              SizedBox(height: midea.height * 0.023),
              CustomButton(
                title: 'Save',
                onPressed: () {
                  widget.isEdit
                      ? Provider.of<NoteService>(context, listen: false)
                          .editNote(controller.text, widget.index)
                      : Provider.of<NoteService>(context, listen: false)
                          .addNote(controller.text);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
