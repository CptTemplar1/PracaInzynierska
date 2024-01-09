import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserTicketsRecord extends FirestoreRecord {
  UserTicketsRecord._(
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

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "pricPerTicket" field.
  double? _pricPerTicket;
  double get pricPerTicket => _pricPerTicket ?? 0.0;
  bool hasPricPerTicket() => _pricPerTicket != null;

  // "selectedSeats" field.
  List<String>? _selectedSeats;
  List<String> get selectedSeats => _selectedSeats ?? const [];
  bool hasSelectedSeats() => _selectedSeats != null;

  // "priceSum" field.
  double? _priceSum;
  double get priceSum => _priceSum ?? 0.0;
  bool hasPriceSum() => _priceSum != null;

  // "poster" field.
  String? _poster;
  String get poster => _poster ?? '';
  bool hasPoster() => _poster != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _time = snapshotData['time'] as String?;
    _pricPerTicket = castToType<double>(snapshotData['pricPerTicket']);
    _selectedSeats = getDataList(snapshotData['selectedSeats']);
    _priceSum = castToType<double>(snapshotData['priceSum']);
    _poster = snapshotData['poster'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userTickets');

  static Stream<UserTicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserTicketsRecord.fromSnapshot(s));

  static Future<UserTicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserTicketsRecord.fromSnapshot(s));

  static UserTicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserTicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserTicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserTicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserTicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserTicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserTicketsRecordData({
  DocumentReference? user,
  String? title,
  DateTime? date,
  String? time,
  double? pricPerTicket,
  double? priceSum,
  String? poster,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'title': title,
      'date': date,
      'time': time,
      'pricPerTicket': pricPerTicket,
      'priceSum': priceSum,
      'poster': poster,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserTicketsRecordDocumentEquality implements Equality<UserTicketsRecord> {
  const UserTicketsRecordDocumentEquality();

  @override
  bool equals(UserTicketsRecord? e1, UserTicketsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.title == e2?.title &&
        e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.pricPerTicket == e2?.pricPerTicket &&
        listEquality.equals(e1?.selectedSeats, e2?.selectedSeats) &&
        e1?.priceSum == e2?.priceSum &&
        e1?.poster == e2?.poster;
  }

  @override
  int hash(UserTicketsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.title,
        e?.date,
        e?.time,
        e?.pricPerTicket,
        e?.selectedSeats,
        e?.priceSum,
        e?.poster
      ]);

  @override
  bool isValidKey(Object? o) => o is UserTicketsRecord;
}
