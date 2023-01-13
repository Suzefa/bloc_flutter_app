import 'dart:ui';

class ExploreItemModel {
  String itemImageUrl = "";
  String itemName = "";
  String itemDescription = "";
  double itemPrice = -0.0;
  String isInFavorite = "";
  List<Color> colorOptions = [];

  ExploreItemModel.empty();

  ExploreItemModel.setValues({
    required this.itemName,
    required this.itemDescription,
    required this.itemImageUrl,
    required this.itemPrice,
    required this.isInFavorite,
    required this.colorOptions,
  });

  @override
  String toString() {
    return 'ExploreItemModel{itemImageUrl: $itemImageUrl, itemName: $itemName, itemDescription: $itemDescription, itemPrice: $itemPrice, isInFavorite: $isInFavorite}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExploreItemModel &&
          runtimeType == other.runtimeType &&
          itemImageUrl == other.itemImageUrl &&
          itemName == other.itemName &&
          itemDescription == other.itemDescription &&
          itemPrice == other.itemPrice &&
          isInFavorite == other.isInFavorite;

  @override
  int get hashCode =>
      itemImageUrl.hashCode ^
      itemName.hashCode ^
      itemDescription.hashCode ^
      itemPrice.hashCode ^
      isInFavorite.hashCode;
}