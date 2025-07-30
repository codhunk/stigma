import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class TrackingInfo {
  final String trackingNumber;
  final String status;
  final String fromLocation;
  final String fromDate;
  final String toLocation;
  final String toDate;

  TrackingInfo({
    required this.trackingNumber,
    required this.status,
    required this.fromLocation,
    required this.fromDate,
    required this.toLocation,
    required this.toDate,
  });
}

List<TrackingInfo> trackingList = [
  TrackingInfo(
    trackingNumber: "#5754724685478",
    status: "Pending",
    fromLocation: "Mumbai airport",
    fromDate: "25 June 06:30",
    toLocation: "Delhi IGI",
    toDate: "28 July 08:26",
  ),
  TrackingInfo(
    trackingNumber: "#9876543210123",
    status: "Delivered",
    fromLocation: "Bangalore Airport",
    fromDate: "10 May 07:45",
    toLocation: "Kolkata Airport",
    toDate: "12 May 09:30",
  ),
  TrackingInfo(
    trackingNumber: "#9876543210123",
    status: "Pending",
    fromLocation: "Gujrat Airport",
    fromDate: "12 March 07:22",
    toLocation: "Lucknow Airport",
    toDate: "18 March 06:10",
  ),
];

class _HistoryScreenState extends State<HistoryScreen> {
  int selectedIndex = 0;

  List<TrackingInfo> getFilteredTrackingList() {
    if (selectedIndex == 0) {
      return trackingList; // Show all
    } else if (selectedIndex == 1) {
      return trackingList
          .where((tracking) => tracking.status == "Delivered")
          .toList(); // Show only delivered
    } else if (selectedIndex == 2) {
      return trackingList
          .where((tracking) => tracking.status == "Pending")
          .toList(); // Show only pending
    }
    return trackingList; // Default case, show all
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        title: Text(
          "Shipping History",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Inter',
          ),
        ),
        toolbarHeight: 70.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildFilterButton("All", 0),
                    buildFilterButton("Completed", 1),
                    buildFilterButton("Pending", 2),
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: getFilteredTrackingList().length,
                        itemBuilder: (context, index) {
                          TrackingInfo tracking =
                              getFilteredTrackingList()[index];
                          return Container(
                            width: double.infinity,
                            height: 220,
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Tracking Number",
                                              style: TextStyle(
                                                fontFamily: "Inter",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black.withOpacity(
                                                  0.5,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              tracking.trackingNumber,
                                              style: TextStyle(
                                                fontFamily: "Inter",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color(
                                                  0xff800020,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 25,
                                                  vertical: 8,
                                                ),
                                              ),
                                              child: Text(
                                                tracking.status,
                                                style: TextStyle(
                                                  fontFamily: "Inter",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                      color: Colors.black,
                                      thickness: 2,
                                      indent: 25,
                                      endIndent: 25,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              tracking.fromLocation,
                                              style: TextStyle(
                                                fontFamily: "Inter",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black.withOpacity(
                                                  0.5,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [Text(tracking.fromDate)],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              tracking.toLocation,
                                              style: TextStyle(
                                                fontFamily: "Inter",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black.withOpacity(
                                                  0.5,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [Text(tracking.toDate)],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFilterButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        if (mounted)
          setState(() {
            selectedIndex = index;
          });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedIndex == index ? Color(0xff800020) : Colors.grey[300],
        ),
        child: Text(
          label,
          style: TextStyle(
            color:
                selectedIndex == index
                    ? Color(0xffd9d9d9)
                    : Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
