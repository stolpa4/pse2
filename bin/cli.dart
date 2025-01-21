import 'dart:io' as io;

void main(List<String> args) {
  var verbose = false;
  var name = 'World';
  var iterations = 1;

  for (var i = 0; i < args.length; i++) {
    if (args[i] == '-v' || args[i] == '--verbose') {
      verbose = true;
    } else if ((args[i] == '-n' || args[i] == '--name') &&
        i + 1 < args.length) {
      name = args[i + 1];
      i++; // Skip next item as it is used as parameter for '--name' option
    } else if ((args[i] == '-i' || args[i] == '--iterations') &&
        i + 1 < args.length) {
      iterations = int.tryParse(args[i + 1]) ?? 1;
      i++; // Skip next item as it is used as parameter for '--iterations' option
    }
  }

  for (var i = 0; i < iterations; i++) {
    if (verbose) {
      print('This is verbose output.');
    }
    print('Hello, $name!');
  }
}
