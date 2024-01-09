import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KkTubeVideosRecord extends FirestoreRecord {
  KkTubeVideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "uploadDate" field.
  DateTime? _uploadDate;
  DateTime? get uploadDate => _uploadDate;
  bool hasUploadDate() => _uploadDate != null;

  // "thumbsUp" field.
  List<DocumentReference>? _thumbsUp;
  List<DocumentReference> get thumbsUp => _thumbsUp ?? const [];
  bool hasThumbsUp() => _thumbsUp != null;

  // "thumbsDown" field.
  List<DocumentReference>? _thumbsDown;
  List<DocumentReference> get thumbsDown => _thumbsDown ?? const [];
  bool hasThumbsDown() => _thumbsDown != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _thumbnail = snapshotData['thumbnail'] as String?;
    _video = snapshotData['video'] as String?;
    _uploadDate = snapshotData['uploadDate'] as DateTime?;
    _thumbsUp = getDataList(snapshotData['thumbsUp']);
    _thumbsDown = getDataList(snapshotData['thumbsDown']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kkTubeVideos');

  static Stream<KkTubeVideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KkTubeVideosRecord.fromSnapshot(s));

  static Future<KkTubeVideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KkTubeVideosRecord.fromSnapshot(s));

  static KkTubeVideosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KkTubeVideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KkTubeVideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KkTubeVideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KkTubeVideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KkTubeVideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKkTubeVideosRecordData({
  DocumentReference? user,
  String? title,
  String? thumbnail,
  String? video,
  DateTime? uploadDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'title': title,
      'thumbnail': thumbnail,
      'video': video,
      'uploadDate': uploadDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class KkTubeVideosRecordDocumentEquality
    implements Equality<KkTubeVideosRecord> {
  const KkTubeVideosRecordDocumentEquality();

  @override
  bool equals(KkTubeVideosRecord? e1, KkTubeVideosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.title == e2?.title &&
        e1?.thumbnail == e2?.thumbnail &&
        e1?.video == e2?.video &&
        e1?.uploadDate == e2?.uploadDate &&
        listEquality.equals(e1?.thumbsUp, e2?.thumbsUp) &&
        listEquality.equals(e1?.thumbsDown, e2?.thumbsDown);
  }

  @override
  int hash(KkTubeVideosRecord? e) => const ListEquality().hash([
        e?.user,
        e?.title,
        e?.thumbnail,
        e?.video,
        e?.uploadDate,
        e?.thumbsUp,
        e?.thumbsDown
      ]);

  @override
  bool isValidKey(Object? o) => o is KkTubeVideosRecord;
}
