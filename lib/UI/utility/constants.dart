import 'package:intense/imports.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'ImageCompress.dart' as CompressImage;

var kTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  hintStyle: TextStyle(height: 1.5, fontWeight: FontWeight.w300),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
);

String kFontFamily = 'Nunito';

TextStyle ktitleStyle = TextStyle(fontWeight: FontWeight.w800);
TextStyle ksubtitleStyle = TextStyle(fontWeight: FontWeight.w600);

Color kmainColorTeacher = Color.fromRGBO(254, 198, 27, 1.0);
Color kmainColorStudents = Color.fromRGBO(244, 163, 52, 1.0);
Color kmainColorParents = Color.fromRGBO(249, 202, 36, 1.0);

ShapeBorder kRoundedButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(50)),
);

ShapeBorder kBackButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

// CircleBorder kCardCircularShape = CircleBorder(
//   side: BorderSide(width: 1),
// );

ShapeBorder kCardCircularShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(50)),
);

Widget kBackBtn = Icon(
  Icons.arrow_back_ios,
  // color: Colors.black54,
);

kopenPage(BuildContext context, Widget page) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => page,
    ),
  );
}

kopenPageSlide(BuildContext context, Widget page, {required Duration duration}) {
  return Navigator.push(
    context,
    RouteTransition(
      // fade: false,
        widget: page,
        duration: duration),
  );
}

kBuzyPage({Color color = Colors.white}) {
  return Align(
    alignment: Alignment.center,
    child: SpinKitThreeBounce(
      color: color,
      size: 20.0,
    ),
  );
}

kbackBtn(BuildContext context) {
  Navigator.pop(context);
}

kopenPageBottom(BuildContext context, Widget page) {
  Navigator.of(context).push(
    CupertinoPageRoute<bool>(
      fullscreenDialog: true,
      builder: (BuildContext context) => page,
    ),
  );
}

// Future openFileExplorer(
//     FileType _pickingType, bool mounted, BuildContext context,
//     {required String ext}) async {
//   Null _path;
//   if (_pickingType == FileType.image) {
//     if (ext == null) {
//       File file = await CompressImage.takeCompressedPicture(context);
//       if (file != null) _path = file.path as Null;
//       if (!mounted) return '';
//
//       return _path;
//     } else {
//       FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
//         type: _pickingType,
//       );
//       _path = filePickerResult!.paths.first as Null;
//       if (!mounted) return '';
//       return _path;
//     }
//   } else if (_pickingType != FileType.custom) {
//     try {
//       FilePickerResult? filePickerResult =
//       await FilePicker.platform.pickFiles(type: _pickingType);
//       _path = filePickerResult!.paths.first as Null;
//     } on PlatformException catch (e) {
//       print("Unsupported operation" + e.toString());
//     }
//     if (!mounted) return '';
//
//     return _path;
//   } else if (_pickingType == FileType.custom) {
//     try {
//       if (ext == null) ext = 'PDF';
//       FilePickerResult? filePickerResult = await FilePicker.platform
//           .pickFiles(type: _pickingType, allowedExtensions: [ext]);
//       _path = filePickerResult!.paths.first as Null;
//     } on PlatformException catch (e) {
//       print("Unsupported operation" + e.toString());
//     }
//     if (!mounted) return '';
//     return _path;
//   }
// }

SnackBar ksnackBar(BuildContext context, String message) {
  return SnackBar(
    duration: Duration(seconds: 2),
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Theme.of(context).primaryColor,
  );
}

String createCryptoRandomString([int length = 32]) {
  final Random _random = Random.secure();
  var values = List<int>.generate(length, (i) => _random.nextInt(256));

  return base64Url.encode(values);
}

String getChatId(List<String> list) {
  list.sort();
  String chatId = '';

  for (String id in list) {
    chatId = chatId + id;
  }

  return chatId;
}

final kHintTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white70,
  fontFamily: 'OpenSans',
);

final kFFHintTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black38,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kListLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kDecorationStyle = BoxDecoration(
  color: kPrimaryLightColor,
  borderRadius: BorderRadius.circular(29),
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF607D8B),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kFFBoxDecorationStyle = BoxDecoration(
  color: Colors.white38,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const kSecondaryColor = Color(0xFF9949FF);