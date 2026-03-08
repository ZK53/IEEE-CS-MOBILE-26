import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Task08 extends StatelessWidget {
  const Task08({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/img1.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 60,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white.withOpacity(0.8),
                    size: 30,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.ios_share,
                        color: Colors.white.withOpacity(0.8),
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.bookmark_border,
                        color: Colors.white.withOpacity(0.8),
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(14),
                child: Icon(Icons.play_arrow, size: 40, color: Colors.black),
              ),
            ),
            DraggableScrollableSheet(
              expand: true,
              initialChildSize: 0.33,
              minChildSize: 0.33,
              maxChildSize: 0.8,
              builder: (context, controller) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView(
                  controller: controller,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Center(
                        child: Transform.translate(
                          offset: Offset(0, -40),
                          child: Container(
                            width: 60,
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text(
                        "Homemade Ramen",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "By June Xie",
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.stars_rounded,
                            color: Colors.orange,
                            size: 34,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "4.5",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _shortCard(Icons.timer, "3h 30min"),
                        _shortCard(Icons.person_2_outlined, "Serves 4"),
                        _shortCard(Icons.local_fire_department, "Ingredient"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Text(
                            "Ingredients",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "For Chicken Dashi",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Text(
                                  """
    8 Cups
    16
    30 g
    20 g""",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // SizedBox(width: 50),
                              SizedBox(
                                height: 100,
                                child: Text(
                                  """
    Low sodium chicken broth
    Dried shiitake mushrooms
    Kombu (about 10 square piece)
    Dried Bonito flakes""",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "For Tare and Chashu",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Text(
                                  """
    1 1/4 Cups
    1 1/4 Cups
    1/2 Cups
    1 1/2 Cups""",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // SizedBox(width: 50),
                              SizedBox(
                                height: 100,
                                child: Text(
                                  """
    Low sodium soy sauce
    Mirin
    Sake
    Water""",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _shortCard(IconData icon, String text) {
  return Container(
    width: 100,
    height: 90,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 226, 236, 255),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue, size: 36),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
