import 'package:checkinternet/screens/home_cubit/myhomepage_cubit.dart';
import 'package:checkinternet/screens/new_cubit/newpage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MyhomepageCubit(
            MyhomepageInitial(),
          ),
        ),
        BlocProvider(
          create: (_) => NewpageCubit(),
        ),
      ],
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
        title: Text("New Page"),
      ),
    );
  }
}
