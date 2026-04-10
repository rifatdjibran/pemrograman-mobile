import 'package:flutter/material.dart';

// Praktikum 4
// import 'basic_widgets/text_widget.dart';
// import 'basic_widgets/image_widget.dart';

// Praktikum 5
// import 'basic_widgets/loading_cupertino.dart';
// import 'basic_widgets/fab_widget.dart';
import 'basic_widgets/scaffold_widget.dart';
// import 'basic_widgets/dialog_widget.dart';
// import 'basic_widgets/textfield_widget.dart';
// import 'basic_widgets/date_picker_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScaffoldWidget(),
      // home: MyTextWidget(),
      // home: MyImageWidget(),
      // home: LoadingCupertino(),
      // home: FabWidget(),
      // home: DialogWidget(),
      // home: TextFieldWidget(),
      // home: DatePickerWidget(),
    );
  }
}