import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KkTubeAccountRecord extends FirestoreRecord {
  KkTubeAccountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UserRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "Nick" field.
  String? _nick;
  String get nick => _nick ?? '';
  bool hasNick() => _nick != null;

  // "CreationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "SubscribedBy" field.
  List<DocumentReference>? _subscribedBy;
  List<DocumentReference> get subscribedBy => _subscribedBy ?? const [];
  bool hasSubscribedBy() => _subscribedBy != null;

  void _initializeFields() {
    _userRef = snapshotData['UserRef'] as DocumentReference?;
    _nick = snapshotData['Nick'] as String?;
    _creationDate = snapshotData['CreationDate'] as DateTime?;
    _subscribedBy = getDataList(snapshotData['SubscribedBy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kkTubeAccount');

  static Stream<KkTubeAccountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KkTubeAccountRecord.fromSnapshot(s));

  static Future<KkTubeAccountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KkTubeAccountRecord.fromSnapshot(s));

  static KkTubeAccountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KkTubeAccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KkTubeAccountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KkTubeAccountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KkTubeAccountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KkTubeAccountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKkTubeAccountRecordData({
  DocumentReference? userRef,
  String? nick,
  DateTime? creationDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserRef': userRef,
      'Nick': nick,
      'CreationDate': creationDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class KkTubeAccountRecordDocumentEquality
    implements Equality<KkTubeAccountRecord> {
  const KkTubeAccountRecordDocumentEquality();

  @override
  bool equals(KkTubeAccountRecord? e1, KkTubeAccountRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.nick == e2?.nick &&
        e1?.creationDate == e2?.creationDate &&
        listEquality.equals(e1?.subscribedBy, e2?.subscribedBy);
  }

  @override
  int hash(KkTubeAccountRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.nick, e?.creationDate, e?.subscribedBy]);

  @override
  bool isValidKey(Object? o) => o is KkTubeAccountRecord;
}
