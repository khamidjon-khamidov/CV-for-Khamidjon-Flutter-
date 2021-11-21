library projects_page;

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/projects/project.dart';
import 'package:cv_for_khamidjon/domain/repositories/projects_repository.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/ui/components/app_drawer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'bloc/projects_bloc.dart';
part 'bloc/projects_event.dart';
part 'bloc/projects_state.dart';
part 'view/projects_page.dart';
