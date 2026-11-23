import 'dart:convert';
import 'dart:ui';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:material_ui/material_ui.dart';

class Postmanager extends StatefulWidget {
  const new({super.key});

  @override
  State<Postmanager> createState() => _PostmanagerState();
}

class _PostmanagerState extends State<Postmanager> {
  final QuillController _quillController = QuillController.basic();

  @override
  void dispose() {
    _quillController.dispose();
    super.dispose();
  }

  void saveToJson() {
    final String json = jsonEncode(
      _quillController.document.toDelta().toJson(),
    );
    final String text = _quillController.document.toPlainText();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(title: Text("Quill Editor")),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 12),
            child: Column(
              children: [
                QuillSimpleToolbar(
                  controller: _quillController,
                  config: QuillSimpleToolbarConfig(
                    buttonOptions: QuillSimpleToolbarButtonOptions(
                      fontFamily: QuillToolbarFontFamilyButtonOptions(
                        style: TextStyle(color: Colors.white),
                      ),
                      fontSize: QuillToolbarFontSizeButtonOptions(
                        style: TextStyle(color: Colors.white),
                      ),
                      selectHeaderStyleDropdownButton:
                          QuillToolbarSelectHeaderStyleDropdownButtonOptions(
                            textStyle: TextStyle(color: Colors.white),
                          ),
                    ),
                  ),
                ),
                Expanded(
                  child: QuillEditor.basic(
                    controller: _quillController,
                    config: QuillEditorConfig(minHeight: 500.0),
                  ),
                ),
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: saveToJson,
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 50),
                        backgroundColor: const Color.fromARGB(150, 104, 58, 183),
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      child: Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Icon(Icons.save), Text("Guardar JSON")],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: saveToJson,
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 50),
                        backgroundColor: const Color.fromARGB(150, 244, 67, 54),
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      child: Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Icon(Icons.upload), Text("Enviar a API")],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
