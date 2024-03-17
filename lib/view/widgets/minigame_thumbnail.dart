import 'package:flutter/material.dart';

class MinigameThumbnail extends StatelessWidget {
  final String title;
  final String navigationRoute;
  final String image;

  const MinigameThumbnail({
    Key? key,
    required this.title,
    required this.navigationRoute,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, navigationRoute);
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Stack(
              alignment: Alignment.center, // Center the text over the image
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center, // Center the text horizontally
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
