/*import 'dart:io';

int jumps(int flagHeight, int bigJump) {
  // Calculate the number of big jumps
  int bigJumpsCount = flagHeight ~/ bigJump;

  // Calculate the remaining height after taking big jumps
  int remainingHeight = flagHeight % bigJump;

  // The total jumps are the big jumps plus the remaining small jumps
  return bigJumpsCount + remainingHeight;
}

void main() {
  int flagHeight = int.parse(stdin.readLineSync()!.trimRight());
  int bigJump = int.parse(stdin.readLineSync()!.trimRight());

  int result = jumps(flagHeight, bigJump);

  print(result);  // Print the result directly instead of writing to a file
}



import 'dart:io';

int maximumNetworks(List<int> speed, int minComps, int speedThreshold) {
  // Sort the speeds in descending order to maximize the sum of speeds in the groups.
  speed.sort((a, b) => b.compareTo(a));

  int groupCount = 0;
  int i = 0;

  while (i < speed.length) {
    int groupSum = 0;
    int compsInGroup = 0;

    // Add components to the current group until the sum meets the threshold.
    while (i < speed.length && compsInGroup < minComps) {
      groupSum += speed[i];
      compsInGroup++;
      i++;
    }

    // If the group meets both the minComps and speedThreshold criteria, it's valid.
    if (compsInGroup >= minComps && groupSum >= speedThreshold) {
      groupCount++;
    } else {
      // If the current group doesn't meet the criteria, break out of the loop.
      break;
    }
  }

  return groupCount;
}

void main() {
  var fout = new File(Platform.environment['OUTPUT_PATH']!).openWrite();

  int speedCount = int.parse(stdin.readLineSync()!.trimRight());

  List<int> speed = [];

  for (int i = 0; i < speedCount; i++) {
    int speedItem = int.parse(stdin.readLineSync()!.trimRight());
    speed.add(speedItem);
  }

  int minComps = int.parse(stdin.readLineSync()!.trimRight());

  int speedThreshold = int.parse(stdin.readLineSync()!.trimRight());

  int result = maximumNetworks(speed, minComps, speedThreshold);

  fout.writeln(result);

  fout.close();
}

*/