import 'dart:convert';

import 'package:twowayscroll/model/category_model.dart';

class CategoryResponseModel {
  List<CategoryModel> listOfCategory;
  CategoryResponseModel({
    required this.listOfCategory,
  });

  factory CategoryResponseModel.fromMap(Map<String, dynamic> map) {
    return CategoryResponseModel(
      listOfCategory: List<CategoryModel>.from(
        (map['data'] as List).map<CategoryModel>(
          (x) => CategoryModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory CategoryResponseModel.fromJson(String source) =>
      CategoryResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
