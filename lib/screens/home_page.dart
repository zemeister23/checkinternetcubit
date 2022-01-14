import 'package:checkinternet/screens/home_cubit/myhomepage_cubit.dart';
import 'package:checkinternet/screens/new_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyhomepageCubit(MyhomepageInitial()),
      child: BlocConsumer<MyhomepageCubit, MyhomepageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MyhomepageInitial) {
            return buildScaffold(context);
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text("NO INTERNET"),
              ),
            );
          }
        },
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.next_plan),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NewPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: 150,
          child: LiquidLinearProgressIndicator(
            backgroundColor: Colors.cyan,
            center: Text("35 %"),
            direction: Axis.vertical,
            borderWidth: 1.0,
            borderRadius: 12.0,
            borderColor: Colors.black,
            value: 0.35,
            valueColor: const AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ),
    );
  }
}
