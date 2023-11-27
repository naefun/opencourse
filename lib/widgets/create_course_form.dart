import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:open_course/controllers/database_controller.dart';
import 'package:open_course/db_models/course.dart';
import 'package:open_course/navigators/navigator_handler.dart';

class CreateCourseForm extends StatefulWidget {
  const CreateCourseForm({
    super.key,
    required this.closeFormFunction,
  });

  final Function(bool) closeFormFunction;

  @override
  State<CreateCourseForm> createState() => _CreateCourseFormState();
}

class _CreateCourseFormState extends State<CreateCourseForm> {
  TextEditingController descriptionController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  Course? createdCourse;

  bool _showSuccessMessage = false;

  final Completer<void> _futureDelayCompleter = Completer<void>();
  bool _futureDelayIsDisposed = false;

  void updateCreatedCourse(Course course) {
    setState(() {
      createdCourse = course;
    });
  }

  void _setShowSuccessMessage(bool value) {
    setState(() {
      _showSuccessMessage = value;
    });
  }

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
              validator: _validateText,
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
              height: 20,
            ),
            _showSuccessMessage == true
                ? successMessage(createdCourse)
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => {
                log("${titleController.text} ${descriptionController.text}"),
                if (_createCourseFormKey.currentState!.validate())
                  {
                    createCourse(
                        titleController.text, descriptionController.text)
                  }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffFFA500),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Create",
                    style: TextStyle(
                        color: Color(0xffffffff), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            LayoutGrid(
              columnSizes: [1.fr, 1.fr],
              rowSizes: const [auto],
              columnGap: 20,
              children: [
                GestureDetector(
                  onTap: () => widget.closeFormFunction(true),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: const Color(0xff171717),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Text(
                      "Close",
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () => {clearFields()},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: const Color(0xff171717),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Clear",
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

  @override
  void dispose() {
    _futureDelayCompleter.complete();
    _futureDelayIsDisposed = true;

    super.dispose();
  }

  void clearFields() {
    titleController.text = "";
    descriptionController.text = "";
  }

  String? _validateText(String? text) {
    if (text == null || text.isEmpty) {
      return "Field cannot be empty";
    }

    return null;
  }

  void createCourse(String title, String desc) async {
    Course? course = await DatabaseController.createCourse(title, desc);
    if (course != null) {
      updateCreatedCourse(course);
    }
    showSuccessMessage();
    clearFields();
    log("something logged");
  }

  Widget successMessage(Course? createdCourse) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xff49C29D)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Course succesfully created.",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => {
              widget.closeFormFunction(true),
              NavigatorHandler.pushCoursePage(context, createdCourse!),
            },
            child: const Text(
              "View",
              style: TextStyle(color: Color(0xff115E46)),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Future<void> showSuccessMessage() async {
    _setShowSuccessMessage(true);

    try {
      await Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _setShowSuccessMessage(false);
        });
      });

      if (_futureDelayIsDisposed) {
        _futureDelayCompleter.complete();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
