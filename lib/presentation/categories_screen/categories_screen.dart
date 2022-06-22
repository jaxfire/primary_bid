import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/injection_container.dart';
import 'package:primary_bid/presentation/categories_screen/cubit/categories_cubit.dart';
import 'package:primary_bid/presentation/categories_screen/cubit/categories_state.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  final cubit = getIt<CategoriesCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      bloc: cubit,
      builder: (context, state) {
        return const Scaffold(
          body: SafeArea(
            child: Text('TODO'),
          ),
        );
      },
    );
  }
}
