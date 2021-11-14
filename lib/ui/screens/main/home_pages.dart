library home_pages;

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/main_pages/about_me.dart';
import 'package:cv_for_khamidjon/domain/repositories/main_repository.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/ui/components/app_drawer.dart';
import 'package:cv_for_khamidjon/ui/components/snackbar.dart';
import 'package:cv_for_khamidjon/ui/screens/main/bloc/home_pages_event.dart';
import 'package:cv_for_khamidjon/ui/screens/main/bloc/home_pages_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'bloc/home_pages_bloc.dart';
part 'view/about_me_page.dart';
part 'view/home.dart';
