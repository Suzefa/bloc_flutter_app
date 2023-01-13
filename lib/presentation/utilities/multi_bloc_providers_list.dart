import 'package:example_project/business_logics/bloc/cart_bloc/cart_management_bloc.dart';
import 'package:example_project/business_logics/cubit/color_option_cubit/color_selector_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocProviderList {
  static List<BlocProvider> providers(){
    return <BlocProvider>[
      BlocProvider<CartManagementBloc>(
        create: (context) => CartManagementBloc(),
      ),
      BlocProvider<ColorSelectorCubit>(
        create: (context) => ColorSelectorCubit(),
      ),
    ];
  }
}