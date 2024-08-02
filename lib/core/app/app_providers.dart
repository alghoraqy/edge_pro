import 'package:edge_pro/core/app_injection/app_injection.dart';
import 'package:edge_pro/module/user/presentation/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  BlocProvider(
    lazy: false,
    create: (context) => sl<UserBloc>()
      ..add(GetCachedUserEvent()),
  ),];
