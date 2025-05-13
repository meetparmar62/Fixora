import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixora/notification_page.dart';
import 'package:fixora/offers_page.dart';
import 'package:fixora/profile_page.dart';
import 'package:fixora/service_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageUrls=[];
  List<Widget> pageList = [
    ServicePage(), // Home
    ServicePage(), // Services
    OffersPage(),  // Offers
    ProfilePage(), // Profile
  ];
  int SelectedIndex = 0;
  @override

  void initState(){
    super.initState();
    fetchCarouselImages();
  }
  void fetchCarouselImages() async {
    final snapshot = await FirebaseFirestore.instance.collection('carousel_images').get();
    setState(() {
      imageUrls = snapshot.docs.map((doc) => doc['url']as String).toList();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FIXORA",style: 
        TextStyle(
          fontFamily: 'pacifico',
          fontSize: 28,
          color: Colors.white,
        ),),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.grey.shade400,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage(),));
            },
          ),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
            }, icon: Icon(Icons.person),
            color: Colors.grey.shade400,)
        ],
      ),
      body:
      Column(
        children: [
          if (imageUrls.isNotEmpty)
         CarouselSlider(
          options: CarouselOptions(height: 200.0,autoPlay: true),
          items: imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context){
                return Image.network(url, fit: BoxFit.cover,width: double.infinity,);
              },
            );

          }).toList(),
           ),
          Expanded(
            child: pageList[SelectedIndex],
          ),
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.black,
        iconSize: 28,
        currentIndex: SelectedIndex,
        onTap: (value) {
          setState(() {
            SelectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.miscellaneous_services_outlined), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Offers"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp), label: "Profile"),
        ],
      ),
      
    );
  }
}