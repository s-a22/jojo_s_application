import '../../../core/app_export.dart';

class ActivityLogModel extends Equatable {
  String? id;
  String? type;
  String? title;
  String? description;
  String? timestamp;
  String? iconPath;
  bool? isViewed;

  ActivityLogModel({
    this.id,
    this.type,
    this.title,
    this.description,
    this.timestamp,
    this.iconPath,
    this.isViewed,
  }) {
    id = id ?? '';
    type = type ?? '';
    title = title ?? '';
    description = description ?? '';
    timestamp = timestamp ?? '';
    iconPath = iconPath ?? '';
    isViewed = isViewed ?? false;
  }

  @override
  List<Object?> get props =>
      [id, type, title, description, timestamp, iconPath, isViewed];

  ActivityLogModel copyWith({
    String? id,
    String? type,
    String? title,
    String? description,
    String? timestamp,
    String? iconPath,
    bool? isViewed,
  }) {
    return ActivityLogModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
      iconPath: iconPath ?? this.iconPath,
      isViewed: isViewed ?? this.isViewed,
    );
  }
}
