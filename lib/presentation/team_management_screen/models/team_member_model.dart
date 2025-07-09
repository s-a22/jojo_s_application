import '../../../core/app_export.dart';

class TeamMemberModel extends Equatable {
  String? id;
  String? name;
  String? role;
  String? profileImage;

  TeamMemberModel({
    this.id,
    this.name,
    this.role,
    this.profileImage,
  }) {
    id = id ?? '';
    name = name ?? '';
    role = role ?? '';
    profileImage = profileImage ?? '';
  }

  @override
  List<Object?> get props => [id, name, role, profileImage];

  TeamMemberModel copyWith({
    String? id,
    String? name,
    String? role,
    String? profileImage,
  }) {
    return TeamMemberModel(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
