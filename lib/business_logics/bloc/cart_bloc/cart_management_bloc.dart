import 'package:example_project/data/models/explore_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_management_event.dart';
part 'cart_management_state.dart';

class CartManagementBloc extends Bloc<CartManagementEvent, CartManagementState> {
  CartManagementBloc() : super(CartManagementInitial()) {
    on<CartIncrementEvent>(_onIncrementItemsInCart);
  }

  final List<ExploreItemModel> _totalItemsInCart = <ExploreItemModel>[];

  void _onIncrementItemsInCart(CartIncrementEvent cartIncrementEvent,
      Emitter<CartManagementState> emitter) {
    _totalItemsInCart.add(cartIncrementEvent.exploreItemModel);
    emitter(CartCountState(_totalItemsInCart.length));
  }
}
