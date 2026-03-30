import 'package:patienten_liste/model/patient.dart';
import 'package:faker/faker.dart';

class MockPatientService {
  final faker = Faker();

// Funktion zur Generierung einer Liste von Patienten
  List<Patient> generatePatients(int count) {
    return List.generate(count, (index) {
      return Patient(
        vorname: faker.person.firstName(),
        name: faker.person.lastName(),
        geburtsdatum: _randomBirthDate(),
        versichertennummer: _generateGermanPatientId(),
        geschlecht: faker.randomGenerator.boolean() ? "Male" : "Female",
        letzteBesuch: DateTime.now().subtract(
          Duration(days: faker.randomGenerator.integer(365)),
        ),
      );
    });
  }

// Hilfsfunktion zur Generierung eines zufälligen Geburtsdatums
  DateTime _randomBirthDate() {
    final faker = Faker();
    int jahr = 1950 + faker.randomGenerator.integer(60);
    int monat = 1 + faker.randomGenerator.integer(12);
    int tag = 1 + faker.randomGenerator.integer(28);
    return DateTime(jahr, monat, tag);
  }

// Hilfsfunktion zur Generierung einer deutschen Patienten-ID (KVNR-Format)
  String _generateGermanPatientId() {
    final faker = Faker();
    // Deutsche Krankenversicherungsnummer (KVNR) Format: 10 Ziffern + 1 Buchstabe
    // Beispiel: A123456789B
    
    // Erste Ziffer ist ein Buchstabe (A-Z)
    String firstChar = String.fromCharCode(65 + faker.randomGenerator.integer(26)); // A-Z
    
    // 10 zufällige Ziffern
    String digits = '';
    for (int i = 0; i < 10; i++) {
      digits += faker.randomGenerator.integer(10).toString();
    }
    
    // Letzte Ziffer ist ein Buchstabe (A-Z)
    String lastChar = String.fromCharCode(65 + faker.randomGenerator.integer(26)); // A-Z
    
    return '$firstChar$digits$lastChar';
  }
}

//generiere 100 Patienten
final List<Patient> mockPatienten = MockPatientService().generatePatients(100);