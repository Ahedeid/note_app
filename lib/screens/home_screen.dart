import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/provider/note_service.dart';
import 'package:note_app/screens/widget/BottomSheet.dart';
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
    DateTime today = DateTime.now();
    String dateStr = "${today.day}-${today.month}-${today.year} -/ ${today.hour}.${today.second}";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const ShearedAppBar(),
      body: context.watch<NoteService>().getNote.isEmpty
          ? Padding(
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
                color: Color(AppColor.primaryTextColor),
              ),
            ),
          ],
        ),
      ) : Consumer<NoteService>(
      builder: (context, note, child) {
        return Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dateStr,
                style: const TextStyle(
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
                        index: index,
                        noteText: items.note,
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
    required this.noteText ,
     this.index =0
  });

  final NoteDescription noteShow;
String noteText ;
  void Function(DismissDirection)? onDismissed;
  final String item;
  void Function()? onTapFav;
  bool? isFav;
  int index ;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      confirmDismiss: (DismissDirection direction) async {
        if(direction == DismissDirection.endToStart) {
          return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: const Color(AppColor.backGroundBottomSheet),
              title: const Text(
                'Confirm',
                style: TextStyle(
                  color: Color(AppColor.tealColor),
                ),
              ),
              content: const Text(
                'Are you sure you wish to delete this note?',
                style: TextStyle(
                  color: Color(AppColor.primaryTextColor),
                ),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('CANCEL'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(AppColor.tealColor),
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('DELETE'),
                ),
              ],
            );
          },
        );
        }
        else{
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
            builder: (context) => ContentOfBottomSheet(isEdit: true,NoteText: noteText,index : index),
          );
        }
      },
      key: Key(item),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
        ),
        child: const Icon(Icons.edit),),
      secondaryBackground:  Container(
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.red),
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
            builder: (context) => ContentOfBottomSheet(isEdit: false,),
          );
        },
      ),
    );
  }
}



