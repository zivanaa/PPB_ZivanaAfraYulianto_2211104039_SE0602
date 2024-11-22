import 'package:flutter/material.dart';
import '../helpers/db_helper.dart';
import '../models/student.dart';
import 'add_student_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DBHelper dbHelper;
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    final data = await dbHelper.fetchStudents();
    setState(() {
      students = data;
    });
  }

  Future<void> _deleteStudent(int id) async {
    // Menampilkan dialog konfirmasi sebelum menghapus
    final shouldDelete = await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Hapus Mahasiswa'),
        content: Text('Apakah Anda yakin ingin menghapus mahasiswa ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              'Hapus',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (shouldDelete == true) {
      await dbHelper.deleteStudent(id);
      _loadStudents();

      // Menampilkan SnackBar untuk memberikan umpan balik
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mahasiswa berhasil dihapus!'),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Mahasiswa',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 8, 84, 29),
        elevation: 8,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 194, 233, 210),
              Colors.blue.shade100
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: students.isEmpty
            ? Center(
                child: Text(
                  'Belum ada data mahasiswa.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: students.length,
                itemBuilder: (ctx, index) {
                  final student = students[index];
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 100, 181, 246),
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(
                          student.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            'NIM: ${student.nim}\nAlamat: ${student.address}\nHobi: ${student.hobby}',
                            style: TextStyle(
                              color: Colors.blueGrey.shade700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline, color: Colors.red),
                          onPressed: () => _deleteStudent(student.id!),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 6, 81, 13),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => AddStudentScreen()),
          );
          if (result == true) _loadStudents();

          // Menampilkan SnackBar setelah berhasil menambahkan data
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Mahasiswa berhasil ditambahkan!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: Icon(Icons.person_add, color: Colors.white, size: 30),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
