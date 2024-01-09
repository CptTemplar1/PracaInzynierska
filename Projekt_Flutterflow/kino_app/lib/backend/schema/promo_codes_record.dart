import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromoCodesRecord extends FirestoreRecord {
  PromoCodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "wasUsed" field.
  bool? _wasUsed;
  bool get wasUsed => _wasUsed ?? false;
  bool hasWasUsed() => _wasUsed != null;

  void _initializeFields() {
    _code = snapshotData['code'] as String?;
    _value = castToType<double>(snapshotData['value']);
    _wasUsed = snapshotData['wasUsed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promoCodes');

  static Stream<PromoCodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromoCodesRecord.fromSnapshot(s));

  static Future<PromoCodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromoCodesRecord.fromSnapshot(s));

  static PromoCodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromoCodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromoCodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromoCodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromoCodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromoCodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromoCodesRecordData({
  String? code,
  double? value,
  bool? wasUsed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'value': value,
      'wasUsed': wasUsed,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromoCodesRecordDocumentEquality implements Equality<PromoCodesRecord> {
  const PromoCodesRecordDocumentEquality();

  @override
  bool equals(PromoCodesRecord? e1, PromoCodesRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.value == e2?.value &&
        e1?.wasUsed == e2?.wasUsed;
  }

  @override
  int hash(PromoCodesRecord? e) =>
      const ListEquality().hash([e?.code, e?.value, e?.wasUsed]);

  @override
  bool isValidKey(Object? o) => o is PromoCodesRecord;
}
