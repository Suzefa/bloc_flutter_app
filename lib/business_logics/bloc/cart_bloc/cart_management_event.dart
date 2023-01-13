part of 'cart_management_bloc.dart';

abstract class CartManagementEvent {}

class CartIncrementEvent extends CartManagementEvent {
  final ExploreItemModel exploreItemModel;
  CartIncrementEvent(this.exploreItemModel);
}
