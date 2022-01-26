//Flutter
import 'package:equatable/equatable.dart';

//Models
import 'package:puzzle_hack/core/data/models/puzzle/position_model.dart';


class Tile extends Equatable {
  const Tile({
    required this.value,
    required this.correctPosition,
    required this.currentPosition,
    this.isWhitespace = false,
  });

  final int value;

  final Position correctPosition;

  final Position currentPosition;

  final bool isWhitespace;

  Tile copyWith({required Position currentPosition}) {
    return Tile(
      value: value,
      correctPosition: correctPosition,
      currentPosition: currentPosition,
      isWhitespace: isWhitespace,
    );
  }

  @override
  List<Object> get props => [
        value,
        correctPosition,
        currentPosition,
        isWhitespace,
      ];
}
