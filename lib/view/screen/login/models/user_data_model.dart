
class UserDataModel {
  var status;
  String? message;
  Data? data;

  UserDataModel({
    this.status,
    this.message,
    this.data,
  });

  UserDataModel copyWith({
    var status,
    String? message,
    Data? data,
  }) =>
      UserDataModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? countryCode;
  String? mobile;
  String? email;
  String? profileImage;
  String? notification;
  String? isLike;
  String? isComment;
  String? isDownload;
  String? isUpload;
  bool? isPendingUpdate;
  int? relationshipToChild;
  int? totalTags;
  int? preminumTagLimit;
  String? isHigh;
  String? lang;
  String? supportEmail;
  String? hideAlbum;
  String? totalPaidCredit;
  String? totalFreeCredit;
  String? totalAvailableCredit;
  bool? isTourComplete;
  bool? isSubscribeByAdmin;
  String? adminSubscribeEndDate;
  String? referalCode;
  bool? aiReadDot;
  List<Album>? albums;
  String? token;
  bool? isSubscribe;
  dynamic subscription;
  int? remainingDays;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.countryCode,
    this.mobile,
    this.email,
    this.profileImage,
    this.notification,
    this.isLike,
    this.isComment,
    this.isDownload,
    this.isUpload,
    this.isPendingUpdate,
    this.relationshipToChild,
    this.totalTags,
    this.preminumTagLimit,
    this.isHigh,
    this.lang,
    this.supportEmail,
    this.hideAlbum,
    this.totalPaidCredit,
    this.totalFreeCredit,
    this.totalAvailableCredit,
    this.isTourComplete,
    this.isSubscribeByAdmin,
    this.adminSubscribeEndDate,
    this.referalCode,
    this.aiReadDot,
    this.albums,
    this.token,
    this.isSubscribe,
    this.subscription,
    this.remainingDays,
  });

  Data copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? countryCode,
    String? mobile,
    String? email,
    String? profileImage,
    String? notification,
    String? isLike,
    String? isComment,
    String? isDownload,
    String? isUpload,
    bool? isPendingUpdate,
    int? relationshipToChild,
    int? totalTags,
    int? preminumTagLimit,
    String? isHigh,
    String? lang,
    String? supportEmail,
    String? hideAlbum,
    String? totalPaidCredit,
    String? totalFreeCredit,
    String? totalAvailableCredit,
    bool? isTourComplete,
    bool? isSubscribeByAdmin,
    String? adminSubscribeEndDate,
    String? referalCode,
    bool? aiReadDot,
    List<Album>? albums,
    String? token,
    bool? isSubscribe,
    dynamic subscription,
    int? remainingDays,
  }) =>
      Data(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        countryCode: countryCode ?? this.countryCode,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        profileImage: profileImage ?? this.profileImage,
        notification: notification ?? this.notification,
        isLike: isLike ?? this.isLike,
        isComment: isComment ?? this.isComment,
        isDownload: isDownload ?? this.isDownload,
        isUpload: isUpload ?? this.isUpload,
        isPendingUpdate: isPendingUpdate ?? this.isPendingUpdate,
        relationshipToChild: relationshipToChild ?? this.relationshipToChild,
        totalTags: totalTags ?? this.totalTags,
        preminumTagLimit: preminumTagLimit ?? this.preminumTagLimit,
        isHigh: isHigh ?? this.isHigh,
        lang: lang ?? this.lang,
        supportEmail: supportEmail ?? this.supportEmail,
        hideAlbum: hideAlbum ?? this.hideAlbum,
        totalPaidCredit: totalPaidCredit ?? this.totalPaidCredit,
        totalFreeCredit: totalFreeCredit ?? this.totalFreeCredit,
        totalAvailableCredit: totalAvailableCredit ?? this.totalAvailableCredit,
        isTourComplete: isTourComplete ?? this.isTourComplete,
        isSubscribeByAdmin: isSubscribeByAdmin ?? this.isSubscribeByAdmin,
        adminSubscribeEndDate: adminSubscribeEndDate ?? this.adminSubscribeEndDate,
        referalCode: referalCode ?? this.referalCode,
        aiReadDot: aiReadDot ?? this.aiReadDot,
        albums: albums ?? this.albums,
        token: token ?? this.token,
        isSubscribe: isSubscribe ?? this.isSubscribe,
        subscription: subscription ?? this.subscription,
        remainingDays: remainingDays ?? this.remainingDays,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    countryCode: json["country_code"],
    mobile: json["mobile"],
    email: json["email"],
    profileImage: json["profile_image"],
    notification: json["notification"],
    isLike: json["is_like"],
    isComment: json["is_comment"],
    isDownload: json["is_download"],
    isUpload: json["is_upload"],
    isPendingUpdate: json["is_pending_update"],
    relationshipToChild: json["relationship_to_child"],
    totalTags: json["total_tags"],
    preminumTagLimit: json["preminum_tag_limit"],
    isHigh: json["is_high"],
    lang: json["lang"],
    supportEmail: json["support_email"],
    hideAlbum: json["hide_album"],
    totalPaidCredit: json["total_paid_credit"],
    totalFreeCredit: json["total_free_credit"],
    totalAvailableCredit: json["total_available_credit"],
    isTourComplete: json["is_tour_complete"],
    isSubscribeByAdmin: json["is_subscribe_by_admin"],
    adminSubscribeEndDate: json["admin_subscribe_end_date"],
    referalCode: json["referal_code"],
    aiReadDot: json["ai_read_dot"],
    albums: json["albums"] == null ? [] : List<Album>.from(json["albums"]!.map((x) => Album.fromJson(x))),
    token: json["token"],
    isSubscribe: json["is_subscribe"],
    subscription: json["subscription"],
    remainingDays: json["remaining_days"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "country_code": countryCode,
    "mobile": mobile,
    "email": email,
    "profile_image": profileImage,
    "notification": notification,
    "is_like": isLike,
    "is_comment": isComment,
    "is_download": isDownload,
    "is_upload": isUpload,
    "is_pending_update": isPendingUpdate,
    "relationship_to_child": relationshipToChild,
    "total_tags": totalTags,
    "preminum_tag_limit": preminumTagLimit,
    "is_high": isHigh,
    "lang": lang,
    "support_email": supportEmail,
    "hide_album": hideAlbum,
    "total_paid_credit": totalPaidCredit,
    "total_free_credit": totalFreeCredit,
    "total_available_credit": totalAvailableCredit,
    "is_tour_complete": isTourComplete,
    "is_subscribe_by_admin": isSubscribeByAdmin,
    "admin_subscribe_end_date": adminSubscribeEndDate,
    "referal_code": referalCode,
    "ai_read_dot": aiReadDot,
    "albums": albums == null ? [] : List<dynamic>.from(albums!.map((x) => x.toJson())),
    "token": token,
    "is_subscribe": isSubscribe,
    "subscription": subscription,
    "remaining_days": remainingDays,
  };
}

