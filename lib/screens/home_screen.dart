import 'package:flutter/material.dart';
import 'package:wallet_shop/screens/details_screen.dart';
import 'package:wallet_shop/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // overflow: Overflow.visible,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ProfilePhoto(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CateText(
                  header: 'bestseller',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerBags(
                    top: -50,
                    imageWidth: MediaQuery.of(context).size.width * 0.4,
                    imageHeight: MediaQuery.of(context).size.height * 0.2,
                    image: 'assets/images/bag1.png',
                    price: '120',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            price: '120',
                            image: 'assets/images/bag1.png',
                          ),
                        ),
                      );
                    },
                  ),
                  ContainerBags(
                    top: -50,
                    imageWidth: MediaQuery.of(context).size.width * 0.4,
                    imageHeight: MediaQuery.of(context).size.height * 0.2,
                    image: 'assets/images/bag2.png',
                    price: '105',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            price: '105',
                            image: 'assets/images/bag2.png',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              CateText(
                header: 'wallet',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerBags(
                    top: 10,
                    right: 15,
                    left: 15,
                    imageWidth: MediaQuery.of(context).size.width * 0.3,
                    imageHeight: MediaQuery.of(context).size.height * 0.15,
                    image: 'assets/images/wallet.png',
                    price: '25',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            price: '25',
                            image: 'assets/images/wallet.png',
                          ),
                        ),
                      );
                    },
                  ),
                  ContainerBags(
                    top: 10,
                    right: 5,
                    left: 5,
                    imageWidth: MediaQuery.of(context).size.width * 0.3,
                    imageHeight: MediaQuery.of(context).size.height * 0.15,
                    image: 'assets/images/bag_red.png',
                    price: '20',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            price: '20',
                            image: 'assets/images/bag_red.png',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
