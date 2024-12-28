import 'package:flutter/material.dart';
import '../helpers/colors.dart';
import '../helpers/globals.dart';
import '../model/image_creation_type.dart';

class ImageCreationCard extends StatelessWidget {
  final ImageCreationType imageCreationType;
  const ImageCreationCard({super.key, required this.imageCreationType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => imageCreationType.onTap));
      },
      child: Card(
        color: ligh_blue.withOpacity(.2),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: imageCreationType.leftAlign
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(imageCreationType.img,
                        width: mq.width * 0.35),
                  ),
                  Text(
                    imageCreationType.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    imageCreationType.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(imageCreationType.img,
                        width: mq.width * 0.30),
                  ),
                ],
              ),
      ),
    );
  }
}
