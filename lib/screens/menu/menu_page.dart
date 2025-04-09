import 'package:flutter/material.dart';
import 'package:sistem_kelas/services/class_service.dart';
import 'package:sistem_kelas/structures/class_structure.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final ClassService _classService = ClassService();
  String _dropdownValue = 'student';
  List<Class> _classes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchClasses();
  }

  Future<void> _fetchClasses() async {
    setState(() => _isLoading = true);

    try {
      final classes = await _classService.getClasses(_dropdownValue);
      setState(() {
        _classes = classes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  void _showAddClassModal() {
    final TextEditingController nameController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add New Class',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Class Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final name = nameController.text.trim();
                  if (name.isNotEmpty) {
                    // Here you'd send this data to your backend
                    Navigator.of(context).pop(); // Close the modal
                    // Optionally: refresh list after adding
                  }
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cognito',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actionsPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _dropdownValue,
              items: const [
                DropdownMenuItem(value: 'student', child: Text('Student')),
                DropdownMenuItem(value: 'teacher', child: Text('Teacher')),
              ],
              onChanged: (value) {
                if (value != null && value != _dropdownValue) {
                  setState(() {
                    _dropdownValue = value;
                  });
                  _fetchClasses();
                }
              },
            ),
          ),
        ],
      ),
      body: Center(
        child:
            _isLoading
                ? const CircularProgressIndicator()
                : _classes.isEmpty
                ? const Text('No classes found.')
                : ListView.builder(
                  itemCount: _classes.length,
                  itemBuilder: (context, index) {
                    final classItem = _classes[index];
                    return ListTile(
                      title: Text(classItem.name),
                      subtitle: Text('Teacher ID: ${classItem.teacherId}'),
                    );
                  },
                ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.class_), label: 'Class'),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddClassModal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
