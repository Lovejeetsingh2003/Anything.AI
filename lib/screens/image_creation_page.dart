import 'package:anything_ai/apis/chatgptApi.dart';
import 'package:anything_ai/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert'; // Import to decode the JSON response
import '../helpers/colors.dart';
import '../helpers/globals.dart';

class ImageCreationPage extends StatefulWidget {
  final String title;
  const ImageCreationPage({super.key, required this.title});

  @override
  State<ImageCreationPage> createState() => _ImageCreationPageState();
}

class _ImageCreationPageState extends State<ImageCreationPage> {
  TextEditingController imageDesc = TextEditingController();
  var image;
  bool isLoading = false;

  Future<void> fetchImage(String imageDesc) async {
    try {
      setState(() {
        isLoading = true;
      });

      final response = await ChatgptApi.getImage(imageDesc);

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        final parsedResponse =
            jsonDecode(responseBody); // Decode the response JSON

        // Extract the generated image URL from the parsed response
        final imageUrl = parsedResponse['generated_image'];

        setState(() {
          image = imageUrl;
          isLoading = false;
        });
      } else {
        print(
            "Failed to fetch image, no response or error: ${response?.statusCode}");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching image: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            letterSpacing: 3,
            fontSize: 25,
            color: ligh_blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          Expanded(
            child: TextFormField(
                controller: imageDesc,
                textAlign: TextAlign.center,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    filled: true,
                    isDense: true,
                    hintText: 'Enter the Image Description',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))))),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              if (imageDesc.text.toString().isEmpty) {
                Fluttertoast.showToast(msg: "Enter the Image Description.");
              } else {
                fetchImage(imageDesc.text.toString());
              }
            },
            child: const CircleAvatar(
              radius: 24,
              backgroundColor: ligh_blue,
              child: Icon(Icons.rocket_launch_rounded,
                  color: Colors.white, size: 28),
            ),
          )
        ]),
      ),
      body: Center(
        child: Container(
          width: mq.width * .8,
          height: mq.width * .8,
          color: grey[200],
          child: isLoading
              ? const LoadingScreen() // Show loading animation while fetching
              : image != null
                  ? Image.network(
                      image!) // Show the fetched image using the URL
                  : Icon(
                      Icons.camera_alt_outlined,
                      size: mq.width * .7,
                      color: grey,
                    ),
        ),
      ),
    );
  }
}
