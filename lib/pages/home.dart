import 'dart:io';

import 'package:digital_safe/pages/files_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';  // this handles opening of files in the app
import 'package:path_provider/path_provider.dart'; // point to where files in the safe are stored
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
File? file;
  void openFiles(List<PlatformFile> files) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilesPage(files: files, onOpenedFile: openFile),));//this redirects user to the grid view page when multiple files are selected.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text('Digital Safe'),//title of the pages -->appears at the top
        ),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  final result =
                      await FilePicker.platform.pickFiles(allowMultiple: true); // allows picking of multiple files to add to the vault
                  if (result == null) return;
                  final path = result.files.single.path!;
                  openFiles(result.files);
                
                  setState(() {
                    file=File(path); // this is to keep track of where the files save in the vault are stored
                  });
                  

                },
                child:  Text(
                  'Choose file',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink),
                ),
              ),
            
            ],
          ),
          
          
        ],
      ),
      
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!); // this is to open a single file in the app
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory(); // get current dir I am working with
    final newFile = File('${appStorage.path}/${file.name}'); // save a copy of the selected file to the vault
    
    return File(file.path!).copy(newFile.path); // return the new path and view file from there
  }

}
