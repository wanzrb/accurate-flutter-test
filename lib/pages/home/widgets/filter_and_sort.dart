import 'package:accurate_test/bloc/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterAndSort extends StatelessWidget {
  const FilterAndSort({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReversedCubit reversedCubit = context.read<ReversedCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.filter_alt_rounded),
            const SizedBox(
              width: 5,
            ),
            DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: 'Semua',
                  child: Text('Semua Kota'),
                ),
              ],
              value: 'Semua',
              onChanged: (value) {},
            )
          ],
        ),
        IconButton(
            onPressed: () => reversedCubit.isReversed(),
            icon: const Icon(Icons.swap_vert))
      ],
    );
  }
}
