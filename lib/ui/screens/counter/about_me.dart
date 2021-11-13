// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

library about_me;

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/main/about_me.dart';
import 'package:cv_for_khamidjon/domain/repositories/main_repository.dart';
import 'package:cv_for_khamidjon/ui/screens/counter/bloc/about_me_event.dart';
import 'package:cv_for_khamidjon/ui/screens/counter/bloc/about_me_state.dart';
import 'package:cv_for_khamidjon/ui/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'bloc/about_me_bloc.dart';
part 'view/about_me_page.dart';
