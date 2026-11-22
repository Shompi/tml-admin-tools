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
                    config: QuillEditorConfig(
                      minHeight: 500.0,
                    ),
                  ),
                ),
                Text("PRUEBA DE TEXTO"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
