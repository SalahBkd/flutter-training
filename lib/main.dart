import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbkd/bloc/counter.bloc.dart';
import 'package:flutterbkd/widgets/counter.cubit.page.dart';

import 'bloc/counter.cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit(0),),
        BlocProvider(create: (context) => CounterBloc(0),)
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => CounterCubitPage()
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

