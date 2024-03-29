import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mov_tix/bloc/blocs.dart';
import 'package:mov_tix/services/services.dart';
import 'package:flutter/material.dart';
import 'package:mov_tix/ui/pages/pages.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => ThemeBloc()),
          BlocProvider(create: (_) => MovieBloc()..add(FetchMovie())),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) => MaterialApp(
            theme: themeState.themeData,
            debugShowCheckedModeBanner: false,
            home: Wrapper()
          ),
        ),
      ),
    );
  }
}