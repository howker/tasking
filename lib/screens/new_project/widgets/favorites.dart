import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CustomIcon(
        height: 28,
        width: 28,
        color: AppColors.kColBase2,
        customIcon: AppIcons.kIconPinIt,
      ),
      title: Text(AppLocalizations.of(context)!.favorites),
      trailing: CustomIcon(
        height: 24,
        width: 24,
        customIcon: isSelected
            ? AppIcons.kIconCheckboxCircle
            : AppIcons.kIconCheckCircleEmpty,
        color: isSelected ? AppColors.kColAccentNormal : AppColors.kColBase1,
      ),
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
    );
  }
}
