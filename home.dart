import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, int> rsvpCountMap = {
    'Event 1': 0,
    'Event 2': 0,
    'Event 3': 0,
    'Event 4': 0,
    'Event 5': 0,
  };

  TextEditingController searchController = TextEditingController();
  List<String> allEventNames = [
    'Event 1',
    'Event 2',
    'Event 3',
    'Event 4',
    'Event 5',
  ];
  List<String> displayedEventNames = [];

  @override
  void initState() {
    super.initState();
    displayedEventNames = List.from(allEventNames);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/t.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Transform.translate(
                offset: const Offset(10, -10),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.yellow[800],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        displayedEventNames = filterEvents(value);
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: "Search Event",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: displayedEventNames.length,
                  itemBuilder: (context, index) {
                    // Pass the actual time, description, and name for each event
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: makeItem(
                        image: 'assets/t.jpg',
                        date: 18,
                        eventName: displayedEventNames[index],
                        eventDescription:
                            getEventDescription(displayedEventNames[index]),
                        eventTime: getTimeForEvent(displayedEventNames[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> filterEvents(String query) {
    return allEventNames
        .where((eventName) =>
            eventName.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  String getTimeForEvent(String eventName) {
    // Replace this with actual logic to get the time for each event
    Map<String, String> eventTimes = {
      'Event 1': '1:00 PM',
      'Event 2': '2:00 PM',
      'Event 3': '3:00 PM',
      'Event 4': '4:00 PM',
      'Event 5': '5:00 PM',
    };

    // Return the time for the given event name, or a placeholder if not found
    return eventTimes[eventName] ?? 'Time Placeholder';
  }

  String getEventDescription(String eventName) {
    // Replace this with your actual logic or use a database query
    Map<String, String> eventDescriptions = {
      'Event 1': 'Lunch',
      'Event 2': 'Get together',
      'Event 3': 'School Tour',
      'Event 4': 'Performances',
      'Event 5': 'Closing ceremony and appreciations',
    };

    // Return the description for the given event name, or a placeholder if not found
    return eventDescriptions[eventName] ?? 'Event Description Placeholder';
  }

  Widget makeItem({image, date, eventName, eventDescription, eventTime}) {
    int localRsvpCount = rsvpCountMap[eventName] ?? 0;

    return Row(
      children: [
        Container(
          width: 50,
          height: 200,
          margin: const EdgeInsets.only(right: 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(
                  date.toString(),
                  style: const TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'JAN',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    eventName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    eventDescription,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.white),
                      SizedBox(
                        width: 10,
                      ),
                      Text(eventTime, style: TextStyle(color: Colors.white)),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            localRsvpCount++;
                            rsvpCountMap[eventName] = localRsvpCount;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(Icons.thumb_up, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              localRsvpCount.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
