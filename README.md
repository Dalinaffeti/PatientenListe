# Beschreibung

Diese Flutter-Anwendung stellt eine Patientenliste mit generierten Mockdaten dar.
Ziel ist es, eine übersichtliche und durchsuchbare Liste von Patienten bereitzustellen



# Features
-Anzeige von mindestens 100 Patienten (Mockdaten)
-Suchfunktion nach:
  Vorname
  Nachname
  Versicherungsnummer

# Verwendete Technologien
-Flutter (Dart)
-Provider (State Management)
-Faker (Mockdaten-Generierung)
-Visual Studio Code

# Architektur

Die Anwendung ist modular aufgebaut:

-Models: Datenstruktur (Patient).
-Services: Generierung der Mockdaten.
-Provider: State Management und Suchlogik.
-Widgets: Wiederverwendbare Komponenten.

# Installation & Start
-Repository klonen:
  git clone https://github.com/Dalinaffeti/PatientenListe.git
-Projekt öffnen:
  cd patient_app
-Abhängigkeiten installieren:
  flutter pub get faker
  flutter pub get provider
-Anwendung starten:
  flutter run
