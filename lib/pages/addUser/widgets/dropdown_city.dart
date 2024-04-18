import 'package:accurate_test/bloc/cubit.dart';
import 'package:accurate_test/bloc/get_city/get_city_bloc.dart';
import 'package:accurate_test/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DropDownCity extends StatelessWidget {
  const DropDownCity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddUserCubit addUserCubit = context.read<AddUserCubit>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<GetCityBloc, GetCityState>(
          builder: (context, state) {
            if (state is GetCityStateLoading) {
              return Card(
                child: Center(
                  child: LoadingAnimationWidget.waveDots(
                      color: ColorApp.darkBlue, size: 30),
                ),
              );
            }

            if (state is GetCityStateLoaded) {
              final data = state.city;

              return BlocBuilder<AddUserCubit, String>(
                builder: (context, state) {
                  return DropdownButton(
                    underline: const SizedBox(),
                    isExpanded: true,
                    value: state,
                    items: data
                        .map((e) => DropdownMenuItem(
                            value: e.name, child: Text('${e.name}')))
                        .toList(),
                    onChanged: (value) {
                      addUserCubit.selectedCity(value!);
                    },
                  );
                },
              );
            }

            if (state is GetCityStateError) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(state.error),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
