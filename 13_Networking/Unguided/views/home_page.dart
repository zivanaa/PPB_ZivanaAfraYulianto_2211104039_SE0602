import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notes_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesController controller = Get.put(NotesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Saya'),
        backgroundColor: const Color.fromARGB(255, 102, 122, 235),
        elevation: 5,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Get.snackbar(
                'Aplikasi Catatan',
                'Aplikasi sederhana untuk mencatat ide Anda!',
                backgroundColor: Colors.indigo.shade100,
                colorText: Colors.indigo.shade900,
              );
            },
          )
        ],
      ),
      body: Obx(() {
        return controller.notes.isEmpty
            ? const Center(
                child: Text(
                  'Belum ada catatan.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: controller.notes.length,
                itemBuilder: (context, index) {
                  final note = controller.notes[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        note['title'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      subtitle: Text(note['description'] ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Hapus Catatan",
                            middleText: "Yakin ingin menghapus catatan ini?",
                            textCancel: "Batal",
                            textConfirm: "Hapus",
                            confirmTextColor: Colors.white,
                            onConfirm: () {
                              controller.deleteNoteAt(index);
                              Get.back();
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed('/add');
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Catatan"),
        backgroundColor: Color.fromARGB(255, 102, 122, 235),
      ),
    );
  }
}
