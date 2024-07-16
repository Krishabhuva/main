class PlayController {
  List<String> buttonStatus = List.filled(9, '');
  bool isForX = true;

  String? winner;

  String? setButton(int index) {
    if (buttonStatus[index].isEmpty && winner == null) {
      buttonStatus[index] = isForX ? 'X' : 'O';
      isForX = !isForX;
    }
    winner = _findWinner();
    if (winner != null) {
      return winner;
    }
    return null;
  }

  String? _findWinner() {
    if (buttonStatus[0].isNotEmpty &&
        buttonStatus[0] == buttonStatus[1] &&
        buttonStatus[1] == buttonStatus[2]) {
      return buttonStatus[0];
    } else if (buttonStatus[3].isNotEmpty &&
        buttonStatus[3] == buttonStatus[4] &&
        buttonStatus[4] == buttonStatus[5]) {
      return buttonStatus[3];
    }else if (buttonStatus[6].isNotEmpty &&
        buttonStatus[6] == buttonStatus[7] &&
        buttonStatus[7] == buttonStatus[8]) {
      return buttonStatus[6];
    }else if (buttonStatus[0].isNotEmpty &&
        buttonStatus[0] == buttonStatus[4] &&
        buttonStatus[4] == buttonStatus[8]) {
      return buttonStatus[0];
    } else if(buttonStatus[2].isNotEmpty &&
        buttonStatus[2] == buttonStatus[4] &&
        buttonStatus[4] == buttonStatus[6]) {
      return buttonStatus[2];
    }else if(buttonStatus[0].isNotEmpty &&
        buttonStatus[0] == buttonStatus[3] &&
        buttonStatus[3] == buttonStatus[6]) {
      return buttonStatus[0];
    }else if(buttonStatus[2].isNotEmpty &&
        buttonStatus[2] == buttonStatus[5] &&
        buttonStatus[5] == buttonStatus[8]) {
      return buttonStatus[2];
    }else if(buttonStatus[1].isNotEmpty &&
        buttonStatus[1] == buttonStatus[4] &&
        buttonStatus[4] == buttonStatus[7]) {
      return buttonStatus[1];
    }
    return null;
  }

  void reset() {
    buttonStatus = List.filled(9, '');
    winner = null;
    isForX = true;
  }
}