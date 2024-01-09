import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KkTubeVideoCommentRecord extends FirestoreRecord {
  KkTubeVideoCommentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "postDate" field.
  DateTime? _postDate;
  DateTime? get postDate => _postDate;
  bool hasPostDate() => _postDate != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "videoRef" field.
  DocumentReference? _videoRef;
  DocumentReference? get videoRef => _videoRef;
  bool hasVideoRef() => _videoRef != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _postDate = snapshotData['postDate'] as DateTime?;
    _comment = snapshotData['comment'] as String?;
    _videoRef = snapshotData['videoRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kkTubeVideoComment');

  static Stream<KkTubeVideoCommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KkTubeVideoCommentRecord.fromSnapshot(s));

  static Future<KkTubeVideoCommentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => KkTubeVideoCommentRecord.fromSnapshot(s));

  static KkTubeVideoCommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KkTubeVideoCommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KkTubeVideoCommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KkTubeVideoCommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KkTubeVideoCommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KkTubeVideoCommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKkTubeVideoCommentRecordData({
  DocumentReference? user,
  DateTime? postDate,
  String? comment,
  DocumentReference? videoRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'postDate': postDate,
      'comment': comment,
      'videoRef': videoRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class KkTubeVideoCommentRecordDocumentEquality
    implements Equality<KkTubeVideoCommentRecord> {
  const KkTubeVideoCommentRecordDocumentEquality();

  @override
  bool equals(KkTubeVideoCommentRecord? e1, KkTubeVideoCommentRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.postDate == e2?.postDate &&
        e1?.comment == e2?.comment &&
        e1?.videoRef == e2?.videoRef;
  }

  @override
  int hash(KkTubeVideoCommentRecord? e) => const ListEquality()
      .hash([e?.user, e?.postDate, e?.comment, e?.videoRef]);

  @override
  bool isValidKey(Object? o) => o is KkTubeVideoCommentRecord;
}
