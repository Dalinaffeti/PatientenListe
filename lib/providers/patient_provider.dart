import 'package:flutter/material.dart';
import 'package:patienten_liste/model/patient.dart';
import 'package:patienten_liste/data/mock_data.dart';

class PatientProvider extends ChangeNotifier {
  late List<Patient> _allPatients;
  late List<Patient> _filteredPatients;

  // Getters
  List<Patient> get allPatients => _allPatients;
  List<Patient> get filteredPatients => _filteredPatients;

  //initialisierung der Patientenliste mit Mock-Daten
  PatientProvider() {
    _allPatients = mockPatienten;
    _filteredPatients = mockPatienten;
  }

  // Funktion zur Suche von Patienten basierend auf der Suchanfrage
  void searchPatients(String query) {
    if (query.isEmpty) {
      // Wenn die Suchanfrage leer ist, zeige alle Patienten an
      _filteredPatients = _allPatients;
    } else {
      // Filtere die Patientenliste basierend auf der Suchanfrage (Vorname, Name oder Versichertennummer)
      final lowerQuery = query.toLowerCase();
      _filteredPatients = _allPatients
          .where((patient) =>
              patient.vorname.toLowerCase().contains(lowerQuery) ||
              patient.name.toLowerCase().contains(lowerQuery) ||
              patient.versichertennummer.toLowerCase().contains(lowerQuery))
          .toList();
    }
    // Benachrichtige die UI, dass sich die gefilterte Patientenliste geändert hat
    notifyListeners();
  }
}
