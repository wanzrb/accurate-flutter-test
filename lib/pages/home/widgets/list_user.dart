import 'package:accurate_test/bloc/cubit.dart';
import 'package:accurate_test/bloc/get_user/get_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListUser extends StatelessWidget {
  const ListUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetUserBloc, GetUserState>(
        builder: (context, state) {
          if (state is GetUserStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetUserStateLoaded) {
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

          if (state is GetUserStateError) {
            return Text(state.error);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
