import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyro_counter/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:tyro_counter/features/counter/presentation/bloc/counter_event.dart';
import 'package:tyro_counter/features/counter/presentation/bloc/counter_state.dart';
import 'package:tyro_counter/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:tyro_counter/features/theme/presentation/bloc/theme_event.dart';
import 'package:tyro_counter/features/theme/presentation/bloc/theme_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter"),
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state){
                return Switch(
                    value: state.isDark,
                    onChanged: (_) {
                      context.read<ThemeBloc>().add(ThemeToggled());
                    }
                );
              }
          )
        ],
      ),
      body: _CounterView(),
    );
  }
}

class _CounterView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: CounterContent() ,
    );
  }
}

class CounterContent extends StatelessWidget{
  const CounterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state){
            return Column(
              children: [
                Text(state.value.toString(), style: const TextStyle(fontSize: 48)),

                SizedBox(height: 48,),

                if(state.status == CounterStatus.error)...[
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Max value reached',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: (){
                        context
                            .read<CounterBloc>()
                            .add(CounterDecremented());
                      },
                      child: Icon(Icons.remove),
                    ),
                    ElevatedButton(
                      onPressed: (){
                          context
                              .read<CounterBloc>()
                              .add(CounterIncremented());
                      },
                      child: Icon(Icons.add),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                      ),
                      onPressed: (){
                        context
                            .read<CounterBloc>()
                            .add(CounterReset());
                      },
                      child: Icon(Icons.refresh),
                    ),
                  ],
                )

              ],
            );
          }
      ),
    );
  }
}