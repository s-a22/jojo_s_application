import '../../../core/app_export.dart';

class AccessControlModel extends Equatable {
  String? id;
  String? type;
  String? title;
  String? status;
  String? iconPath;

  AccessControlModel({
    this.id,
    this.type,
    this.title,
    this.status,
    this.iconPath,
  }) {
    id = id ?? '';
    type = type ?? '';
    title = title ?? '';
    status = status ?? '';
    iconPath = iconPath ?? '';
  }

  @override
  List<Object?> get props => [id, type, title, status, iconPath];

  AccessControlModel copyWith({
    String? id,
    String? type,
    String? title,
    String? status,
    String? iconPath,
  }) {
    return AccessControlModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      status: status ?? this.status,
      iconPath: iconPath ?? this.iconPath,
    );
  }
}
