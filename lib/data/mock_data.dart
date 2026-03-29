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
        versichertennummer: faker.guid.guid(),
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
}

//generiere 100 Patienten
final List<Patient> mockPatienten = MockPatientService().generatePatients(100);