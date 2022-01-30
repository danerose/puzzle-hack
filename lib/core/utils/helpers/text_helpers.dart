class TextHelper {

  static String puzzleNumberOfMovesAndTilesLeftLabelText(
    String numberOfMoves, String tilesLeft,
  ) {
    return 'Moves: $numberOfMoves, tiles: $tilesLeft';
  }

  static String successNumberOfMoves(String numberOfMoves) {
    return '$numberOfMoves Moves';
  }

  static String puzzleTileLabelText(String value, String x, String y) {
    return 'Value: $value, position: $x, $y';
  }
}
