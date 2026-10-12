import 'package:flutter/material.dart';

class GoogleMapReviewScreen extends StatelessWidget {
  const GoogleMapReviewScreen({super.key});
  Widget _buildButton({required IconData icon, required String title}) {
  return Column(
    children: [
      Icon(icon, color: Colors.blue),
      Text(title, style: TextStyle(color: Colors.blue)),
    ],
  ); // Column
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
    
            Image(
              image: const AssetImage("asset/wisata.jpg"),
              width: MediaQuery.of(context).size.width,
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Danau Toba"),
                      Text("Sumatra Utara,Indonesia"),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.deepOrangeAccent),
                      Text("41"),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(icon: Icons.call, title: "Call"),
                  _buildButton(icon: Icons.navigation, title: "Navigation"),
                  _buildButton(icon: Icons.share, title: "Share"),
                ],
              ),
            ),
     
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Lake Toba is a magnificent volcanic lake located in North Sumatra, Indonesia. "
                "Surrounded by lush green hills and featuring Samosir Island at its center, "
                "it is a world-famous destination renowned for its breathtaking natural scenery "
                "and rich Batak culture.",
              ),
            ),
          ], 
        ),
      ),
    );
  }
}