class Event {
  final String name;
  final String description;
  final String date;
  final String location;

  Event(
    this.name,
    this.description,
    this.date,
    this.location,
  );

  static Event fromJson(Map<String, dynamic> json) {
    return Event(
      json['name'],
      json['description'],
      json['date'],
      json['location'],
    );
  }
}
