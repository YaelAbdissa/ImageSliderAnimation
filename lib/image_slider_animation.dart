import 'package:flutter/material.dart';

class ImageSliderAnimation extends StatefulWidget {
  ImageSliderAnimation({Key? key}) : super(key: key);

  @override
  State<ImageSliderAnimation> createState() => _ImageSliderAnimationState();
}

class _ImageSliderAnimationState extends State<ImageSliderAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation sliderAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    sliderAnimation =
        IntTween(begin: 0, end: Images.length - 1).animate(animationController)
          ..addListener(() {
            setState(() {
              photoIndex = sliderAnimation.value;
            });
          });

    animationController.repeat();
  }

  int photoIndex = 0;
  List<String> Images = [
    'assets/pic1.jpg',
    'assets/pic2.jpeg',
    'assets/pic3.jpeg',
    'assets/pic4.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: Mai,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                // padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    Images[sliderAnimation.value],
                  ),
                )),
              ),
              Positioned(
                left: 20.0,
                right: 20.0,
                top: 475.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildDocs(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDocs() {
    List<Widget> dots = [];

    for (int i = 0; i < Images.length; i++) {
      dots.add(i == photoIndex ? _acitvePhoto() : _inActivePhoto());
    }
    return dots;
  }

  Widget _acitvePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  Widget _inActivePhoto() {
    return new Container(
        child: new Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
      ),
    ));
  }
}
