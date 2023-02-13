import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:twowayscroll/model/category_model.dart';
import 'package:twowayscroll/model/category_response.dart';

class JsonApi {
  ///Reads JSON file
  /// deserialize the response
  ///and returns the List of type [CategoryModel]

  Future<List<CategoryModel>> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/data.json');
    var decodedData = json.decode(jsonText);

    CategoryResponseModel categoryList =
        CategoryResponseModel.fromMap(decodedData);
    return categoryList.listOfCategory;
  }
}
