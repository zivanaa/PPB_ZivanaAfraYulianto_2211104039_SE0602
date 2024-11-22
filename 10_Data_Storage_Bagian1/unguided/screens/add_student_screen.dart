import 'package:flutter/material.dart';
import '../helpers/db_helper.dart';
import '../models/student.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nimController = TextEditingController();
  final _addressController = TextEditingController();
  final _hobbyController = TextEditingController();

  Future<void> _submitData() async {
    if (!_formKey.currentState!.validate()) return;

    final student = Student(
      name: _nameController.text,
      nim: _nimController.text,
      address: _addressController.text,
      hobby: _hobbyController.text,
    );

    final dbHelper = DBHelper();
    await dbHelper.insertStudent(student);

    // Show SnackBar for feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data Mahasiswa Berhasil Disimpan!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );

    // Delay to show the SnackBar, then navigate back
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Mahasiswa',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 8, 84, 29),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 230, 250, 240),
              const Color.fromARGB(255, 200, 235, 210)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTextField(_nameController, 'Nama', Icons.person),
                        _buildTextField(
                            _nimController, 'NIM', Icons.confirmation_number),
                        _buildTextField(
                            _addressController, 'Alamat', Icons.location_on),
                        _buildTextField(
                            _hobbyController, 'Hobi', Icons.art_track),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: _submitData,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 8, 84, 29),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shadowColor: Colors.greenAccent,
                            elevation: 5,
                          ),
                          child: Text(
                            'Simpan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color.fromARGB(255, 8, 84, 29)),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 8, 84, 29), width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        validator: (value) =>
            value!.isEmpty ? '$label tidak boleh kosong' : null,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
