import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class IconTextPair {
  late final IconData icon;
  late final String text;

  IconTextPair(this.icon, this.text);
}

class _DetailsPageState extends State<DetailsPage> {
  final ScrollController _scrollController1 = ScrollController();

  final List<IconTextPair> pairs = [
    IconTextPair(Icons.hotel_outlined, "Hotel"),
    IconTextPair(Icons.flight_outlined, "Flight"),
    IconTextPair(Icons.place_outlined, "Place"),
    IconTextPair(Icons.food_bank_outlined, "Food"),
    IconTextPair(Icons.bed_outlined, "Bed"),
    IconTextPair(Icons.dinner_dining_outlined, "Dinner"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: content(context),
      ),
    );
  }

  Column content(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            backgroundImage(context),
            arrowButton(context),
            shareButton(),
            hotelDetails(context),
          ],
        ),
      ],
    );
  }

  Positioned hotelDetails(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        top: MediaQuery.of(context).size.height * 0.25,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading(),
                place(),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.only(left: 24, right: 20),
                  child: Divider(
                    thickness: 1.4,
                    color: Color.fromARGB(255, 225, 221, 221),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                text(context),
                customerDetails(),
                SizedBox(
                  height: 12,
                ),
                floatingButton(context)
              ],
            ),
          ),
        ));
  }

  Container floatingButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
      padding: EdgeInsets.symmetric(horizontal: 25),
      margin: EdgeInsets.only(top: 16),
      child: FloatingActionButton(
        onPressed: () {},
        mini: true,
        backgroundColor: Color.fromARGB(255, 107, 180, 240),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 260,
          height: 50,
          child: Center(
            child: Text(
              'Book Now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container customerDetails() {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 8),
      child: ListTile(
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(
                "https://d1nxzqpcg2bym0.cloudfront.net/google_play/com.wallpaper.anahita/f50fe9ea-95ea-11ea-85dc-2dde57b33ffa/640",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          'Harleen Smith',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.orange,
              size: 18,
            ),
            Text(
              " 4.9",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              " (",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "1.4k",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              " reviews)",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        trailing: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(
                "https://vectips.com/wp-content/uploads/2020/08/tutorial-preview-large-1.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }

  Container text(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Set in Vung Tau, 100 meters from Front Beach, BaLi",
            style: TextStyle(
                fontSize: 14,
                color: Colors.black26,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "Motel Vung Tau offers accommodation with a",
            style: TextStyle(
                fontSize: 14,
                color: Colors.black26,
                fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Text(
                "garden, private parking and a shared...",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black26,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Read more",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 28,
          ),
          Text(
            "What we offer",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.12,
            child: ListView.builder(
              controller: _scrollController1,
              scrollDirection: Axis.horizontal,
              itemCount: pairs.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      EdgeInsets.only(right: 15, top: 12, bottom: 12, left: 2),
                  child: Container(
                    width: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(1, 1))
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          pairs[index].icon,
                          size: 20,
                        ),
                        SizedBox(height: 10),
                        Text(
                          pairs[index].text,
                          style: TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Hosted by",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ],
      ),
    );
  }

  Padding place() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.orange,
                size: 18,
              ),
              Text(
                " 4.9",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              Text(
                "(",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "6.8k",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                " review)",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "\$580/",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "night",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container heading() {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BaLi Motel",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              Text(
                "Vung Tau",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.black38,
                    size: 20,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Indonesia",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Positioned shareButton() {
    return Positioned(
      top: 40,
      right: 20,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.share_outlined,
              color: Colors.black,
              size: 22,
            ),
          ),
          SizedBox(width: 15),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Positioned arrowButton(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 22,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container backgroundImage(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://s1.travix.com/blog/as/asia-vietnam-halong-bay-rocks-nature-boats-medium.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
