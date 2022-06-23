import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:primary_bid/app/injection_container.dart';
import 'package:primary_bid/presentation/categories_screen/cubit/categories_cubit.dart';
import 'package:primary_bid/presentation/categories_screen/cubit/categories_state.dart';
import 'package:primary_bid/presentation/common/colours.dart';
import 'package:primary_bid/presentation/common/styles.dart';
import 'package:primary_bid/presentation/product_list_screen/product_list_screen.dart';
import 'package:primary_bid/presentation/common/widgets/cart_icon/cart_icon.dart';

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
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colours.primary,
            body: SafeArea(
              child: Column(
                children: [
                  const Text(
                    'Categories',
                    style: Styles.screenTitle,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Visibility(
                                visible: state.isLoading,
                                child: const CircularProgressIndicator(
                                  color: Colours.accent,
                                ),
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
                            return Padding(
                              padding: const EdgeInsets.all(12),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colours.accent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                                child: ListTile(
                                  textColor: Colors.white,
                                  title: Text(
                                    state.data[index],
                                    style: const TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      ProductListScreen.routeName,
                                      arguments: state.data[index],
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: CartIcon(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
