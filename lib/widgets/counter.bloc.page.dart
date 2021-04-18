import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbkd/bloc/counter.bloc.dart';
import 'package:flutterbkd/bloc/counter.cubit.dart';

class CounterBlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit'),
      ),
      body: BlocBuilder<CounterBloc, int>( // this will listen to any changes in the state, if there is one it will re-execute the call back
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$state',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterEvent.INCREMENT);
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 20,),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterEvent.DECREMENT);
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}