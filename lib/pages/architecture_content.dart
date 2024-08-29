import 'package:flutter/material.dart';

class ArchitectureContent extends StatelessWidget {
  final List<String> images = [
    'assets/images/interior06.jpeg',
    'assets/images/flat04.jpeg',
    'assets/images/interior04.jpeg',
    'assets/images/flat08.jpg',
    'assets/images/interior07.jpeg',
    'assets/images/flat05.jpg',
  ];

  final List<String> blueprintImages = [
    'assets/images/blueprint01.jpeg',
    'assets/images/blueprint02.jpeg',
    'assets/images/blueprint03.jpeg',
    'assets/images/blueprint04.jpeg',
    'assets/images/blueprint05.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            'Welcome to the Architecture Hub of VisionNest!',
            style: TextStyle(
              fontSize: 18.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.0),
            Text(
              'At VisionNest, we believe that architecture is more than just the art of building; '
              'it\'s a vision of space and form that reflects individuality and lifestyle. '
              'Our Architecture Hub is designed to inspire and assist you, whether you\'re '
              'planning to build your dream home, renovate your space, or just seeking architectural inspiration.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Discover Endless Possibilities',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Interior Designs, Exterior Architectural Styles, Blueprints and Layouts',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                final imagePath = images[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ImageDetailsPage(imagePath: imagePath),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Preexisting Blueprints',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: blueprintImages.length,
              itemBuilder: (context, index) {
                final blueprintImagePath = blueprintImages[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlueprintDetailsPage(
                          blueprintImagePath: blueprintImagePath,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(blueprintImagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Have a specific design in mind?',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
                'Our interactive tools allow you to customize designs to your preference. '
                'Modify layouts, change color schemes, and experiment with different materials.\n\n'
                'Collaborate with top architects and designers directly through our platform. '
                'Get expert advice and personalized design services tailored to your unique vision.\n',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
            'Start your architectural journey with VisionNest today!\n\n',
            style: TextStyle(
              fontSize: 18.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          ],
        ),
      ),
    );
  }
}

class ImageDetailsPage extends StatelessWidget {
  final String imagePath;

  ImageDetailsPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(imagePath),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class BlueprintDetailsPage extends StatelessWidget {
  final String blueprintImagePath;

  const BlueprintDetailsPage({Key? key, required this.blueprintImagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blueprint Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Image.asset(blueprintImagePath),
      ),
    );
  }
}
