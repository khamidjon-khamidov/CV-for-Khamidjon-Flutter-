library posts_page;

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/posts/post.dart';
import 'package:cv_for_khamidjon/domain/repositories/posts_repository.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/ui/components/app_drawer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc/posts_bloc.dart';
part 'bloc/posts_event.dart';
part 'bloc/posts_state.dart';
part 'view/posts.dart';
