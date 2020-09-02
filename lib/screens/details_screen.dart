import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class DetailsScreen extends StatelessWidget {
  final String image;
  final String price;

  DetailsScreen({@required this.image, this.price});

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Stack(
        overflow: Overflow.visible,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 150,
                      offset: Offset(0, -20)),
                ],
              ),
              child: CustomPaint(
                painter: ShapesPainter(),
                child: Container(
                  margin: EdgeInsets.only(bottom: 50, top: 10),
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 3,
                    onPageChanged: (index) {
                      _pageViewNotifier.value = index;
                    },
                    itemBuilder: (context, index) {
                      return Hero(
                        tag: image,
                        child: Image.asset(
                          // TODO: " Here should be the list of photos for each bag"
                          // it's make bug bcz tag hero
                          image /*[index]*/,
                          height: MediaQuery.of(context).size.height,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              right: MediaQuery.of(context).size.width / 2 - 25,
              child: _displayPageIndicators(3)),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            right: 8,
            left: 8,
            bottom: 8,
            child: Container(
              padding: EdgeInsets.only(right: 16, top: 40, left: 16, bottom: 8),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.48,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Rate:',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      buildStars(),
                    ],
                  ),
                  buildRow(
                    title: 'Size:',
                    data: '30&25',
                  ),
                  buildRow(
                    title: 'Color:',
                    data: 'Red . Blue . Black . Pink',
                  ),
                  buildRow(
                    title: 'Quality:',
                    data: 'Leather',
                  ),
                  buildRow(
                    title: 'Delivery Date:',
                    data: '7-10 Days',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 55,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          onPressed: () {},
                          color: Colors.grey[400],
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '$price ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: 55,
                        child: FlatButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          color: Theme.of(context).accentColor,
                          child: Text(
                            'Add To Basket',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.425,
            left: 16,
            child: Icon(
              Icons.info,
              size: 40,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Row buildStars() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 24,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 24,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 24,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 24,
        ),
      ],
    );
  }

  Widget buildRow({String title, String data}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          data,
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _displayPageIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey, width: 1.5)),
        child: Circle(
          size: 12.0,
          color: Colors.white,
        ),
      ),
      indicatorPadding: EdgeInsets.only(right: 5, top: 16, bottom: 32),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}

const double _kCurveHeight = 35;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(p, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
