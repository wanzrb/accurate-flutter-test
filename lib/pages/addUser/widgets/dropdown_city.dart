import 'package:accurate_test/const/color.dart';
import 'package:accurate_test/pages/addUser/bloc/add_user_bloc.dart';
import 'package:accurate_test/pages/addUser/cubit/add_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DropDownCity extends StatelessWidget {
  const DropDownCity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddUserBloc addUserBloc = context.read<AddUserBloc>();
    AddUserCubit addUserCubit = context.read<AddUserCubit>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<AddUserBloc, AddUserState>(
          bloc: addUserBloc,
          builder: (context, state) {
            print('ini state dropdown $state');
            if (state is AddUserStateGetCityLoading) {
              return Card(
                child: Center(
                  child: LoadingAnimationWidget.waveDots(
                      color: ColorApp.darkBlue, size: 30),
                ),
              );
            }

            if (state is AddUserStateGetCitySuccess) {
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

            if (state is AddUserStateGetCityError) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(state.error),
                  ),
                ),
              );
            }
            return const Text('default');
          },
        ),
      ),
    );
  }
}
