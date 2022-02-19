//Dart
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//Flutter


class ParticlesPainterComponent extends StatefulWidget {
  const ParticlesPainterComponent({
    Key? key,
     required this.colors,
     required this.endX,
     required this.endY,
     required this.initX,
     required this.initY,
  }) : super(key: key);

  final List<Color> colors;
  final double initX;
  final double initY;
  final double endX;
  final double endY;

  @override
  ParticlesPainterComponentState createState() => ParticlesPainterComponentState();
}

class ParticlesPainterComponentState extends State<ParticlesPainterComponent> {
  /// Notifies the animation about the currently elapsed time.
  late ValueNotifier<double> _time;

  /// Updates the [_time].
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Setup time.
    _time = ValueNotifier(0);
    // Setup timer.
    final begin = DateTime.now();
    _timer = Timer.periodic(
      const Duration(
        // Update up to 60 times a second.
        microseconds: 1e6 ~/ 60,
      ),
      (_) {
        _time.value = DateTime.now().difference(begin).inMicroseconds / 1e6;
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      willChange: true,
      painter: Painter(
        _time,
        colors: widget.colors,
        particleCount: 100,
        particleSize: 12,
        blackHoleRadius: 10,
        sprayRadius: 23,
        initY: widget.initY,
        initX: widget.initX,
        endX: widget.endX,
        endY: widget.endY,
      ),
    );
  }
}

/// [CustomPainter] that takes care of actually painting the animation.
class Painter extends CustomPainter {
  /// Constructs a [Painter] given an [time].
  Painter(
    this.time, {
    required this.colors,
    required this.particleCount,
    required this.blackHoleRadius,
    required this.sprayRadius,
    required this.particleSize,
    required this.endX,
    required this.initX,
    required this.endY,
    required this.initY,
  }) : super(repaint: time);
  final ValueListenable<double> time;
  final List<Color> colors;
  final double particleCount;
  final double blackHoleRadius;
  final double sprayRadius;
  final double particleSize;
  final double initX;
  final double initY;
  final double endX;
  final double endY;

  /// Position of the particles.
  // double? _x, _y;
  /// All information about all particles.
  List<List<double>> _particles = [];
  List<Color> _colors = [];
  /// Creates a fresh bunch of particles that will decay over time (until
  /// they reach the destination).
  void _createParticles(Size size) {
    // Random that will be used to create the particles.
    final random = Random();
    // Start without any particles.
    _particles = [];
    _colors = [];
    // Create the particles.
    for (var i = 0; i < particleCount; i++) {
      final angle = pi * 2 / particleCount * i;
      _particles.add([
        initX,
        initY,
        sin(angle) * sprayRadius * random.nextDouble(),
        cos(angle) * sprayRadius * random.nextDouble(),
        0,
      ]);
      _colors.add(colors[Random().nextInt(colors.length)]);
    }
    // _x = endX + random.nextDouble() * (size.width - endX * 2);
    // _y = endY + random.nextDouble() * (size.height - endY * 2);
  }

  @override
  void paint(Canvas canvas, Size size) {
    

    if (_particles.isEmpty != false) {
      _createParticles(size);
    }
    for (var i = 0; i < _particles.length; i++) {
      //Make Cool Animation
      _particles[i][4] = hypot(endX -_particles[i][0], endY -_particles[i][1]);
      //Soft Animation
      // _particles[i][4] = hypot(endX , endY);
      final c = pow(_particles[i][4], 2) / 250;
      _particles[i][2] += (endX - _particles[i][0]) / c;
      _particles[i][3] += (endY - _particles[i][1]) / c;
      _particles[i][2] *= .97;
      _particles[i][0] += _particles[i][2];
      _particles[i][3] *= .97;
      _particles[i][1] += _particles[i][3];
      canvas.drawOval(
        Rect.fromLTWH(
          _particles[i][0],
          _particles[i][1],
          particleSize,
          particleSize,
        ),
        Paint()..color = _colors[i],
      );
      
    }
    _particles.removeWhere((particle) {
      return particle[4] < blackHoleRadius;
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

double hypot(num v1, num v2) {
  return sqrt(pow(v1, 2) + pow(v2, 2));
}
