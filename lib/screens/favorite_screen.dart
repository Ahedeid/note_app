import 'package:flutter/material.dart';
import 'package:note_app/provider/note_service.dart';
import 'package:note_app/shared/widget/sheared_appbar.dart';
import 'package:note_app/utils/colors_manger.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ShearedAppBar(
          title: 'Favorite',
          showIcon: false,
        ),
        body: Consumer<NoteService>(builder: (context, favNote, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                      itemCount: favNote.getFavorites.length,
                      itemBuilder: (context, index) {
                        final itemsKey = favNote.getFavorites[index].toString();
                        final items = favNote.getFavorites[index];
                        return NoteCard(
                          noteText: items.note,
                          isFav: items.isFavorite,
                          item: itemsKey,
                          noteShow: items,
                          onDismissed: (direction) {
                            favNote.removeItemFav(index);
                            favNote.removeItem(index);
                          },
                          onTapFav: () {
                            favNote.toggleFavorite(items);
                          },
                        );
                      }),
                ),
              ],
            ),
          );
        }));
  }
}
