import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RepertoryRecord extends FirestoreRecord {
  RepertoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "movie" field.
  DocumentReference? _movie;
  DocumentReference? get movie => _movie;
  bool hasMovie() => _movie != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "pricePerTicket" field.
  double? _pricePerTicket;
  double get pricePerTicket => _pricePerTicket ?? 0.0;
  bool hasPricePerTicket() => _pricePerTicket != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  void _initializeFields() {
    _movie = snapshotData['movie'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _pricePerTicket = castToType<double>(snapshotData['pricePerTicket']);
    _city = snapshotData['city'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('repertory');

  static Stream<RepertoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RepertoryRecord.fromSnapshot(s));

  static Future<RepertoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RepertoryRecord.fromSnapshot(s));

  static RepertoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RepertoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RepertoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RepertoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RepertoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RepertoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRepertoryRecordData({
  DocumentReference? movie,
  DateTime? date,
  double? pricePerTicket,
  String? city,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'movie': movie,
      'date': date,
      'pricePerTicket': pricePerTicket,
      'city': city,
    }.withoutNulls,
  );

  return firestoreData;
}

class RepertoryRecordDocumentEquality implements Equality<RepertoryRecord> {
  const RepertoryRecordDocumentEquality();

  @override
  bool equals(RepertoryRecord? e1, RepertoryRecord? e2) {
    return e1?.movie == e2?.movie &&
        e1?.date == e2?.date &&
        e1?.pricePerTicket == e2?.pricePerTicket &&
        e1?.city == e2?.city;
  }

  @override
  int hash(RepertoryRecord? e) => const ListEquality()
      .hash([e?.movie, e?.date, e?.pricePerTicket, e?.city]);

  @override
  bool isValidKey(Object? o) => o is RepertoryRecord;
}
