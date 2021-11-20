library skills_page;

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/skills/skill.dart';
import 'package:cv_for_khamidjon/domain/repositories/skills_repository.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/ui/components/app_drawer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bloc/skills_bloc.dart';
part 'bloc/skills_event.dart';
part 'bloc/skills_state.dart';
part 'view/skills.dart';
