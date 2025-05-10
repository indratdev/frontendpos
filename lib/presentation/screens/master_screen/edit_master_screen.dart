import 'package:flutter/material.dart';
import 'package:frontendpos/shared/utils/constants.dart';
import 'package:frontendpos/shared/utils/export.dart';

class EditMasterScreen extends StatefulWidget {
  @override
  _EditMasterScreenState createState() => _EditMasterScreenState();
}

class _EditMasterScreenState extends State<EditMasterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Contoh data yang akan diedit
    nameController.text = "John Doe";
    emailController.text = "johndoe@example.com";
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      // Simpan perubahan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil disimpan!')),
      );
    }
  }

  void _clearFields() {
    setState(() {
      nameController.clear();
      emailController.clear();
    });
  }

  void _deleteMaster() {
    // Logika untuk menghapus data secara permanen
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Konfirmasi'),
        content:
            Text('Apakah Anda yakin ingin menghapus data ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              // Tambahkan logika penghapusan data di sini
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Data berhasil dihapus secara permanen!')),
              );
            },
            child: Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
        actions: [
          IconButton(
            onPressed: _deleteMaster,
            icon: Icon(Icons.delete_forever, color: context.red),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  } else if (!RegExp(
                          r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+')
                      .hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _saveChanges,
                    child: Text('Simpan'),
                  ),
                  ElevatedButton(
                    onPressed: _clearFields,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('Hapus', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
