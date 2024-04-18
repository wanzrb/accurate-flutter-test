import 'package:accurate_test/bloc/cubit.dart';
import 'package:accurate_test/bloc/get_city/get_city_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterAndSort extends StatelessWidget {
  const FilterAndSort({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReversedCubit reversedCubit = context.read<ReversedCubit>();
    FilterCityCubit filterCityCubit = context.read<FilterCityCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.filter_alt_rounded),
            const SizedBox(
              width: 5,
            ),
            BlocBuilder<GetCityBloc, GetCityState>(
              builder: (context, state) {
                if (state is GetCityStateLoaded) {
                  final data = state.city;

                  return BlocBuilder<FilterCityCubit, String>(
                    builder: (context, state) {
                      return DropdownButton(
                        items: [
                          const DropdownMenuItem(
                            value: 'Semua',
                            child: Text('Semua Kota'),
                          ),
                          ...data
                              .map((e) => DropdownMenuItem(
                                  value: e.name, child: Text('${e.name}')))
                              .toList()
                        ],
                        value: state,
                        onChanged: (value) =>
                            filterCityCubit.filterSelected(value!),
                      );
                    },
                  );
                }

                return const SizedBox();
              },
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
