import 'dart:io';

import 'package:blog/controllers/add_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _titleContoller = TextEditingController();
  TextEditingController _anonsContoller = TextEditingController();
  TextEditingController _textContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AddController addController = Get.put(AddController());
    late File _image;
    void addArticle() async{
      addController.addArticle(_titleContoller.text, _anonsContoller.text, _textContoller.text, _image);
    }
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Center(
        child: Column(
          children: [
            InkWell(
                onTap: () async {
                  XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                    _image = File(image!.path);
                   },
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5WiuJQWamgq2iVSz7Af-UgVlj3j7fskOC0tUXraUs&s',
                  width: 150,
                  height: 200,
                )),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: _titleContoller,
              decoration: InputDecoration(
                  hintText: 'Title',
                  filled: true,
                  fillColor: Color.fromARGB(176, 158, 158, 158)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _anonsContoller,
              decoration: InputDecoration(
                  hintText: 'Anons',
                  filled: true,
                  fillColor: Color.fromARGB(176, 158, 158, 158)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _textContoller,
              decoration: InputDecoration(
                  hintText: 'Text of Article',
                  filled: true,
                  fillColor: Color.fromARGB(176, 158, 158, 158)),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap:addArticle,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                    child: Text(
                  'Add',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
