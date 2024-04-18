import 'package:accurate_test/bloc/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  SearchField({
    super.key,
  });

  final TextEditingController searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = context.read<SearchCubit>();

    return TextFormField(
      controller: searchC,
      onChanged: (value) => searchCubit.searchUser(value),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          isCollapsed: true,
          isDense: true,
          fillColor: Colors.white,
          filled: true,
          hintText: 'Cari nama user',
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 25,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
              onPressed: () => searchC.text = '',
              icon: const Icon(Icons.close_rounded)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
