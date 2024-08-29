import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AboutUsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 300.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: [
              'assets/images/flat01.png',
              'assets/images/interior03.jpeg',
              'assets/images/flat08.jpg',
              // Add more image paths as needed
            ].map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    item,
                    fit: BoxFit.cover,
                  );
                },
              );
            }).toList(),
          ),
          Text(
            '\nWelcome to VisionNest, your trusted partner in turning dreams into reality when it comes to your living space. At VisionNest, we believe that a home is more than just bricks and mortar; it\'s a reflection of your aspirations, lifestyle, and individuality.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'Lato',
              letterSpacing: 1.5,
              height: 1.5,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Who We Are:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'Lato',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'VisionNest is a leading Real Estate consultancy firm dedicated to providing comprehensive solutions for all your housing needs. Whether you\'re looking for a pre-existing blueprint, seeking expert architects, or dreaming of a custom-built home, we are here to guide you every step of the way.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontFamily: 'Lato',
            ),
          ),
          // Add more content as needed
        ],
      ),
    );
  }
}
