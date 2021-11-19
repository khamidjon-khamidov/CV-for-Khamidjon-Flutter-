library home_pages;

import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/models/bloc_response.dart';
import 'package:cv_for_khamidjon/domain/models/main_pages/about_me.dart';
import 'package:cv_for_khamidjon/domain/repositories/main_repository.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/ui/components/app_drawer.dart';
import 'package:cv_for_khamidjon/ui/components/snackbar.dart';
import 'package:cv_for_khamidjon/ui/theme/colors.dart';
import 'package:cv_for_khamidjon/ui/theme/images.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

part 'bloc/home_pages_bloc.dart';
part 'bloc/home_pages_event.dart';
part 'bloc/home_pages_state.dart';
part 'view/about_me_page.dart';
part 'view/home.dart';
part 'view/widgets/about_me/interest.dart';
part 'view/widgets/about_me/detail_item.dart';
part 'view/widgets/about_me/details.dart';
part 'view/widgets/about_me/experience_text.dart';
part 'view/widgets/about_me/my_interests.dart';
part 'view/widgets/about_me/my_intro.dart';
part 'view/widgets/home/contact_items.dart';
part 'view/widgets/home/contact_link.dart';
part 'view/widgets/home/experience.dart';
part 'view/widgets/home/home_image_experience.dart';
part 'view/widgets/home/home_top_title.dart';
part 'view/widgets/home/skill_description.dart';
