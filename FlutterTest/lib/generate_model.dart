import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

const pTag = "\$";
const srcJson = "./lib/jsons/"; //json folder
const dstModels = "./lib/models/"; //the output folder

void walk() {
  //iterate
  var src = Directory(srcJson);
  var list = src.listSync();
  var template = File("./lib/template.txt").readAsStringSync();
  File file;
  for (var f in list) {
    if (FileSystemEntity.isFileSync(f.path)) {
      file = File(f.path);
      var paths = path.basename(f.path).split(".");
      String name = paths.first;
      if (paths.last.toLowerCase() != "json" || name.startsWith("_")) return;
      if (name.startsWith("_")) return;
      //now generate the templates
      var map = json.decode(file.readAsStringSync());
      //avoiding import duplicated packages, we use the set for restore the import statements
      var set = <String>{};
      StringBuffer attrs = StringBuffer();
      (map as Map<String, dynamic>).forEach((key, v) {
        // print("==[key: ${key}");
        if (key.startsWith("_")) return;
        //all fields can be void
        attrs.write(getType(v, set, name) + "?");
        attrs.write(" ");
        attrs.write(key);
        attrs.writeln(";");
        attrs.write("    ");
      });

      // print("==[attrs:${attrs.toString()}");

      String className = name[0].toUpperCase() + name.substring(1);
      var dist = format(template, [
        name,
        className,
        className,
        attrs.toString(),
        className,
        className,
        className
      ]);

      // print("==[dist:${dist.toString()}");

      var _import = set.join(";\r\n");
      _import += _import.isEmpty ? "" : ";";
      dist = dist.replaceFirst("%t", _import);

      // print("==[dist:${dist.toString()}");

      //output the results
      String filePath = "$dstModels$name.dart";

      File dstFile = File(filePath);

      try {
        bool exists = dstFile.existsSync();

        if (exists) {
          // debugPrint("==exist");
        } else {
          // debugPrint("==not exist");
          dstFile.createSync(recursive: true);
        }

        File(filePath).writeAsStringSync(dist);
      } catch (e) {
        // debugPrint(e.toString());
        // log(e.toString());
      }
    }
  }
}

String getType(v, Set<String> set, String current) {
  current = current.toLowerCase();
  if (v is bool) {
    return "bool";
  } else if (v is num) {
    return "num";
  } else if (v is Map) {
    return "Map<String, dynamic>";
  } else if (v is List) {
    return "List";
  } else if (v is String) {
    //process the special sign
    if (v.startsWith("$pTag[]")) {
      var className = changeFirstChar(v.substring(3));

      // print("==[className:${className.toString()}");

      if (className.toLowerCase() != current) {
        set.add('import "$className.dart"');
      }
      return "List<${changeFirstChar(className, true)}>";
    } else if (v.startsWith(pTag)) {
      var fileName = changeFirstChar(v.substring(1));

      // print("==[fileName:${fileName.toString()}");

      if (fileName.toLowerCase() != current) {
        set.add('import "$fileName.dart"');
      }
      return changeFirstChar(fileName, true);
    }
    return "String";
  } else {
    return "String";
  }
}

//replace the template signs
String format(String fmt, List<Object> params) {
  int matchIndex = 0;
  String replace(Match m) {
    if (matchIndex < params.length) {
      switch (m[0]) {
        case "%s":
          return params[matchIndex++].toString();
      }
    } else {
      throw Exception("Missing parameter for string format");
    }
    throw Exception("Invalid format string: " + m[0].toString());
  }

  String result = fmt.replaceAllMapped("%s", replace);

  // print("==[replace:${result}");

  return result;
}

String changeFirstChar(String str, [bool upper = false]) {
  return (upper ? str[0].toUpperCase() : str[0].toLowerCase()) +
      str.substring(1);
}

void main() {
  walk();
}
