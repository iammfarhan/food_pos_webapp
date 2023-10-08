import 'package:flutter/material.dart';

class PizzaItem extends StatelessWidget {
  final String imageUrl;
  final double price;
  final String title;

  const PizzaItem({
    Key? key,
    required this.imageUrl,
    required this.price,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.0,
      height: 159.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 124.0,
            child: Stack(
              children: [
                // Pizza image

                Image.asset(
                  imageUrl,
                  height: 124.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Price label (top right)
                Positioned(
                  top: 4.0,
                  right: 4.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 3.0),
                    color: Colors.white,
                    child: Text(
                      '$price£',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff222B45),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff222B45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