class Album {
  int? id;
  String? name;
  String? profileImage;
  String? userRole;
  String? isChanged;
  String? isHighlight;
  String? isInviteChanged;
  DateTime? createdAt;
  bool? isAlbumHavePhoto;
  int? aiAlbumId;
  List<Child>? children;
  List<Member>? members;

  Album({
    this.id,
    this.name,
    this.profileImage,
    this.userRole,
    this.isChanged,
    this.isHighlight,
    this.isInviteChanged,
    this.createdAt,
    this.isAlbumHavePhoto,
    this.aiAlbumId,
    this.children,
    this.members,
  });

  Album copyWith({
    int? id,
    String? name,
    String? profileImage,
    String? userRole,
    String? isChanged,
    String? isHighlight,
    String? isInviteChanged,
    DateTime? createdAt,
    bool? isAlbumHavePhoto,
    int? aiAlbumId,
    List<Child>? children,
    List<Member>? members,
  }) =>
      Album(
        id: id ?? this.id,
        name: name ?? this.name,
        profileImage: profileImage ?? this.profileImage,
        userRole: userRole ?? this.userRole,
        isChanged: isChanged ?? this.isChanged,
        isHighlight: isHighlight ?? this.isHighlight,
        isInviteChanged: isInviteChanged ?? this.isInviteChanged,
        createdAt: createdAt ?? this.createdAt,
        isAlbumHavePhoto: isAlbumHavePhoto ?? this.isAlbumHavePhoto,
        aiAlbumId: aiAlbumId ?? this.aiAlbumId,
        children: children ?? this.children,
        members: members ?? this.members,
      );

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    id: json["id"],
    name: json["name"],
    profileImage: json["profile_image"],
    userRole: json["user_role"],
    isChanged: json["is_changed"],
    isHighlight: json["is_highlight"],
    isInviteChanged: json["is_invite_changed"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    isAlbumHavePhoto: json["is_album_have_photo"],
    aiAlbumId: json["ai_album_id"],
    children: json["children"] == null ? [] : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
    members: json["members"] == null ? [] : List<Member>.from(json["members"]!.map((x) => Member.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "profile_image": profileImage,
    "user_role": userRole,
    "is_changed": isChanged,
    "is_highlight": isHighlight,
    "is_invite_changed": isInviteChanged,
    "created_at": createdAt?.toIso8601String(),
    "is_album_have_photo": isAlbumHavePhoto,
    "ai_album_id": aiAlbumId,
    "children": children == null ? [] : List<dynamic>.from(children!.map((x) => x.toJson())),
    "members": members == null ? [] : List<dynamic>.from(members!.map((x) => x.toJson())),
  };
}

class Child {
  int? id;
  String? name;
  String? gender;
  String? birthDate;

  Child({
    this.id,
    this.name,
    this.gender,
    this.birthDate,
  });

  Child copyWith({
    int? id,
    String? name,
    String? gender,
    String? birthDate,
  }) =>
      Child(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
      );

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
    birthDate: json["birth_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,
    "birth_date": birthDate,
  };
}

class Member {
  int? id;
  String? name;
  String? profileImage;
  String? email;
  int? relationId;
  String? relation;
  String? role;
  String? isLike;
  String? isComment;
  String? isDownload;
  String? isUpload;

  Member({
    this.id,
    this.name,
    this.profileImage,
    this.email,
    this.relationId,
    this.relation,
    this.role,
    this.isLike,
    this.isComment,
    this.isDownload,
    this.isUpload,
  });

  Member copyWith({
    int? id,
    String? name,
    String? profileImage,
    String? email,
    int? relationId,
    String? relation,
    String? role,
    String? isLike,
    String? isComment,
    String? isDownload,
    String? isUpload,
  }) =>
      Member(
        id: id ?? this.id,
        name: name ?? this.name,
        profileImage: profileImage ?? this.profileImage,
        email: email ?? this.email,
        relationId: relationId ?? this.relationId,
        relation: relation ?? this.relation,
        role: role ?? this.role,
        isLike: isLike ?? this.isLike,
        isComment: isComment ?? this.isComment,
        isDownload: isDownload ?? this.isDownload,
        isUpload: isUpload ?? this.isUpload,
      );

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    id: json["id"],
    name: json["name"],
    profileImage: json["profile_image"],
    email: json["email"],
    relationId: json["relation_id"],
    relation: json["relation"],
    role: json["role"],
    isLike: json["is_like"],
    isComment: json["is_comment"],
    isDownload: json["is_download"],
    isUpload: json["is_upload"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "profile_image": profileImage,
    "email": email,
    "relation_id": relationId,
    "relation": relation,
    "role": role,
    "is_like": isLike,
    "is_comment": isComment,
    "is_download": isDownload,
    "is_upload": isUpload,
  };
}
