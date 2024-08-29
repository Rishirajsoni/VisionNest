import 'package:flutter/material.dart';
import 'package:realestate_consultant/widgets/our_services_content.dart';
import 'package:realestate_consultant/pages/about_us.dart';
import 'package:realestate_consultant/pages/architecture_content.dart';
import 'package:realestate_consultant/pages/rawmaterial_content.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = [
    'About us',
    'Our Services',
    'Architecture',
    'Raw Material',
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  Widget _buildOurServicesContent() {
    return OurServicesContent();
  }

  Widget _buildAboutUsContent() {
    return AboutUsContent();
  }

  Widget _buildArchitectureContent() {
    return ArchitectureContent();
  }

  Widget _buildRawMaterialContent() {
    return RawMaterialContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'RealEstate\nConsultant',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/logo.jpg',
                      height: 90,
                      width: 90,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: filters.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final filter = filters[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedFilter = filter;
                                });
                              },
                              child: Chip(
                                backgroundColor: selectedFilter == filter
                                    ? Theme.of(context).colorScheme.primary
                                    : const Color.fromRGBO(245, 247, 249, 1),
                                side: const BorderSide(
                                  color: Color.fromRGBO(245, 247, 249, 1),
                                ),
                                label: Text(filter),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              _buildContentBasedOnFilter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentBasedOnFilter() {
    switch (selectedFilter) {
      case 'About us':
        return _buildAboutUsContent();
      case 'Our Services':
        return _buildOurServicesContent();
      case 'Architecture':
        return _buildArchitectureContent();
      case 'Raw Material':
        return _buildRawMaterialContent();
      default:
        return Container(); // Add a default case to handle unknown filters
    }
  }
}
