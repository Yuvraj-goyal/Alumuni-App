import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class Event {
  final String name;
  final String description;
  final String date;
  final String location;

  Event(
      {required this.name,
      required this.description,
      required this.date,
      required this.location});

  factory Event.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<dynamic, dynamic>;
    ;
    return Event(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      date: data['date'] ?? '',
      location: data['location'] ?? '',
    );
  }
}

class User {
  final String id;
  final String name;
  final String email;

  User(this.id, this.name, this.email);
}

class ReservationDetails extends StatefulWidget {
  const ReservationDetails({super.key});

  @override
  State<ReservationDetails> createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  //get events user has registered for
  // Future<List<dynamic>> getEventsForUser(String userId) async {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collectionGroup('registrations')
  //       .where('userId', isEqualTo: userId)
  //       .get();

  //   List<String> eventIds = [];

  //   for (QueryDocumentSnapshot doc in querySnapshot.docs) {
  //     String eventId = doc.reference.parent.parent!.id;
  //     eventIds.add(eventId);
  //   }

  //   List<dynamic> events = [];

  //   for (String eventId in eventIds) {
  //     DocumentSnapshot<Map<String, dynamic>> eventSnapshot =
  //         await FirebaseFirestore.instance
  //             .collection('events')
  //             .doc(eventId)
  //             .get();

  //     events.add(eventSnapshot.data());
  //   }

  //   return events;
  // }

  Stream<List<Event>> getUserEvents() {
    User currentUser = User(
        auth.FirebaseAuth.instance.currentUser!.uid,
        auth.FirebaseAuth.instance.currentUser!.displayName!,
        auth.FirebaseAuth.instance.currentUser!.email!);
    // Create a StreamController
    final controller = StreamController<List<Event>>();

    // Reference to Firestore collection
    CollectionReference eventsCollection =
        FirebaseFirestore.instance.collection('events');

    // Listen to the snapshot stream
    eventsCollection.snapshots().listen((snapshot) async {
      List<Event> userEvents = [];

      for (var doc in snapshot.docs) {
        // Assuming 'registrations' is a subcollection of each event
        var registrations = doc.reference.collection('registrations');

        // Await the future from the query
        var registrationSnapshot = await registrations
            .where('userId', isEqualTo: currentUser.id)
            .get();

        if (registrationSnapshot.docs.isNotEmpty) {
          userEvents.add(Event.fromFirestore(doc));
        }
      }

      // Add the list of events to the stream
      controller.add(userEvents);
    }, onError: (error) {
      // Handle errors and add an error event to the stream
      controller.addError(error);
    });

    return controller.stream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Event>>(
      stream: getUserEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('You have not registered for any events.');
        }
        List<Event>? events = snapshot.data;

        return ListView.builder(
          itemCount: events!.length,
          itemBuilder: (context, index) {
            Event event = events[index];
            return ListTile(
              title: Text(event.name),
              subtitle: Text(event.description),
              // Display other event details as required
            );
          },
        );
      },
    );
  }
}
