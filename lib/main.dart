import 'package:flutter/material.dart';
import 'package:patienten_liste/model/patient.dart';
import 'package:patienten_liste/providers/patient_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Initialisiere den PatientProvider und stelle ihn der gesamten App zur Verfügung
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PatientProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget { 
 
const MyHomePage({super.key, required this.title});
  final String title;
  
 
  

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  // Controller für die Suchleiste
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    // Initialisiere den TextEditingController für die Suchleiste
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showNotImplementedDialog(String feature, Patient patient) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Noch nicht implementiert'),
        content: Text(
          '$feature für ${patient.vorname} ${patient.name} ist noch nicht implementiert.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),

            // Suchleiste zur Eingabe der Suchanfrage
            child: TextField(
              controller: _searchController,
              // Bei jeder Änderung der Suchanfrage wird die searchPatients-Funktion im PatientProvider aufgerufen
              onChanged: (value) {
                context.read<PatientProvider>().searchPatients(value);
              },
              decoration: InputDecoration(
                hintText: 'Suche nach Name oder ID...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            // ListView.builder zur Anzeige der gefilterten Patientenliste
            child: Consumer<PatientProvider>(
              builder: (context, provider, _) {
                return ListView.builder(
                  itemCount: provider.filteredPatients.length,
                  itemBuilder: (context, index) {
                    final patient = provider.filteredPatients[index];
                    return ListTile(
                      title: Text('${patient.vorname} ${patient.name}'),
                      subtitle: Text('ID: ${patient.versichertennummer}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _showNotImplementedDialog('Behandlungskarte', patient);
                            },
                            child: const Text('Behandlung'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Stammdaten action
                            },
                            child: const Text('Stammdaten'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
