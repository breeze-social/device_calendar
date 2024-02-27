/// A calendar on the user's device
class Calendar {
  /// Read-only. The unique identifier for this calendar
  final String? id;

  /// The name of this calendar
  final String? name;

  /// Read-only. If the calendar is read-only
  final bool? isReadOnly;

  /// Read-only. If the calendar is the default
  final bool? isDefault;

  /// Read-only. Color of the calendar
  final int? color;

  // Read-only. Account name associated with the calendar
  final String? accountName;

  /// Read-only. The identifier of the account, associated with the calendar.
  /// It's unique on iOS but same as [accountName] on Android.
  final String? accountIdentifier;

  // Read-only. Account type associated with the calendar
  final String? accountType;

  /// Whether the account supports creating new calendars.
  /// - [Android] Always `true`, even if that's not the case,
  /// since there doesn't seem to be a way to fetch this.
  /// - [iOS] An exception is thrown if you try to create a new calendar on an account
  /// where [accountSupportsCalendarCreation] is `false`.
  final bool accountSupportsCalendarCreation;

  const Calendar({
    this.id,
    this.name,
    this.isReadOnly,
    this.isDefault,
    this.color,
    this.accountName,
    this.accountIdentifier,
    this.accountType,
    this.accountSupportsCalendarCreation = false,
  });

  factory Calendar.fromJson(Map<String, dynamic> json) {
    return Calendar(
      id: json['id'],
      name: json['name'],
      isReadOnly: json['isReadOnly'],
      isDefault: json['isDefault'],
      color: json['color'],
      accountName: json['accountName'],
      accountIdentifier: json['accountIdentifier'],
      accountType: json['accountType'],
      accountSupportsCalendarCreation:
          json['accountSupportsCalendarCreation'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isReadOnly': isReadOnly,
      'isDefault': isDefault,
      'color': color,
      'accountName': accountName,
      'accountIdentifier': accountIdentifier,
      'accountType': accountType,
      'accountSupportsCalendarCreation': accountSupportsCalendarCreation,
    };
  }

  Calendar copyWith({
    String? id,
    String? name,
    bool? isReadOnly,
    bool? isDefault,
    int? color,
    String? accountName,
    String? accountIdentifier,
    String? accountType,
    bool? accountSupportsCalendarCreation,
  }) {
    return Calendar(
      id: id ?? this.id,
      name: name ?? this.name,
      isReadOnly: isReadOnly ?? this.isReadOnly,
      isDefault: isDefault ?? this.isDefault,
      color: color ?? this.color,
      accountName: accountName ?? this.accountName,
      accountIdentifier: accountIdentifier ?? this.accountIdentifier,
      accountType: accountType ?? this.accountType,
      accountSupportsCalendarCreation: accountSupportsCalendarCreation ??
          this.accountSupportsCalendarCreation,
    );
  }
}
