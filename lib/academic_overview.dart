import 'package:flutter/material.dart';

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Academic Overview',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const AcademicOverviewScreen(),
    );
  }
}

class AcademicOverviewScreen extends StatefulWidget {
  const AcademicOverviewScreen({super.key});

  @override
  State<AcademicOverviewScreen> createState() => _AcademicOverviewScreenState();
}

class _AcademicOverviewScreenState extends State<AcademicOverviewScreen> {
  // Breakpoint konstan sesuai instruksi refactoring
  static const double kWideBreakpoint = 700.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth >= kWideBreakpoint;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic Overview'),
        actions: [
          // Toggle tema otomatis berdasarkan system/brightness
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            tooltip: 'Ganti Tema',
            onPressed: () {
              // Catatan: Di aplikasi nyata bisa menggunakan state management untuk toggle manual
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Profil
            Semantics(
              label: 'Bagian Profil Pengguna: Andre Kurniawan, NIM 24.52.0002',
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person, size: 30),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Andre Kurniawan',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('NIM: 24.52.0002 | S1 Teknologi Informasi'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Statistik Akademik',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // 2. Empat Kartu Informasi dengan Layout Responsif (1 atau 2 Kolom)
            isWide
                ? Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            child: InfoCard(title: 'IPK', value: '3.85'),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: InfoCard(
                              title: 'SKS ditempuh',
                              value: '72 SKS',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Expanded(
                            child: InfoCard(
                              title: 'Semester Aktif',
                              value: 'Semester 4',
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: InfoCard(title: 'Kehadiran', value: '98%'),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: const [
                      InfoCard(title: 'IPK', value: '3.85'),
                      SizedBox(height: 12),
                      InfoCard(title: 'SKS ditempuh', value: '72 SKS'),
                      SizedBox(height: 12),
                      InfoCard(title: 'Semester Aktif', value: 'Semester 4'),
                      SizedBox(height: 12),
                      InfoCard(title: 'Kehadiran', value: '98%'),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

// Widget Reusable untuk Kartu Informasi (Refactoring Point 1)
class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const InfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Informasi $title bernilai $value',
      child: Card(
        elevation: 1,
        // Menggunakan Theme.of(context) agar otomatis mengikuti warna tema (Refactoring Point 2)
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
