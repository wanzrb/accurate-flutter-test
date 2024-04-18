import 'package:accurate_test/pages/addUser/bloc/add_user_bloc.dart';
import 'package:accurate_test/pages/addUser/cubit/add_user_cubit.dart';
import 'package:accurate_test/pages/home/bloc/home_bloc.dart';
import 'package:accurate_test/pages/home/cubit/home_cubit.dart';
import 'package:accurate_test/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc()..add(HomeEventGetUser()),
          ),
          BlocProvider(
            create: (context) => ReversedCubit(),
          ),
          BlocProvider(
            create: (context) => AddUserBloc()..add((AddUserEventGetCity())),
          ),
          BlocProvider(
            create: (context) => AddUserCubit(),
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
        ));
  }
}
