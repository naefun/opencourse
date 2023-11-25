import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:open_course/controllers/database_controller.dart';

class CreateCourseForm extends StatefulWidget {
  CreateCourseForm({
    super.key,
    required this.function,
  });

  Function(bool) function;

  @override
  State<CreateCourseForm> createState() => _CreateCourseFormState();
}

class _CreateCourseFormState extends State<CreateCourseForm> {
  TextEditingController descriptionController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  final GlobalKey<FormState> _createCourseFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff111111),
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .5),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      width: 350,
      child: Form(
        key: _createCourseFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // title
            const Text(
              "Create course",
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            // image selector
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xff171717),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () => log("Add image"),
                  child: const Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Color(0xff333333),
                    size: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // course title input
            const Row(
              children: [
                Text(
                  "Course title",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
                Text(
                  "*",
                  style: TextStyle(
                    color: Color(0xffF02828),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: titleController,
              style: const TextStyle(
                color: Color(0xffffffff),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff171717),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(255, 255, 255, 0.4), width: 2),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffffffff), width: 2),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // course description input
            const Text(
              "Course description",
              style: TextStyle(
                color: Color(0xffffffff),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: descriptionController,
              style: const TextStyle(
                color: Color(0xffffffff),
              ),
              minLines: 5,
              maxLines: 5,
              expands: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff171717),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(255, 255, 255, 0.4), width: 2),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffffffff), width: 2),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            LayoutGrid(
              columnSizes: [1.fr, 1.fr],
              rowSizes: const [auto],
              columnGap: 20,
              children: [
                GestureDetector(
                  onTap: () => widget.function(true),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: const Color(0xff171717),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    print(
                        "${titleController.text} ${descriptionController.text}"),
                    DatabaseController.createCourse(
                        titleController.text, descriptionController.text)
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFA500),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Create",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // cancel button
            // create button
          ],
        ),
      ),
    );
  }
}
