class Patient {
  String name;
  String vorname;
  String geschlecht;
  DateTime geburtsdatum;
  String versichertennummer;
  DateTime letzteBesuch;

  Patient({
    required this.name,
    required this.vorname,
    required this.geburtsdatum,
    required this.versichertennummer,
    required this.geschlecht,
    required this.letzteBesuch,
  });
}