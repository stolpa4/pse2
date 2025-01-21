import 'dart:io' as io;

void main(List<String> progArgs) {
  final args = AppArgs(progArgs);

  print("The parsed path is: '${args.path.path}'");
}

class AppArgs {
  late io.File path;

  AppArgs(List<String> args) {
    var pathFound = false;

    for (var i = 0; i < args.length; i++) {
      if (!args[i].startsWith('-')) {
        path = io.File(args[i]);
        pathFound = true;
        break;
      }
    }

    if (!pathFound) {
      throw ArgumentError('File path must be supplied in args');
    }
  }
}
