import 'dart:math';

import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

//Paddle Settings
const double kPaddleWidth = 100;
const double kPaddleHeight = 20;
//Start position from bottom.
const double kPaddleStartY = 50;
const Color kPaddleColor = Colors.blue;

//Ball Settings
const double kBallRadius = 10;
const double kBallSpeed = 500;
const double kBallMinSpawnAngle = 45;
const double kBallMaxSpawnAngle = 135;
const Color kBallColor = Colors.white;

// Math Settings
const double kRad = pi / 180;

//Button Settings
const double kButtonWidth = 200;
const double kButtonHeight = 50;
const Color kButtonColor = Colors.blue;
const Color kDisabledColor = Colors.black38;

//Countdown Settings
const double kCountdownSize = 200;
const TextStyle kCountdownTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 160,
);

const int kCountdownDuration = 3;

// Wall Settings
const double wallThickness = 10;
const PaletteEntry wallColor = BasicPalette.lightOrange;

const isDebug = true;
const double minFlameTime = 0.016; // 60fps
