import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/home/cubit/home_cubit.dart';
import 'presentation/resources/strings_manager.dart';
import 'presentation/resources/theme_manager.dart';
import 'presentation/resources/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getTokens()),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            title: StringsManager.appName,
            theme: getApplicationTheme(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: Routes.guideRoute,
          );
        },
      ),
    );
  }
}
