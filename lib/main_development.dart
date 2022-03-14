// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:puzzle_hack/app/app.dart';
import 'package:puzzle_hack/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
