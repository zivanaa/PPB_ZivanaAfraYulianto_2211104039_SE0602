import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notes_controller.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesController controller = Get.find();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan Baru'),
        backgroundColor: Color.fromARGB(255, 102, 122, 235),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Judul',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  final title = titleController.text.trim();
                  final description = descriptionController.text.trim();

                  if (title.isNotEmpty && description.isNotEmpty) {
                    controller.addNote(title, description);
                    Get.snackbar(
                      'Catatan Ditambahkan',
                      'Catatan berhasil disimpan!',
                      backgroundColor: Colors.green.shade100,
                      colorText: Colors.green.shade900,
                    );
                    Get.back();
                  } else {
                    Get.snackbar(
                      'Error',
                      'Judul dan deskripsi tidak boleh kosong.',
                      backgroundColor: Colors.red.shade100,
                      colorText: Colors.red.shade900,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 102, 122, 235),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                icon: const Icon(Icons.save),
                label: const Text('Simpan Catatan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
