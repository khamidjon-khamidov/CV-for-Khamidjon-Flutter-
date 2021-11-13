library about_me;

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/main/about_me.dart';
import 'package:cv_for_khamidjon/domain/repositories/main_repository.dart';
import 'package:cv_for_khamidjon/ui/components/app_drawer.dart';
import 'package:cv_for_khamidjon/ui/components/snackbar.dart';
import 'package:cv_for_khamidjon/ui/screens/main/about_me/bloc/about_me_event.dart';
import 'package:cv_for_khamidjon/ui/screens/main/about_me/bloc/about_me_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'bloc/about_me_bloc.dart';
part 'view/about_me_page.dart';
