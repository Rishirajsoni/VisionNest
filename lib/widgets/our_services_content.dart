import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:realestate_consultant/pages/architecture_content.dart';
import 'package:realestate_consultant/pages/rawmaterial_content.dart';

class OurServicesContent extends StatelessWidget {
  final List<String> images = [
    'assets/images/interior06.jpeg',
    'assets/images/bricks.jpg',
    'assets/images/interior07.jpeg',
    'assets/images/flat04.jpeg',
  ];

  final List<String> watermarks = [
    'Interior Designer',
    'Raw Material',
    'Interior Designer',
    'Architecture',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Our Services!\n               here are the services we offer!!',
            style: TextStyle(
              fontSize: 18.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Architectural Solutions',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Need a personal touch? We can connect you with talented architects who can turn your ideas into a tangible masterpiece.',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Raw Material',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'We offer a direct source for top-notch raw materials, ensuring your project is built on a foundation of excellence.',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Renovation Expertise',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Elevate your living space with our renovation services, covering various aspects:',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18.0,
            ),
          ),
          Column(
            children: [
              Text(
                '- Wall Panelling\n- Wooden Flooring\n- Tiles\n- Paint Jobs\n- Wallpapers\n- Carpentry Work',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'Our approach is to bring your vision to life with finesse and precision.',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Construction Assistance',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Receive guidance and assistance in building your dream home to maximize the value of your investment. Our team of experts covers every aspect of construction.',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 16.0),
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final image = images[index];
              final watermark = watermarks[index];

              return GestureDetector(
                onTap: () {
                  if (watermark == 'Architecture') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ArchitectureContent(),
                      ),
                    );
                  } else if (watermark == 'Raw Material') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RawMaterialContent(),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: 1000.0,
                        ),
                      ),
                      Positioned(
                        bottom: 8.0,
                        right: 8.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.black.withOpacity(0.7),
                            child: Text(
                              watermark,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
              },
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Why Choose Us:',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Experience:',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'With years of industry expertise, we have successfully transformed countless spaces into homes that resonate with style and functionality.',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18.0,
            ),
          ),
          Text(
            'Customer-Centric Approach:',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Your satisfaction is our priority. We listen, understand, and tailor our services to meet your unique requirements.',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18.0,
            ),
          ),
          Text(
            'Quality Assurance: ',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'From the materials we provide to the services we offer, quality is at the heart of everything we do. Your dream home deserves nothing less.',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
