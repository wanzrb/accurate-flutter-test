import 'package:accurate_test/const/color.dart';
import 'package:accurate_test/const/image.dart';
import 'package:accurate_test/pages/home/widgets/filter_and_sort.dart';
import 'package:accurate_test/pages/home/widgets/list_user.dart';
import 'package:accurate_test/pages/home/widgets/search_field.dart';
import 'package:accurate_test/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.lightBlue1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.lightBlue1,
        title: SizedBox(height: 30, child: Image.asset(ImageApp.logo)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [SearchField(), const FilterAndSort(), const ListUser()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => context.goNamed(RouterName.addUser)),
    );
  }
}
