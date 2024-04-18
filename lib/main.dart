import 'package:accurate_test/bloc/add_user/add_user_bloc.dart';
import 'package:accurate_test/bloc/cubit.dart';
import 'package:accurate_test/bloc/get_city/get_city_bloc.dart';
import 'package:accurate_test/bloc/get_user/get_user_bloc.dart';
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
            create: (context) => GetUserBloc()..add(GetUserEventLoad()),
          ),
          BlocProvider(
            create: (context) => ReversedCubit(),
          ),
          BlocProvider(
            create: (context) => GetCityBloc()..add(GetCityEventLoad()),
          ),
          BlocProvider(create: (context) => AddUserBloc()),
          BlocProvider(
            create: (context) => AddUserCubit(),
          ),
          BlocProvider(
            create: (context) => FilterCityCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(),
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
        ));
  }
}
