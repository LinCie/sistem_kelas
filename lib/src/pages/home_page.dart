import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sistem Sekolah", style: theme.textTheme.headlineSmall),
      ),
      drawer: AppDrawer(),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    void onTileTap() {
      Navigator.pop(context);
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          SizedBox(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: theme.colorScheme.surface,
                  ),
                  SizedBox(height: 10),
                  Text("John Doe", style: theme.textTheme.headlineSmall),
                  Text("@username", style: theme.textTheme.labelMedium),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Class"),
            onTap: onTileTap,
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text("Schedule"),
            onTap: onTileTap,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: onTileTap,
          ),
        ],
      ),
    );
  }
}
