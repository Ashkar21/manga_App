import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:manga_admin/controller/add_chapter_controller.dart';
import 'package:manga_admin/widgets/drop_down_button2/serchable_dropdown.dart';
import 'package:manga_admin/widgets/text/head_text.dart';

class AddChapterPage extends StatelessWidget {
  const AddChapterPage();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddChapterController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: const HeadText(input: 'Add Chapters'),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.purple[60],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // Registration
                  const Text(
                    "Chapter",
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  //Manga Names
                  const SizedBox(height: 30),
                  SearchableDropDownBtn(
                    controller: ctrl.nameCtrl,
                    hintText: 'Select Manga',
                    items:
                        ctrl.fetchName(), //make in this Type  ['good', 'bad']
                  ),
                  const SizedBox(height: 30),
                  // Chapter No
                  TextField(
                    controller: ctrl.chapternoCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.numbers_outlined),
                      hintText: "Enter Chapters No:",
                      labelText: 'Chapter No:',
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Add pdf or img

                  const SizedBox(height: 40),
                  // Image Url

                  const SizedBox(height: 40),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      ctrl.addChapter();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text('Add'),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



