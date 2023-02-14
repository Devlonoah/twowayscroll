import 'package:flutter/material.dart';
import 'package:twowayscroll/api/json_api.dart';
import 'package:twowayscroll/model/category_model.dart';

class WithoutStack extends StatefulWidget {
  const WithoutStack({super.key});

  @override
  State<WithoutStack> createState() => _WithoutStackState();
}

class _WithoutStackState extends State<WithoutStack> {
  List<CategoryModel>? listOfCategory;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  JsonApi jsonApi = JsonApi();

  ///load data from json file
  void loadData() async {
    var result = await jsonApi.loadJsonData();

    setState(() {
      listOfCategory = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    //parent or first widget pageview [handling vertical Scroll]
    return Scaffold(
      appBar: AppBar(
        title: Text("Twowayscroll"),
      ),
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listOfCategory?.length,
          pageSnapping: true,
          onPageChanged: (value) {},
          itemBuilder: (context, index) {
            var category = listOfCategory?[index];

            //child or second widget pageview [handling vertical Scroll]
            return PageView(
                onPageChanged: (value) {
                  print(value);
                },
                // physics: const NeverScrollableScrollPhysics(),

                scrollDirection: Axis.horizontal,
                children: (category?.images ?? [])
                    .map((e) => Image.network(
                          e,
                          fit: BoxFit.cover,
                        ))
                    .toList());
          }),
    );
  }
}
