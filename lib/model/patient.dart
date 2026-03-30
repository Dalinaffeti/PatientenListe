// Klasse zur Darstellung eines Patienten mit den relevanten Informationen
class Patient {
  String name;
  String vorname;
  String geschlecht;
  DateTime geburtsdatum;
  String versichertennummer;
  DateTime letzteBesuch;
// Konstruktor zur Initialisierung eines Patientenobjekts
  Patient({
    required this.name,
    required this.vorname,
    required this.geburtsdatum,
    required this.versichertennummer,
    required this.geschlecht,
    required this.letzteBesuch,
  });
}