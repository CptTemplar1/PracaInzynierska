import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "movieTitle" field.
  String? _movieTitle;
  String get movieTitle => _movieTitle ?? '';
  bool hasMovieTitle() => _movieTitle != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "ticketRef" field.
  DocumentReference? _ticketRef;
  DocumentReference? get ticketRef => _ticketRef;
  bool hasTicketRef() => _ticketRef != null;

  // "balanceBefore" field.
  double? _balanceBefore;
  double get balanceBefore => _balanceBefore ?? 0.0;
  bool hasBalanceBefore() => _balanceBefore != null;

  // "balanceAfter" field.
  double? _balanceAfter;
  double get balanceAfter => _balanceAfter ?? 0.0;
  bool hasBalanceAfter() => _balanceAfter != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _movieTitle = snapshotData['movieTitle'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _value = castToType<double>(snapshotData['value']);
    _status = snapshotData['status'] as String?;
    _ticketRef = snapshotData['ticketRef'] as DocumentReference?;
    _balanceBefore = castToType<double>(snapshotData['balanceBefore']);
    _balanceAfter = castToType<double>(snapshotData['balanceAfter']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  DocumentReference? user,
  String? type,
  String? movieTitle,
  DateTime? date,
  double? value,
  String? status,
  DocumentReference? ticketRef,
  double? balanceBefore,
  double? balanceAfter,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'type': type,
      'movieTitle': movieTitle,
      'date': date,
      'value': value,
      'status': status,
      'ticketRef': ticketRef,
      'balanceBefore': balanceBefore,
      'balanceAfter': balanceAfter,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.type == e2?.type &&
        e1?.movieTitle == e2?.movieTitle &&
        e1?.date == e2?.date &&
        e1?.value == e2?.value &&
        e1?.status == e2?.status &&
        e1?.ticketRef == e2?.ticketRef &&
        e1?.balanceBefore == e2?.balanceBefore &&
        e1?.balanceAfter == e2?.balanceAfter;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.type,
        e?.movieTitle,
        e?.date,
        e?.value,
        e?.status,
        e?.ticketRef,
        e?.balanceBefore,
        e?.balanceAfter
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
