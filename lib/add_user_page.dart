// lib/add_user_page.dart
import 'package:flutter/material.dart';
import 'api_service.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});
  @override State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final ApiService apiService = ApiService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _submitData() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() { _isLoading = true; });
    try {
      final response = await apiService.createUser(_nameController.text, _jobController.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User "${response['name']}" berhasil ditambahkan! (ID: ${response['id']})')));
      Navigator.of(context).pop(true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal menambah user: $e')));
    } finally { setState(() { _isLoading = false; }); }
  }

  @override void dispose() { _nameController.dispose(); _jobController.dispose(); super.dispose(); }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah User Baru (Create)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(controller: _nameController, decoration: const InputDecoration(labelText: 'Nama Lengkap'), validator: (v){ if (v==null||v.isEmpty) return 'Nama tidak boleh kosong'; return null; }),
            const SizedBox(height: 16),
            TextFormField(controller: _jobController, decoration: const InputDecoration(labelText: 'Pekerjaan'), validator: (v){ if (v==null||v.isEmpty) return 'Pekerjaan tidak boleh kosong'; return null; }),
            const SizedBox(height: 24),
            _isLoading ? const CircularProgressIndicator() : ElevatedButton(onPressed: _submitData, child: const Text('Tambahkan User')),
          ]),
        ),
      ),
    );
  }
}
