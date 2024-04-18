import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: const Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(Icons.search_rounded),
              SizedBox(
                width: 10,
              ),
              Text(
                'Cari berdasarkan nama',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
