import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation cardAnimation,
      delayedCardAnimation,
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

    delayedCardAnimation =
        Tween(begin: 0.0, end: -0.05).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(
              0.5,
              1.0,
              curve: Curves.fastOutSlowIn,
            )));

    fabButtonAnimation =
        Tween(begin: 1.0, end: -0.0008).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(
              0.8,
              1.0,
              curve: Curves.fastOutSlowIn,
            )));

    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.7,
          1.0,
          curve: Curves.fastOutSlowIn,
        )));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return SafeArea(
            child: Scaffold(
              // appBar: _buildAppBar(),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                          left: 20.0,
                          child: Container(
                            transform: Matrix4.translationValues(0.0,
                                delayedCardAnimation.value * deviceHeight, 0.0),
                            width: 260.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        Positioned(
                          left: 10.0,
                          child: Container(
                            transform: Matrix4.translationValues(
                                0.0, cardAnimation.value * deviceHeight, 0.0),
                            width: 280.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            width: 300.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: AssetImage('assets/pic1.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                          top: 320.0,
                          left: 15.0,
                          child: Container(
                            transform: Matrix4.translationValues(
                                0.0, infoAnimation.value * deviceHeight, 0.0),
                            width: 270.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1.0,
                                      color: Colors.black12,
                                      spreadRadius: 2.0)
                                ]),
                            child: Container(
                              padding: EdgeInsets.all(7.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Kayla',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(width: 4.0),
                                      Image.asset(
                                        'assets/pic2.jpeg',
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                      SizedBox(width: 110.0),
                                      Text(
                                        '5.8km',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 9.0),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Fate is wonderful.',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomAppBar(
                color: Colors.transparent,
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    transform: Matrix4.translationValues(
                        0.0, fabButtonAnimation.value * deviceHeight, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0x11000000), blurRadius: 10.0)
                              ]),
                          child: RawMaterialButton(
                            onPressed: () {},
                            shape: CircleBorder(),
                            elevation: 0.0,
                            child: Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0x11000000), blurRadius: 10.0)
                              ]),
                          child: RawMaterialButton(
                            onPressed: () {},
                            shape: CircleBorder(),
                            elevation: 0.0,
                            child: Icon(
                              Icons.chat_bubble,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0x11000000), blurRadius: 10.0)
                              ]),
                          child: RawMaterialButton(
                            onPressed: () {},
                            shape: CircleBorder(),
                            elevation: 0.0,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.pink[600],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
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
}
