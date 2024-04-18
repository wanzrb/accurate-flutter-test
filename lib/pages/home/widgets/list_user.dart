import 'package:accurate_test/pages/home/bloc/home_bloc.dart';
import 'package:accurate_test/pages/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListUser extends StatelessWidget {
  const ListUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = context.read<HomeBloc>();

    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          if (state is HomeStateGetLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeStateGetSuccess) {
            final data = state.users;

            return BlocBuilder<ReversedCubit, bool>(
              builder: (context, state) {
                data.sort((a, b) => state
                    ? b.name!.toLowerCase().compareTo(a.name!.toLowerCase())
                    : a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text('${data[index].name}'),
                      subtitle: Text('${data[index].city}'),
                    ),
                  ),
                );
              },
            );
          }

          if (state is HomeStateGetError) {
            return Text(state.error);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
