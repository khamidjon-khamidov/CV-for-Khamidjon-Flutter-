library achievements_page;

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cv_for_khamidjon/domain/models/achievements/achievement_group.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/repositories/achievements_repository.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/ui/components/app_drawer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bloc/achievements_bloc.dart';
part 'bloc/achievements_event.dart';
part 'bloc/achievements_state.dart';
part 'view/achievements.dart';
