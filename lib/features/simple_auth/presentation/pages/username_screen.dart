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
    return BlocProvider(
        create: (_)=> SimpleBloc(),
        child: _FormContent()
    );
  }
}

class _FormContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
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
            )
          ]
      ),
    );
  }
}