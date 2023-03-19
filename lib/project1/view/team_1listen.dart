import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team1_team2_project_bloc/project1/cubit/counter_state.dart';

import '../cubit/counter_cubit.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Screen1()),
    );
  }
}

class Screen1 extends StatelessWidget {
  int teamA = 0;
  int teamB = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text(
              "Points Count",
              style: TextStyle(fontSize: 20),
            ),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Team A",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Text(
                          "$teamA ",
                          style: const TextStyle(
                              fontSize: 120, fontWeight: FontWeight.w400),
                        ),
                        MaterialButton(
                          color: Colors.orange,
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'A', buttonNumber: 1);
                          },
                          child: const Text("Add 1 pount"),
                        ),
                        MaterialButton(
                          color: Colors.orange,
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'B', buttonNumber: 2);
                          },
                          child: const Text("Add 2 pount"),
                        ),
                        MaterialButton(
                          color: Colors.orange,
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'B', buttonNumber: 3);
                          },
                          child: const Text("Add 3 pount"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      height: 300,
                      child: VerticalDivider(
                        color: Colors.black12,
                        thickness: 2,
                      )),
                  SizedBox(
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Team B",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Text(
                          "$teamB ",
                          style: const TextStyle(
                              fontSize: 120, fontWeight: FontWeight.w400),
                        ),
                        MaterialButton(
                          color: Colors.orange,
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'B', buttonNumber: 1);
                          },
                          child: const Text("Add 1 pount"),
                        ),
                        MaterialButton(
                          color: Colors.orange,
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'B', buttonNumber: 2);
                          },
                          child: const Text("Add 2 pount"),
                        ),
                        MaterialButton(
                          color: Colors.orange,
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'B', buttonNumber: 3);
                          },
                          child: const Text("Add 3 pount"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              MaterialButton(
                color: Colors.orange,
                onPressed: () {},
                child: const Text("Restart"),
              ),
            ],
          ));
    }, listener: (context, state) {
      if (state is CounterAIncrementState) {
        teamA = BlocProvider.of<CounterCubit>(context).teamAPoint;
      } else {
             teamB = BlocProvider.of<CounterCubit>(context).teamBPoint;
      }
    });
  }
}
