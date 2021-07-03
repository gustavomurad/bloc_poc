import 'package:bloc_poc/main_bloc.dart';
import 'package:bloc_poc/main_event.dart';
import 'package:bloc_poc/main_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Bloc Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(),
      child: CounterPage(caption: widget.title),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({
    Key? key,
    required this.caption,
  }) : super(key: key);

  final String caption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.caption),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<MainBloc, MainState>(
              listener: (_, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.lightGreenAccent,
                    content: Text(
                      'You have pushed the button this many times: ${state.counter}!',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
              builder: (_, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: IconButton(
                    onPressed: () => BlocProvider.of<MainBloc>(context).add(
                      MainIncrementEvent(),
                    ),
                    icon: Icon(
                      Icons.add,
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Flexible(
                  flex: 1,
                  child: IconButton(
                    onPressed: () => BlocProvider.of<MainBloc>(context).add(
                      MainDecrementEvent(),
                    ),
                    icon: Icon(
                      Icons.remove,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
