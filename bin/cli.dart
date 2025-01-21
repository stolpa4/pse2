import 'dart:io' as io;

void main(List<String> prog_args) {
  final args = AppArgs(prog_args);

  for (var i = 0; i < args.iterations; i++) {
    if (args.verbose) {
      print('This is verbose output.');
    }
    print('Hello, ${args.name}!');
  }
}

class AppArgs {
  bool verbose = false;
  String name = 'World';
  int iterations = 1;

  AppArgs(List<String> args) {
    for (var i = 0; i < args.length; i++) {
      if (args[i] == '-v' || args[i] == '--verbose') {
        verbose = true;
      } else if ((args[i] == '-n' || args[i] == '--name') &&
          i + 1 < args.length) {
        name = args[i + 1];
        i++;
      } else if ((args[i] == '-i' || args[i] == '--iterations') &&
          i + 1 < args.length) {
        iterations = int.tryParse(args[i + 1]) ?? 1;
        i++;
      }
    }
  }
}
