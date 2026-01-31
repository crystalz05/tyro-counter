import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyro_counter/features/simple_auth/presentation/bloc/simple_bloc.dart';
import 'package:tyro_counter/features/simple_auth/presentation/bloc/simple_event.dart';
import 'package:tyro_counter/features/simple_auth/presentation/bloc/simple_state.dart';

class UsernameScreen extends StatelessWidget {
  const UsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Username Test page"),
      ) ,
      body: _FormView(),
    );
  }
}


class _FormView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> SimpleBloc()),
        BlocProvider(create: (_)=> ButtonToggleBloc())
      ],
        child: _FormContent()
    );
  }
}

class _FormContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 50),
      child: Column(
          children:[
            BlocBuilder<SimpleBloc, SimpleState>(
                builder: (context, state){
                  return TextFormField(
                    onChanged: (value){
                      context.read<SimpleBloc>().add(UserNameChanged(value));
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        errorText: state.status == UsernameStatus.invalid ? state.errorMessage : null,
                        labelText: "Username"
                    ),
                  );
                }
            ),

            SizedBox(height: 24),

            BlocBuilder<ButtonToggleBloc, ButtonToggleState>(
                builder: (context, state){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: state.isActive ? () {} : null,
                          child: Text("Active"),
                      ),
                      Switch(
                          value: state.isActive,
                          onChanged: (_) {context.read<ButtonToggleBloc>().add(ButtonActiveEvent(!state.isActive));
                          }
                      )
                    ],
                  );
                }
            )
          ]
      ),
    );
  }
}