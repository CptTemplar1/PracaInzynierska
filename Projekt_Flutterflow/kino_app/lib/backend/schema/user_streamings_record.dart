import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStreamingsRecord extends FirestoreRecord {
  UserStreamingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "streaming" field.
  DocumentReference? _streaming;
  DocumentReference? get streaming => _streaming;
  bool hasStreaming() => _streaming != null;

  // "movieTitle" field.
  String? _movieTitle;
  String get movieTitle => _movieTitle ?? '';
  bool hasMovieTitle() => _movieTitle != null;

  // "movieGenre" field.
  String? _movieGenre;
  String get movieGenre => _movieGenre ?? '';
  bool hasMovieGenre() => _movieGenre != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _streaming = snapshotData['streaming'] as DocumentReference?;
    _movieTitle = snapshotData['movieTitle'] as String?;
    _movieGenre = snapshotData['movieGenre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userStreamings');

  static Stream<UserStreamingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserStreamingsRecord.fromSnapshot(s));

  static Future<UserStreamingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserStreamingsRecord.fromSnapshot(s));

  static UserStreamingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserStreamingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserStreamingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserStreamingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserStreamingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserStreamingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserStreamingsRecordData({
  DocumentReference? user,
  DocumentReference? streaming,
  String? movieTitle,
  String? movieGenre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'streaming': streaming,
      'movieTitle': movieTitle,
      'movieGenre': movieGenre,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserStreamingsRecordDocumentEquality
    implements Equality<UserStreamingsRecord> {
  const UserStreamingsRecordDocumentEquality();

  @override
  bool equals(UserStreamingsRecord? e1, UserStreamingsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.streaming == e2?.streaming &&
        e1?.movieTitle == e2?.movieTitle &&
        e1?.movieGenre == e2?.movieGenre;
  }

  @override
  int hash(UserStreamingsRecord? e) => const ListEquality()
      .hash([e?.user, e?.streaming, e?.movieTitle, e?.movieGenre]);

  @override
  bool isValidKey(Object? o) => o is UserStreamingsRecord;
}
