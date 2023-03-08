import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/provider/note_service.dart';
import 'package:note_app/screens/widget/my_textFeild.dart';
import 'package:note_app/screens/widget/sheared_appbar.dart';
import 'package:note_app/utils/colors_manger.dart';
import 'package:note_app/utils/images_constant.dart';
import 'package:note_app/utils/sizes_in_app.dart';
import 'package:provider/provider.dart';

import '../utils/strings_in_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //  var midea = MediaQuery.of(context).size;
    bool isLoading = true;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const ShearedAppBar(),
      body: isLoading == true
          ? Consumer<NoteService>(
              builder: (context, note, child) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '25, Sep, 2022 - 08:20 pm',
                        style: TextStyle(
                          color: Color(AppColor.grayColor),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                            itemCount: note.getNote.length,
                            itemBuilder: (context, index) {
                              final itemsKey = note.getNote[index].toString();
                              final items = note.getNote[index];
                              return NoteCard(
                                item: itemsKey,
                                noteShow: items,
                                onDismissed: (direction) {
                                  note.removeItem(index);
                                  note.removeItemFav(index);
                                },
                                onTapFav: () {
                                  note.toggleFavorite(items);
                                  debugPrint('ok');
                                },
                                isFav: items.isFavorite,
                              );
                            }),
                      ),
                    ],
                  ),
                );
              },
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingHorizontal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageConstant.emptyImage),
                  const SizedBox(height: 5),
                  const Text(
                    AppStrings.emptyText,
                    style: TextStyle(
                        fontSize: AppSizes.sizeTextEmptyNote,
                        color: Color(AppColor.primaryTextColor)),
                  ),
                ],
              ),
            ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: MyFloating(),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  NoteCard({
    super.key,
    required this.item,
    required this.noteShow,
    this.onDismissed,
    this.onTapFav,
    this.isFav,
  });

  final NoteDescription noteShow;

  void Function(DismissDirection)? onDismissed;
  final String item;
  void Function()? onTapFav;
  bool? isFav;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm'),
              content: const Text('Are you sure you wish to delete this item?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('CANCEL'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('DELETE'),
                ),
              ],
            );
          },
        );
      },
      key: Key(item),
      background: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(color: Colors.red),
        child: const Icon(Icons.delete),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(AppColor.linearGradientColorB),
                Color(AppColor.linearGradientColorA)
              ],
            ),
          ),
          child: Center(
            child: ListTile(
              trailing: InkWell(
                onTap: onTapFav,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(AppColor.backGroundSearchIconColor),
                  ),
                  child: Icon(
                    isFav == true ? Icons.favorite : Icons.favorite_border,
                    color: const Color(AppColor.tealColor),
                  ),
                ),
              ),
              title: Text(
                noteShow.note,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyFloating extends StatelessWidget {
  const MyFloating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String descriptionText = '';
    var midea = MediaQuery.of(context).size;
    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        backgroundColor: const Color(AppColor.floatingColor),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            backgroundColor: const Color(AppColor.backGroundBottomSheet),
            context: context,
            isScrollControlled: true,
            builder: (context) => SizedBox(
              height: midea.height * 0.55,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(' Add Note',
                            style: TextStyle(
                                fontSize: AppSizes.sizeTextEmptyNote,
                                color: Color(AppColor.grayColor))),
                        Text(''),
                      ],
                    ),
                    const SizedBox(height: 15),
                    MyTextField(
                      onChange: (val) {
                        descriptionText = val;
                      },
                      hintText: ' Add Note',
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      icon: '',
                      vertical: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(''),
                        Text(
                          '58/100',
                          style: TextStyle(color: Color(AppColor.grayColor)),
                        ),
                      ],
                    ),
                    SizedBox(height: midea.height * 0.023),
                    // MyButton(routeName: '', title: 'Save'),
                    Container(
                      width: 325,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(AppColor.linearGradientColorB),
                                Color(AppColor.linearGradientColorA),
                              ])),
                      child: ElevatedButton(
                        onPressed: () {
                          Provider.of<NoteService>(context, listen: false)
                              .addNote(descriptionText);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: AppSizes.sizeTextMedium,
                            color: Color(AppColor.primaryTextColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
