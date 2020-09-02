import 'package:flutter/material.dart';

class ContainerBags extends StatelessWidget {
  final String image;
  final String price;
  final double imageWidth;
  final double imageHeight;
  final double top;
  final double left;
  final double right;
  final double sizeCard;
  final double leftCard;
  final double rightCard;
  final Function onTap;
  ContainerBags({this.price,this.image, this.imageWidth, this.imageHeight, this.top, this.sizeCard, this.leftCard, this.rightCard, this.left, this.right, this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
          top: sizeCard,//MediaQuery.of(context).size.height * 0.25,
          left: leftCard,//16,
          right: rightCard,//16,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: MediaQuery.of(context).size.width*0.4,
              height: MediaQuery.of(context).size.height*0.24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 10,
                      offset: Offset(0, 3)),
                ],
              ),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    top:top,//-40,
                    right: right,
                    left: left,
                    child: Hero(
                      tag: image,
                      child: Image.asset(
                        image,
                        width: imageWidth,//MediaQuery.of(context).size.width * 0.4,
                        height: imageHeight,//MediaQuery.of(context).size.height * 0.2,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: MediaQuery.of(context).size.height * 0.16,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16,bottom: 10,),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: price,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '\$',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}