import 'package:exam_ai/components/details.dart';
import 'package:exam_ai/constants/const.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SecondDesktop extends StatefulWidget {
  const SecondDesktop({super.key});

  @override
  State<SecondDesktop> createState() => _SecondDesktopState();
}

class _SecondDesktopState extends State<SecondDesktop> {
  TextEditingController items = TextEditingController();
  PlatformFile? file;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              child: const Text("Creator's page"),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(147, 216, 90, 1),
        toolbarHeight: 30,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(style: BorderStyle.solid)),
            padding: const EdgeInsets.all(10),
            child: topRow(),
          ),

          const SizedBox(
            height: 20,
          ),
          //2
          Details(
            label: 'Subject',
            entries: subject,
            controller: TextEditingController(),
          ),

          const SizedBox(
            height: 30,
          ),

          Details(
              label: 'Exam Options',
              entries: examOption,
              controller: TextEditingController()),

          const SizedBox(
            height: 30,
          ),

          examMethod(),

          const SizedBox(
            height: 30,
          ),

          DropdownMenu(
            label: const Text('Items'),
            dropdownMenuEntries: numba[selectedIndex],
            menuHeight: 234,
            width: 250,
          ),
        ],
      ),
    );
  }

  DropdownMenu<dynamic> examMethod() {
    return DropdownMenu(
      label: Text('Exam Type'),
      dropdownMenuEntries: examType,
      controller: items,
      menuHeight: 234,
      width: 250,
      onSelected: (value) {
        if (value == 'Multiple Choice') {
          setState(() {
            selectedIndex = 0;
          });
        } else if (value == 'Identification') {
          setState(() {
            selectedIndex = 1;
          });
        } else if (value == 'Matching Type') {
          setState(() {
            selectedIndex = 2;
          });
        } else if (value == 'Problem Solving') {
          setState(() {
            selectedIndex = 3;
          });
        } else if (value == 'Essay') {
          setState(() {
            selectedIndex = 4;
          });
        }
      },
    );
  }

  Row topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FilledButton.icon(
          onPressed: () {},
          label: const Text('CREATE'),
          icon: const Icon(Icons.add),
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.purple[900])),
        ),
        const SizedBox(
          width: 30,
        ),
        const DropdownMenu(
          dropdownMenuEntries: [],
          width: 200,
        ),
        const SizedBox(
          width: 50,
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.cached)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
            IconButton(
                onPressed: pickFile,
                icon: const Icon(Icons.cloud_upload_outlined)),
          ],
        ),
        Expanded(
            child: const SizedBox(
          width: 500,
        )),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.file_download_done_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.print)),
      ],
    );
  }

  //for piccking file
  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'txt'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        file = result.files.single;
      });
    }
  }
}
