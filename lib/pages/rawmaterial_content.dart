import 'package:flutter/material.dart';

class RawMaterialContent extends StatelessWidget {
  final List<String> images = [
    'assets/images/raw1.jpg',
    'assets/images/raw2.jpg',
    'assets/images/raw3.jpg',
    'assets/images/raw4.jpg',
    'assets/images/raw5.jpg',
    'assets/images/raw6.jpeg',
    'assets/images/raw7.jpg',
    'assets/images/raw8.jpeg',
    'assets/images/raw9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to VisionNest\'s Raw Material Catalog!',
            style: TextStyle(
              fontSize: 18.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
              'At VisionNest, we understand that the right materials make all the difference in turning your architectural vision into reality. Our Raw Material Catalog is curated to provide you with the highest quality materials for every aspect of your construction and renovation projects.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Discover a World of Quality Building Materials',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Set the number of columns in the grid
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
                      builder: (context) => DestinationPage(imagePath: imagePath),
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
          Text(
              'Explore Our Extensive Range',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Tiles:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
                'Ceramic Tiles: Perfect for kitchens and bathrooms, available in various colors and patterns.\n'
                'Porcelain Tiles: Ideal for high-traffic areas, known for their durability and water resistance.\n'
                'Stone Tiles: Including marble, granite, and slate for a touch of natural elegance.\n'
                'Mosaic Tiles: Add a decorative flair to your space with our range of mosaic options.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
              'Flooring:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Hardwood Flooring: Timeless and sophisticated, available in oak, maple, and cherry.\n'
                'Laminate Flooring: A cost-effective, durable alternative that mimics the look of real wood.\n'
                'Vinyl Flooring: Versatile and waterproof, perfect for utility areas.\n'
                'Bamboo Flooring: An eco-friendly option known for its strength and unique appearance.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),SizedBox(height: 16.0),
              Text(
              'Construction Materials:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 8.0),
              Text(
                'Concrete: High-quality mixtures for robust and durable construction.\n'
                'Bricks and Blocks: From traditional clay bricks to modern lightweight blocks.\n'
                'Roofing Materials: Including shingles, tiles, and metal options for all roofing needs.\n'
                'Insulation Materials: Keep your property energy-efficient with our range of insulation options.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
              'Finishing Touches:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Paints and Coatings: Choose from a variety of colors and finishes to bring your walls to life.'
                'Woodwork and Carpentry Materials: Everything you need for bespoke woodwork and cabinetry.'
                'Glass and Glazing: For windows, doors, and decorative elements.'
                'Quality Assurance and Expert Guidance'
                'All our materials are sourced from trusted manufacturers, ensuring quality and durability. Need advice on the best materials for your project? Our expert consultants are here to guide you through the selection process, helping you make informed decisions based on your specific requirements and budget.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
              'Convenient Delivery Options',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'We offer a range of delivery options to suit your schedule and project timeline. Order your materials through VisionNest and have them delivered straight to your construction site.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
            'Your One-Stop Shop for Building Materials VisionNest!',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class DestinationPage extends StatelessWidget {
  final String imagePath;

  const DestinationPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Details'),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
