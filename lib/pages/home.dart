import 'package:flutter/material.dart';
import 'package:project/pages/detailsPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class IconTextPair {
  late final IconData icon;
  late final String text;

  IconTextPair(this.icon, this.text);
}

class PlaceDetails {
  late final String image;
  late final String city;
  late final String country;
  late final String amount;
  late final String rating;

  PlaceDetails(this.image, this.city, this.country, this.amount, this.rating);
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final List<IconTextPair> pairs = [
    IconTextPair(Icons.hotel_outlined, "Hotel"),
    IconTextPair(Icons.flight_outlined, "Flight"),
    IconTextPair(Icons.place_outlined, "Place"),
    IconTextPair(Icons.food_bank_outlined, "Food"),
    IconTextPair(Icons.bed_outlined, "Bed"),
    IconTextPair(Icons.dinner_dining_outlined, "Dinner"),
  ];
  final List<PlaceDetails> places = [
    PlaceDetails(
        "https://s1.travix.com/blog/as/asia-vietnam-halong-bay-rocks-nature-boats-medium.jpg",
        "Santorini",
        "Greece",
        "\$488/",
        "4.9"),
    PlaceDetails(
        "https://claimflights.com/wp-content/uploads/Beautiful-place.jpg",
        "Hotel Royal",
        "Spain",
        "\$280/",
        "4.8"),
    PlaceDetails(
        "https://deih43ym53wif.cloudfront.net/florence-italy-shutterstock_592336670_ccaf07e157.jpeg",
        "Paris",
        "France",
        "\$488/",
        "4.9"),
    PlaceDetails(
        "https://www.ourescapeclause.com/wp-content/uploads/2020/05/shutterstock_134874083-scaled.jpg",
        "Columbo",
        "Sri Lanka",
        "\$488/",
        "4.9"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          itemsList(),
          SizedBox(height: 10),
          hotelsHeading(),
          hotels(),
          SizedBox(height: 20),
          dealsHeading(),
          deals(),
        ],
      ),
    );
  }

  Expanded deals() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 0, left: 10, right: 10),
        child: ListView.builder(
          controller: _scrollController2,
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  EdgeInsets.only(left: 16, top: 10, right: 20, bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(places[index].image),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            places[index].city,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 16,
                              ),
                              Text(
                                places[index].rating,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.white70,
                                size: 16,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                places[index].country,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                places[index].amount,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "night",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding dealsHeading() {
    return Padding(
      padding: EdgeInsets.only(left: 27),
      child: Row(
        children: [
          Text(
            "Hot Deals",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ],
      ),
    );
  }

  Expanded hotels() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 0, left: 10, right: 10),
        child: ListView.builder(
          controller: _scrollController2,
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left: 16, top: 10, right: 3),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(places[index].image),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        places[index].city,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 6),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white70,
                            size: 16,
                          ),
                          SizedBox(width: 2),
                          Text(
                            places[index].country,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 10, top: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                places[index].amount,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "night",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 16,
                              ),
                              Text(
                                places[index].rating,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding hotelsHeading() {
    return Padding(
      padding: EdgeInsets.only(left: 27, right: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular Hotels",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text(
            "See all",
            style: TextStyle(fontSize: 14, color: Colors.orange),
          ),
        ],
      ),
    );
  }

  Container itemsList() {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 13),
      height: 120,
      child: ListView.builder(
        controller: _scrollController1,
        scrollDirection: Axis.horizontal,
        itemCount: pairs.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              width: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  ),
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
    );
  }

  PreferredSize appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(80 + MediaQuery.of(context).padding.top),
      child: AppBar(
        toolbarHeight: 80 + MediaQuery.of(context).padding.top,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Text(
                "Where you\nWanna go?",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  height: 0.98,
                  fontFamily: "Belanosima",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.search_rounded,
                      size: 33,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
