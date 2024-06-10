import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import '../../domain/models/avatar.dart';
import '../../domain/models/category.dart';
import '../../domain/models/document.dart';
import '../../domain/models/languages.dart';
import '../../domain/models/professions.dart';
import '../../domain/models/sub_category.dart';
import '../../domain/models/video_model.dart';
import '../../presintation/request_expert/widgets/pick_file_bottom_sheet.dart';

showPickFileBottomSheet(
  BuildContext context, {
  void Function()? pickImage,
  void Function()? takeImage,
  void Function()? pickFile,
}) =>
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => PickFileBottomSheet(
              pickFile: pickFile,
              takeImage: takeImage,
              pickImage: pickImage,
            ));
String formateUrl(String url) => "http://shawir.app/$url";
dynamic getStorage<A>(Map<String, dynamic>? json) {
  if (json != null) {
    if (A == ExpertAvatar) {
      return ExpertAvatar.fromJson(json);
    } else if (A == Category) {
      return Category.fromJson(json);
    } else if (A == Document) {
      return Document.fromJson(json);
    } else if (A == SubCategory) {
      return SubCategory.fromJson(json);
    } else if (A == VideoModel) {
      return VideoModel.fromJson(json);
    } else if (A == Country) {
      return Country.from(json: json);
    } else if (A == Languages) {
      return Languages.fromJson(json);
    } else if (A == Professions) {
      return Professions.fromJson(json);
    } else {
      return null;
    }
  }
  return null;
}

showCategoryBottomsheet(
  BuildContext context, {
  required List items,
  required Widget? Function(BuildContext, int) itemBuilder,
}) =>
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: itemBuilder,
            separatorBuilder: (context, index) => SizedBox(),
            itemCount: items.length),
      ),
    );
