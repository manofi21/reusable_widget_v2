class UsableBottomSheetRadioItemModel {
  UsableBottomSheetRadioItemModel({required this.key, this.title, this.desc});

  final String key;
  final String? title;
  final String? desc;

  @override
  bool operator ==(covariant UsableBottomSheetRadioItemModel other) {
    if (identical(this, other)) return true;

    return other.key == key && other.title == title && other.desc == desc;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode ^ desc.hashCode;
}
