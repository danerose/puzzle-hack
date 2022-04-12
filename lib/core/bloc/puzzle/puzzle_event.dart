//Dependencies
import 'package:equatable/equatable.dart';

//Models
import 'package:puzzle_hack/core/data/models/tile/tile.dart';

abstract class PuzzleEvent extends Equatable {
  const PuzzleEvent();

  @override
  List<Object> get props => [];
}

class PuzzleInitialized extends PuzzleEvent {
  const PuzzleInitialized({required this.shufflePuzzle});

  final bool shufflePuzzle;

  @override
  List<Object> get props => [shufflePuzzle];
}

class TileTapped extends PuzzleEvent {
  const TileTapped(this.tile);

  final Tile tile;

  @override
  List<Object> get props => [tile];
}

class PuzzleReset extends PuzzleEvent {
  const PuzzleReset();
}
