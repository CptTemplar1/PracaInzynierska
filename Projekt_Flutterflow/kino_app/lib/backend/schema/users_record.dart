import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "hideHelloPage" field.
  bool? _hideHelloPage;
  bool get hideHelloPage => _hideHelloPage ?? false;
  bool hasHideHelloPage() => _hideHelloPage != null;

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  bool hasBalance() => _balance != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "secretPage" field.
  bool? _secretPage;
  bool get secretPage => _secretPage ?? false;
  bool hasSecretPage() => _secretPage != null;

  // "hasKKTubeAccount" field.
  bool? _hasKKTubeAccount;
  bool get hasKKTubeAccount => _hasKKTubeAccount ?? false;
  bool hasHasKKTubeAccount() => _hasKKTubeAccount != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _uid = snapshotData['uid'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _hideHelloPage = snapshotData['hideHelloPage'] as bool?;
    _balance = castToType<double>(snapshotData['balance']);
    _city = snapshotData['city'] as String?;
    _secretPage = snapshotData['secretPage'] as bool?;
    _hasKKTubeAccount = snapshotData['hasKKTubeAccount'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? firstName,
  String? lastName,
  int? age,
  String? uid,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  DateTime? createdTime,
  bool? hideHelloPage,
  double? balance,
  String? city,
  bool? secretPage,
  bool? hasKKTubeAccount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'uid': uid,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'hideHelloPage': hideHelloPage,
      'balance': balance,
      'city': city,
      'secretPage': secretPage,
      'hasKKTubeAccount': hasKKTubeAccount,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.age == e2?.age &&
        e1?.uid == e2?.uid &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.hideHelloPage == e2?.hideHelloPage &&
        e1?.balance == e2?.balance &&
        e1?.city == e2?.city &&
        e1?.secretPage == e2?.secretPage &&
        e1?.hasKKTubeAccount == e2?.hasKKTubeAccount;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.firstName,
        e?.lastName,
        e?.age,
        e?.uid,
        e?.displayName,
        e?.photoUrl,
        e?.phoneNumber,
        e?.createdTime,
        e?.hideHelloPage,
        e?.balance,
        e?.city,
        e?.secretPage,
        e?.hasKKTubeAccount
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
