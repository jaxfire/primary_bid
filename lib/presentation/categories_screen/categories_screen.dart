import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_bid/meta/injection_container.dart';
import 'package:primary_bid/presentation/categories_screen/cubit/categories_cubit.dart';
import 'package:primary_bid/presentation/categories_screen/cubit/categories_state.dart';
import 'package:primary_bid/presentation/product_list_screen/product_list_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  static const routeName = '/categories';

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
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Visibility(
                        visible: state.isLoading,
                        child: const CircularProgressIndicator(),
                      ),
                      // TODO: Could these be combined? One widget with a message.
                      Visibility(
                        visible: state.isNetworkFailure,
                        child: const Text('Check network connection.'),
                      ),
                      Visibility(
                        visible: state.isOtherFailure,
                        child: const Text('Something went wrong. Please try again.'),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ProductListScreen.routeName,
                          arguments: state.data[index],
                        );
                      },
                      title: Text(
                        state.data[index],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
