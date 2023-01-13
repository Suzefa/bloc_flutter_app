part of 'cart_management_bloc.dart';

abstract class CartManagementState {}

class CartManagementInitial extends CartManagementState {}

class CartCountState extends CartManagementState {
  final int totalItem;
  CartCountState(this.totalItem);
}
