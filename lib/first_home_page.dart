import 'package:flutter/material.dart';
import 'package:tinder_app/round_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation cardAnimation,
      delayedAnimation,
      fabButtonAnimation,
      infoAnimation;

  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 0.0, end: -0.05).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.fastOutSlowIn,
        )));

    fabButtonAnimation = Tween(begin: 0.0, end: -0.05).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.8,
          -0.0008,
          curve: Curves.fastOutSlowIn,
        )));

    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.8,
          -0.0008,
          curve: Curves.fastOutSlowIn,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Center(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.person,
          size: 40,
          color: Colors.grey,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chat_bubble,
            size: 40,
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  _buildCardStack() {}

  Widget _buildBottomBar() {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundButton.small(
              icon: Icons.refresh,
              color: Colors.orange,
              onPressed: () {},
            ),
            RoundButton.large(
              icon: Icons.clear,
              color: Colors.red,
              onPressed: () {},
            ),
            RoundButton.small(
              icon: Icons.star,
              color: Colors.blue,
              onPressed: () {},
            ),
            RoundButton.large(
              icon: Icons.favorite,
              color: Colors.green,
              onPressed: () {},
            ),
            RoundButton.small(
              icon: Icons.lock,
              color: Colors.purple,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
