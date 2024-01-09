import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RepertoryDetailsRecord extends FirestoreRecord {
  RepertoryDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "repertory" field.
  DocumentReference? _repertory;
  DocumentReference? get repertory => _repertory;
  bool hasRepertory() => _repertory != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "seat00" field.
  int? _seat00;
  int get seat00 => _seat00 ?? 0;
  bool hasSeat00() => _seat00 != null;

  // "seat01" field.
  int? _seat01;
  int get seat01 => _seat01 ?? 0;
  bool hasSeat01() => _seat01 != null;

  // "seat02" field.
  int? _seat02;
  int get seat02 => _seat02 ?? 0;
  bool hasSeat02() => _seat02 != null;

  // "seat03" field.
  int? _seat03;
  int get seat03 => _seat03 ?? 0;
  bool hasSeat03() => _seat03 != null;

  // "seat04" field.
  int? _seat04;
  int get seat04 => _seat04 ?? 0;
  bool hasSeat04() => _seat04 != null;

  // "seat05" field.
  int? _seat05;
  int get seat05 => _seat05 ?? 0;
  bool hasSeat05() => _seat05 != null;

  // "seat06" field.
  int? _seat06;
  int get seat06 => _seat06 ?? 0;
  bool hasSeat06() => _seat06 != null;

  // "seat10" field.
  int? _seat10;
  int get seat10 => _seat10 ?? 0;
  bool hasSeat10() => _seat10 != null;

  // "seat11" field.
  int? _seat11;
  int get seat11 => _seat11 ?? 0;
  bool hasSeat11() => _seat11 != null;

  // "seat12" field.
  int? _seat12;
  int get seat12 => _seat12 ?? 0;
  bool hasSeat12() => _seat12 != null;

  // "seat13" field.
  int? _seat13;
  int get seat13 => _seat13 ?? 0;
  bool hasSeat13() => _seat13 != null;

  // "seat14" field.
  int? _seat14;
  int get seat14 => _seat14 ?? 0;
  bool hasSeat14() => _seat14 != null;

  // "seat15" field.
  int? _seat15;
  int get seat15 => _seat15 ?? 0;
  bool hasSeat15() => _seat15 != null;

  // "seat16" field.
  int? _seat16;
  int get seat16 => _seat16 ?? 0;
  bool hasSeat16() => _seat16 != null;

  // "seat20" field.
  int? _seat20;
  int get seat20 => _seat20 ?? 0;
  bool hasSeat20() => _seat20 != null;

  // "seat21" field.
  int? _seat21;
  int get seat21 => _seat21 ?? 0;
  bool hasSeat21() => _seat21 != null;

  // "seat22" field.
  int? _seat22;
  int get seat22 => _seat22 ?? 0;
  bool hasSeat22() => _seat22 != null;

  // "seat23" field.
  int? _seat23;
  int get seat23 => _seat23 ?? 0;
  bool hasSeat23() => _seat23 != null;

  // "seat24" field.
  int? _seat24;
  int get seat24 => _seat24 ?? 0;
  bool hasSeat24() => _seat24 != null;

  // "seat25" field.
  int? _seat25;
  int get seat25 => _seat25 ?? 0;
  bool hasSeat25() => _seat25 != null;

  // "seat26" field.
  int? _seat26;
  int get seat26 => _seat26 ?? 0;
  bool hasSeat26() => _seat26 != null;

  // "seat30" field.
  int? _seat30;
  int get seat30 => _seat30 ?? 0;
  bool hasSeat30() => _seat30 != null;

  // "seat31" field.
  int? _seat31;
  int get seat31 => _seat31 ?? 0;
  bool hasSeat31() => _seat31 != null;

  // "seat32" field.
  int? _seat32;
  int get seat32 => _seat32 ?? 0;
  bool hasSeat32() => _seat32 != null;

  // "seat33" field.
  int? _seat33;
  int get seat33 => _seat33 ?? 0;
  bool hasSeat33() => _seat33 != null;

  // "seat34" field.
  int? _seat34;
  int get seat34 => _seat34 ?? 0;
  bool hasSeat34() => _seat34 != null;

  // "seat35" field.
  int? _seat35;
  int get seat35 => _seat35 ?? 0;
  bool hasSeat35() => _seat35 != null;

  // "seat36" field.
  int? _seat36;
  int get seat36 => _seat36 ?? 0;
  bool hasSeat36() => _seat36 != null;

  // "seat40" field.
  int? _seat40;
  int get seat40 => _seat40 ?? 0;
  bool hasSeat40() => _seat40 != null;

  // "seat41" field.
  int? _seat41;
  int get seat41 => _seat41 ?? 0;
  bool hasSeat41() => _seat41 != null;

  // "seat42" field.
  int? _seat42;
  int get seat42 => _seat42 ?? 0;
  bool hasSeat42() => _seat42 != null;

  // "seat43" field.
  int? _seat43;
  int get seat43 => _seat43 ?? 0;
  bool hasSeat43() => _seat43 != null;

  // "seat44" field.
  int? _seat44;
  int get seat44 => _seat44 ?? 0;
  bool hasSeat44() => _seat44 != null;

  // "seat45" field.
  int? _seat45;
  int get seat45 => _seat45 ?? 0;
  bool hasSeat45() => _seat45 != null;

  // "seat46" field.
  int? _seat46;
  int get seat46 => _seat46 ?? 0;
  bool hasSeat46() => _seat46 != null;

  // "seat50" field.
  int? _seat50;
  int get seat50 => _seat50 ?? 0;
  bool hasSeat50() => _seat50 != null;

  // "seat51" field.
  int? _seat51;
  int get seat51 => _seat51 ?? 0;
  bool hasSeat51() => _seat51 != null;

  // "seat52" field.
  int? _seat52;
  int get seat52 => _seat52 ?? 0;
  bool hasSeat52() => _seat52 != null;

  // "seat53" field.
  int? _seat53;
  int get seat53 => _seat53 ?? 0;
  bool hasSeat53() => _seat53 != null;

  // "seat54" field.
  int? _seat54;
  int get seat54 => _seat54 ?? 0;
  bool hasSeat54() => _seat54 != null;

  // "seat55" field.
  int? _seat55;
  int get seat55 => _seat55 ?? 0;
  bool hasSeat55() => _seat55 != null;

  // "seat56" field.
  int? _seat56;
  int get seat56 => _seat56 ?? 0;
  bool hasSeat56() => _seat56 != null;

  // "seat07" field.
  int? _seat07;
  int get seat07 => _seat07 ?? 0;
  bool hasSeat07() => _seat07 != null;

  // "seat08" field.
  int? _seat08;
  int get seat08 => _seat08 ?? 0;
  bool hasSeat08() => _seat08 != null;

  // "seat09" field.
  int? _seat09;
  int get seat09 => _seat09 ?? 0;
  bool hasSeat09() => _seat09 != null;

  // "seat17" field.
  int? _seat17;
  int get seat17 => _seat17 ?? 0;
  bool hasSeat17() => _seat17 != null;

  // "seat18" field.
  int? _seat18;
  int get seat18 => _seat18 ?? 0;
  bool hasSeat18() => _seat18 != null;

  // "seat19" field.
  int? _seat19;
  int get seat19 => _seat19 ?? 0;
  bool hasSeat19() => _seat19 != null;

  // "seat27" field.
  int? _seat27;
  int get seat27 => _seat27 ?? 0;
  bool hasSeat27() => _seat27 != null;

  // "seat28" field.
  int? _seat28;
  int get seat28 => _seat28 ?? 0;
  bool hasSeat28() => _seat28 != null;

  // "seat29" field.
  int? _seat29;
  int get seat29 => _seat29 ?? 0;
  bool hasSeat29() => _seat29 != null;

  // "seat37" field.
  int? _seat37;
  int get seat37 => _seat37 ?? 0;
  bool hasSeat37() => _seat37 != null;

  // "seat38" field.
  int? _seat38;
  int get seat38 => _seat38 ?? 0;
  bool hasSeat38() => _seat38 != null;

  // "seat39" field.
  int? _seat39;
  int get seat39 => _seat39 ?? 0;
  bool hasSeat39() => _seat39 != null;

  // "seat47" field.
  int? _seat47;
  int get seat47 => _seat47 ?? 0;
  bool hasSeat47() => _seat47 != null;

  // "seat48" field.
  int? _seat48;
  int get seat48 => _seat48 ?? 0;
  bool hasSeat48() => _seat48 != null;

  // "seat49" field.
  int? _seat49;
  int get seat49 => _seat49 ?? 0;
  bool hasSeat49() => _seat49 != null;

  // "seat57" field.
  int? _seat57;
  int get seat57 => _seat57 ?? 0;
  bool hasSeat57() => _seat57 != null;

  // "seat58" field.
  int? _seat58;
  int get seat58 => _seat58 ?? 0;
  bool hasSeat58() => _seat58 != null;

  // "seat59" field.
  int? _seat59;
  int get seat59 => _seat59 ?? 0;
  bool hasSeat59() => _seat59 != null;

  // "seat60" field.
  int? _seat60;
  int get seat60 => _seat60 ?? 0;
  bool hasSeat60() => _seat60 != null;

  // "seat61" field.
  int? _seat61;
  int get seat61 => _seat61 ?? 0;
  bool hasSeat61() => _seat61 != null;

  // "seat62" field.
  int? _seat62;
  int get seat62 => _seat62 ?? 0;
  bool hasSeat62() => _seat62 != null;

  // "seat63" field.
  int? _seat63;
  int get seat63 => _seat63 ?? 0;
  bool hasSeat63() => _seat63 != null;

  // "seat64" field.
  int? _seat64;
  int get seat64 => _seat64 ?? 0;
  bool hasSeat64() => _seat64 != null;

  // "seat65" field.
  int? _seat65;
  int get seat65 => _seat65 ?? 0;
  bool hasSeat65() => _seat65 != null;

  // "seat66" field.
  int? _seat66;
  int get seat66 => _seat66 ?? 0;
  bool hasSeat66() => _seat66 != null;

  // "seat67" field.
  int? _seat67;
  int get seat67 => _seat67 ?? 0;
  bool hasSeat67() => _seat67 != null;

  // "seat68" field.
  int? _seat68;
  int get seat68 => _seat68 ?? 0;
  bool hasSeat68() => _seat68 != null;

  // "seat69" field.
  int? _seat69;
  int get seat69 => _seat69 ?? 0;
  bool hasSeat69() => _seat69 != null;

  // "seat70" field.
  int? _seat70;
  int get seat70 => _seat70 ?? 0;
  bool hasSeat70() => _seat70 != null;

  // "seat71" field.
  int? _seat71;
  int get seat71 => _seat71 ?? 0;
  bool hasSeat71() => _seat71 != null;

  // "seat72" field.
  int? _seat72;
  int get seat72 => _seat72 ?? 0;
  bool hasSeat72() => _seat72 != null;

  // "seat73" field.
  int? _seat73;
  int get seat73 => _seat73 ?? 0;
  bool hasSeat73() => _seat73 != null;

  // "seat74" field.
  int? _seat74;
  int get seat74 => _seat74 ?? 0;
  bool hasSeat74() => _seat74 != null;

  // "seat75" field.
  int? _seat75;
  int get seat75 => _seat75 ?? 0;
  bool hasSeat75() => _seat75 != null;

  // "seat76" field.
  int? _seat76;
  int get seat76 => _seat76 ?? 0;
  bool hasSeat76() => _seat76 != null;

  // "seat77" field.
  int? _seat77;
  int get seat77 => _seat77 ?? 0;
  bool hasSeat77() => _seat77 != null;

  // "seat78" field.
  int? _seat78;
  int get seat78 => _seat78 ?? 0;
  bool hasSeat78() => _seat78 != null;

  // "seat79" field.
  int? _seat79;
  int get seat79 => _seat79 ?? 0;
  bool hasSeat79() => _seat79 != null;

  // "seat80" field.
  int? _seat80;
  int get seat80 => _seat80 ?? 0;
  bool hasSeat80() => _seat80 != null;

  // "seat81" field.
  int? _seat81;
  int get seat81 => _seat81 ?? 0;
  bool hasSeat81() => _seat81 != null;

  // "seat82" field.
  int? _seat82;
  int get seat82 => _seat82 ?? 0;
  bool hasSeat82() => _seat82 != null;

  // "seat83" field.
  int? _seat83;
  int get seat83 => _seat83 ?? 0;
  bool hasSeat83() => _seat83 != null;

  // "seat84" field.
  int? _seat84;
  int get seat84 => _seat84 ?? 0;
  bool hasSeat84() => _seat84 != null;

  // "seat85" field.
  int? _seat85;
  int get seat85 => _seat85 ?? 0;
  bool hasSeat85() => _seat85 != null;

  // "seat86" field.
  int? _seat86;
  int get seat86 => _seat86 ?? 0;
  bool hasSeat86() => _seat86 != null;

  // "seat87" field.
  int? _seat87;
  int get seat87 => _seat87 ?? 0;
  bool hasSeat87() => _seat87 != null;

  // "seat88" field.
  int? _seat88;
  int get seat88 => _seat88 ?? 0;
  bool hasSeat88() => _seat88 != null;

  // "seat89" field.
  int? _seat89;
  int get seat89 => _seat89 ?? 0;
  bool hasSeat89() => _seat89 != null;

  // "seat90" field.
  int? _seat90;
  int get seat90 => _seat90 ?? 0;
  bool hasSeat90() => _seat90 != null;

  // "seat91" field.
  int? _seat91;
  int get seat91 => _seat91 ?? 0;
  bool hasSeat91() => _seat91 != null;

  // "seat92" field.
  int? _seat92;
  int get seat92 => _seat92 ?? 0;
  bool hasSeat92() => _seat92 != null;

  // "seat93" field.
  int? _seat93;
  int get seat93 => _seat93 ?? 0;
  bool hasSeat93() => _seat93 != null;

  // "seat94" field.
  int? _seat94;
  int get seat94 => _seat94 ?? 0;
  bool hasSeat94() => _seat94 != null;

  // "seat95" field.
  int? _seat95;
  int get seat95 => _seat95 ?? 0;
  bool hasSeat95() => _seat95 != null;

  // "seat96" field.
  int? _seat96;
  int get seat96 => _seat96 ?? 0;
  bool hasSeat96() => _seat96 != null;

  // "seat97" field.
  int? _seat97;
  int get seat97 => _seat97 ?? 0;
  bool hasSeat97() => _seat97 != null;

  // "seat98" field.
  int? _seat98;
  int get seat98 => _seat98 ?? 0;
  bool hasSeat98() => _seat98 != null;

  // "seat99" field.
  int? _seat99;
  int get seat99 => _seat99 ?? 0;
  bool hasSeat99() => _seat99 != null;

  void _initializeFields() {
    _repertory = snapshotData['repertory'] as DocumentReference?;
    _time = snapshotData['time'] as String?;
    _seat00 = castToType<int>(snapshotData['seat00']);
    _seat01 = castToType<int>(snapshotData['seat01']);
    _seat02 = castToType<int>(snapshotData['seat02']);
    _seat03 = castToType<int>(snapshotData['seat03']);
    _seat04 = castToType<int>(snapshotData['seat04']);
    _seat05 = castToType<int>(snapshotData['seat05']);
    _seat06 = castToType<int>(snapshotData['seat06']);
    _seat10 = castToType<int>(snapshotData['seat10']);
    _seat11 = castToType<int>(snapshotData['seat11']);
    _seat12 = castToType<int>(snapshotData['seat12']);
    _seat13 = castToType<int>(snapshotData['seat13']);
    _seat14 = castToType<int>(snapshotData['seat14']);
    _seat15 = castToType<int>(snapshotData['seat15']);
    _seat16 = castToType<int>(snapshotData['seat16']);
    _seat20 = castToType<int>(snapshotData['seat20']);
    _seat21 = castToType<int>(snapshotData['seat21']);
    _seat22 = castToType<int>(snapshotData['seat22']);
    _seat23 = castToType<int>(snapshotData['seat23']);
    _seat24 = castToType<int>(snapshotData['seat24']);
    _seat25 = castToType<int>(snapshotData['seat25']);
    _seat26 = castToType<int>(snapshotData['seat26']);
    _seat30 = castToType<int>(snapshotData['seat30']);
    _seat31 = castToType<int>(snapshotData['seat31']);
    _seat32 = castToType<int>(snapshotData['seat32']);
    _seat33 = castToType<int>(snapshotData['seat33']);
    _seat34 = castToType<int>(snapshotData['seat34']);
    _seat35 = castToType<int>(snapshotData['seat35']);
    _seat36 = castToType<int>(snapshotData['seat36']);
    _seat40 = castToType<int>(snapshotData['seat40']);
    _seat41 = castToType<int>(snapshotData['seat41']);
    _seat42 = castToType<int>(snapshotData['seat42']);
    _seat43 = castToType<int>(snapshotData['seat43']);
    _seat44 = castToType<int>(snapshotData['seat44']);
    _seat45 = castToType<int>(snapshotData['seat45']);
    _seat46 = castToType<int>(snapshotData['seat46']);
    _seat50 = castToType<int>(snapshotData['seat50']);
    _seat51 = castToType<int>(snapshotData['seat51']);
    _seat52 = castToType<int>(snapshotData['seat52']);
    _seat53 = castToType<int>(snapshotData['seat53']);
    _seat54 = castToType<int>(snapshotData['seat54']);
    _seat55 = castToType<int>(snapshotData['seat55']);
    _seat56 = castToType<int>(snapshotData['seat56']);
    _seat07 = castToType<int>(snapshotData['seat07']);
    _seat08 = castToType<int>(snapshotData['seat08']);
    _seat09 = castToType<int>(snapshotData['seat09']);
    _seat17 = castToType<int>(snapshotData['seat17']);
    _seat18 = castToType<int>(snapshotData['seat18']);
    _seat19 = castToType<int>(snapshotData['seat19']);
    _seat27 = castToType<int>(snapshotData['seat27']);
    _seat28 = castToType<int>(snapshotData['seat28']);
    _seat29 = castToType<int>(snapshotData['seat29']);
    _seat37 = castToType<int>(snapshotData['seat37']);
    _seat38 = castToType<int>(snapshotData['seat38']);
    _seat39 = castToType<int>(snapshotData['seat39']);
    _seat47 = castToType<int>(snapshotData['seat47']);
    _seat48 = castToType<int>(snapshotData['seat48']);
    _seat49 = castToType<int>(snapshotData['seat49']);
    _seat57 = castToType<int>(snapshotData['seat57']);
    _seat58 = castToType<int>(snapshotData['seat58']);
    _seat59 = castToType<int>(snapshotData['seat59']);
    _seat60 = castToType<int>(snapshotData['seat60']);
    _seat61 = castToType<int>(snapshotData['seat61']);
    _seat62 = castToType<int>(snapshotData['seat62']);
    _seat63 = castToType<int>(snapshotData['seat63']);
    _seat64 = castToType<int>(snapshotData['seat64']);
    _seat65 = castToType<int>(snapshotData['seat65']);
    _seat66 = castToType<int>(snapshotData['seat66']);
    _seat67 = castToType<int>(snapshotData['seat67']);
    _seat68 = castToType<int>(snapshotData['seat68']);
    _seat69 = castToType<int>(snapshotData['seat69']);
    _seat70 = castToType<int>(snapshotData['seat70']);
    _seat71 = castToType<int>(snapshotData['seat71']);
    _seat72 = castToType<int>(snapshotData['seat72']);
    _seat73 = castToType<int>(snapshotData['seat73']);
    _seat74 = castToType<int>(snapshotData['seat74']);
    _seat75 = castToType<int>(snapshotData['seat75']);
    _seat76 = castToType<int>(snapshotData['seat76']);
    _seat77 = castToType<int>(snapshotData['seat77']);
    _seat78 = castToType<int>(snapshotData['seat78']);
    _seat79 = castToType<int>(snapshotData['seat79']);
    _seat80 = castToType<int>(snapshotData['seat80']);
    _seat81 = castToType<int>(snapshotData['seat81']);
    _seat82 = castToType<int>(snapshotData['seat82']);
    _seat83 = castToType<int>(snapshotData['seat83']);
    _seat84 = castToType<int>(snapshotData['seat84']);
    _seat85 = castToType<int>(snapshotData['seat85']);
    _seat86 = castToType<int>(snapshotData['seat86']);
    _seat87 = castToType<int>(snapshotData['seat87']);
    _seat88 = castToType<int>(snapshotData['seat88']);
    _seat89 = castToType<int>(snapshotData['seat89']);
    _seat90 = castToType<int>(snapshotData['seat90']);
    _seat91 = castToType<int>(snapshotData['seat91']);
    _seat92 = castToType<int>(snapshotData['seat92']);
    _seat93 = castToType<int>(snapshotData['seat93']);
    _seat94 = castToType<int>(snapshotData['seat94']);
    _seat95 = castToType<int>(snapshotData['seat95']);
    _seat96 = castToType<int>(snapshotData['seat96']);
    _seat97 = castToType<int>(snapshotData['seat97']);
    _seat98 = castToType<int>(snapshotData['seat98']);
    _seat99 = castToType<int>(snapshotData['seat99']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('repertoryDetails');

  static Stream<RepertoryDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RepertoryDetailsRecord.fromSnapshot(s));

  static Future<RepertoryDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RepertoryDetailsRecord.fromSnapshot(s));

  static RepertoryDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RepertoryDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RepertoryDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RepertoryDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RepertoryDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RepertoryDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRepertoryDetailsRecordData({
  DocumentReference? repertory,
  String? time,
  int? seat00,
  int? seat01,
  int? seat02,
  int? seat03,
  int? seat04,
  int? seat05,
  int? seat06,
  int? seat10,
  int? seat11,
  int? seat12,
  int? seat13,
  int? seat14,
  int? seat15,
  int? seat16,
  int? seat20,
  int? seat21,
  int? seat22,
  int? seat23,
  int? seat24,
  int? seat25,
  int? seat26,
  int? seat30,
  int? seat31,
  int? seat32,
  int? seat33,
  int? seat34,
  int? seat35,
  int? seat36,
  int? seat40,
  int? seat41,
  int? seat42,
  int? seat43,
  int? seat44,
  int? seat45,
  int? seat46,
  int? seat50,
  int? seat51,
  int? seat52,
  int? seat53,
  int? seat54,
  int? seat55,
  int? seat56,
  int? seat07,
  int? seat08,
  int? seat09,
  int? seat17,
  int? seat18,
  int? seat19,
  int? seat27,
  int? seat28,
  int? seat29,
  int? seat37,
  int? seat38,
  int? seat39,
  int? seat47,
  int? seat48,
  int? seat49,
  int? seat57,
  int? seat58,
  int? seat59,
  int? seat60,
  int? seat61,
  int? seat62,
  int? seat63,
  int? seat64,
  int? seat65,
  int? seat66,
  int? seat67,
  int? seat68,
  int? seat69,
  int? seat70,
  int? seat71,
  int? seat72,
  int? seat73,
  int? seat74,
  int? seat75,
  int? seat76,
  int? seat77,
  int? seat78,
  int? seat79,
  int? seat80,
  int? seat81,
  int? seat82,
  int? seat83,
  int? seat84,
  int? seat85,
  int? seat86,
  int? seat87,
  int? seat88,
  int? seat89,
  int? seat90,
  int? seat91,
  int? seat92,
  int? seat93,
  int? seat94,
  int? seat95,
  int? seat96,
  int? seat97,
  int? seat98,
  int? seat99,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'repertory': repertory,
      'time': time,
      'seat00': seat00,
      'seat01': seat01,
      'seat02': seat02,
      'seat03': seat03,
      'seat04': seat04,
      'seat05': seat05,
      'seat06': seat06,
      'seat10': seat10,
      'seat11': seat11,
      'seat12': seat12,
      'seat13': seat13,
      'seat14': seat14,
      'seat15': seat15,
      'seat16': seat16,
      'seat20': seat20,
      'seat21': seat21,
      'seat22': seat22,
      'seat23': seat23,
      'seat24': seat24,
      'seat25': seat25,
      'seat26': seat26,
      'seat30': seat30,
      'seat31': seat31,
      'seat32': seat32,
      'seat33': seat33,
      'seat34': seat34,
      'seat35': seat35,
      'seat36': seat36,
      'seat40': seat40,
      'seat41': seat41,
      'seat42': seat42,
      'seat43': seat43,
      'seat44': seat44,
      'seat45': seat45,
      'seat46': seat46,
      'seat50': seat50,
      'seat51': seat51,
      'seat52': seat52,
      'seat53': seat53,
      'seat54': seat54,
      'seat55': seat55,
      'seat56': seat56,
      'seat07': seat07,
      'seat08': seat08,
      'seat09': seat09,
      'seat17': seat17,
      'seat18': seat18,
      'seat19': seat19,
      'seat27': seat27,
      'seat28': seat28,
      'seat29': seat29,
      'seat37': seat37,
      'seat38': seat38,
      'seat39': seat39,
      'seat47': seat47,
      'seat48': seat48,
      'seat49': seat49,
      'seat57': seat57,
      'seat58': seat58,
      'seat59': seat59,
      'seat60': seat60,
      'seat61': seat61,
      'seat62': seat62,
      'seat63': seat63,
      'seat64': seat64,
      'seat65': seat65,
      'seat66': seat66,
      'seat67': seat67,
      'seat68': seat68,
      'seat69': seat69,
      'seat70': seat70,
      'seat71': seat71,
      'seat72': seat72,
      'seat73': seat73,
      'seat74': seat74,
      'seat75': seat75,
      'seat76': seat76,
      'seat77': seat77,
      'seat78': seat78,
      'seat79': seat79,
      'seat80': seat80,
      'seat81': seat81,
      'seat82': seat82,
      'seat83': seat83,
      'seat84': seat84,
      'seat85': seat85,
      'seat86': seat86,
      'seat87': seat87,
      'seat88': seat88,
      'seat89': seat89,
      'seat90': seat90,
      'seat91': seat91,
      'seat92': seat92,
      'seat93': seat93,
      'seat94': seat94,
      'seat95': seat95,
      'seat96': seat96,
      'seat97': seat97,
      'seat98': seat98,
      'seat99': seat99,
    }.withoutNulls,
  );

  return firestoreData;
}

class RepertoryDetailsRecordDocumentEquality
    implements Equality<RepertoryDetailsRecord> {
  const RepertoryDetailsRecordDocumentEquality();

  @override
  bool equals(RepertoryDetailsRecord? e1, RepertoryDetailsRecord? e2) {
    return e1?.repertory == e2?.repertory &&
        e1?.time == e2?.time &&
        e1?.seat00 == e2?.seat00 &&
        e1?.seat01 == e2?.seat01 &&
        e1?.seat02 == e2?.seat02 &&
        e1?.seat03 == e2?.seat03 &&
        e1?.seat04 == e2?.seat04 &&
        e1?.seat05 == e2?.seat05 &&
        e1?.seat06 == e2?.seat06 &&
        e1?.seat10 == e2?.seat10 &&
        e1?.seat11 == e2?.seat11 &&
        e1?.seat12 == e2?.seat12 &&
        e1?.seat13 == e2?.seat13 &&
        e1?.seat14 == e2?.seat14 &&
        e1?.seat15 == e2?.seat15 &&
        e1?.seat16 == e2?.seat16 &&
        e1?.seat20 == e2?.seat20 &&
        e1?.seat21 == e2?.seat21 &&
        e1?.seat22 == e2?.seat22 &&
        e1?.seat23 == e2?.seat23 &&
        e1?.seat24 == e2?.seat24 &&
        e1?.seat25 == e2?.seat25 &&
        e1?.seat26 == e2?.seat26 &&
        e1?.seat30 == e2?.seat30 &&
        e1?.seat31 == e2?.seat31 &&
        e1?.seat32 == e2?.seat32 &&
        e1?.seat33 == e2?.seat33 &&
        e1?.seat34 == e2?.seat34 &&
        e1?.seat35 == e2?.seat35 &&
        e1?.seat36 == e2?.seat36 &&
        e1?.seat40 == e2?.seat40 &&
        e1?.seat41 == e2?.seat41 &&
        e1?.seat42 == e2?.seat42 &&
        e1?.seat43 == e2?.seat43 &&
        e1?.seat44 == e2?.seat44 &&
        e1?.seat45 == e2?.seat45 &&
        e1?.seat46 == e2?.seat46 &&
        e1?.seat50 == e2?.seat50 &&
        e1?.seat51 == e2?.seat51 &&
        e1?.seat52 == e2?.seat52 &&
        e1?.seat53 == e2?.seat53 &&
        e1?.seat54 == e2?.seat54 &&
        e1?.seat55 == e2?.seat55 &&
        e1?.seat56 == e2?.seat56 &&
        e1?.seat07 == e2?.seat07 &&
        e1?.seat08 == e2?.seat08 &&
        e1?.seat09 == e2?.seat09 &&
        e1?.seat17 == e2?.seat17 &&
        e1?.seat18 == e2?.seat18 &&
        e1?.seat19 == e2?.seat19 &&
        e1?.seat27 == e2?.seat27 &&
        e1?.seat28 == e2?.seat28 &&
        e1?.seat29 == e2?.seat29 &&
        e1?.seat37 == e2?.seat37 &&
        e1?.seat38 == e2?.seat38 &&
        e1?.seat39 == e2?.seat39 &&
        e1?.seat47 == e2?.seat47 &&
        e1?.seat48 == e2?.seat48 &&
        e1?.seat49 == e2?.seat49 &&
        e1?.seat57 == e2?.seat57 &&
        e1?.seat58 == e2?.seat58 &&
        e1?.seat59 == e2?.seat59 &&
        e1?.seat60 == e2?.seat60 &&
        e1?.seat61 == e2?.seat61 &&
        e1?.seat62 == e2?.seat62 &&
        e1?.seat63 == e2?.seat63 &&
        e1?.seat64 == e2?.seat64 &&
        e1?.seat65 == e2?.seat65 &&
        e1?.seat66 == e2?.seat66 &&
        e1?.seat67 == e2?.seat67 &&
        e1?.seat68 == e2?.seat68 &&
        e1?.seat69 == e2?.seat69 &&
        e1?.seat70 == e2?.seat70 &&
        e1?.seat71 == e2?.seat71 &&
        e1?.seat72 == e2?.seat72 &&
        e1?.seat73 == e2?.seat73 &&
        e1?.seat74 == e2?.seat74 &&
        e1?.seat75 == e2?.seat75 &&
        e1?.seat76 == e2?.seat76 &&
        e1?.seat77 == e2?.seat77 &&
        e1?.seat78 == e2?.seat78 &&
        e1?.seat79 == e2?.seat79 &&
        e1?.seat80 == e2?.seat80 &&
        e1?.seat81 == e2?.seat81 &&
        e1?.seat82 == e2?.seat82 &&
        e1?.seat83 == e2?.seat83 &&
        e1?.seat84 == e2?.seat84 &&
        e1?.seat85 == e2?.seat85 &&
        e1?.seat86 == e2?.seat86 &&
        e1?.seat87 == e2?.seat87 &&
        e1?.seat88 == e2?.seat88 &&
        e1?.seat89 == e2?.seat89 &&
        e1?.seat90 == e2?.seat90 &&
        e1?.seat91 == e2?.seat91 &&
        e1?.seat92 == e2?.seat92 &&
        e1?.seat93 == e2?.seat93 &&
        e1?.seat94 == e2?.seat94 &&
        e1?.seat95 == e2?.seat95 &&
        e1?.seat96 == e2?.seat96 &&
        e1?.seat97 == e2?.seat97 &&
        e1?.seat98 == e2?.seat98 &&
        e1?.seat99 == e2?.seat99;
  }

  @override
  int hash(RepertoryDetailsRecord? e) => const ListEquality().hash([
        e?.repertory,
        e?.time,
        e?.seat00,
        e?.seat01,
        e?.seat02,
        e?.seat03,
        e?.seat04,
        e?.seat05,
        e?.seat06,
        e?.seat10,
        e?.seat11,
        e?.seat12,
        e?.seat13,
        e?.seat14,
        e?.seat15,
        e?.seat16,
        e?.seat20,
        e?.seat21,
        e?.seat22,
        e?.seat23,
        e?.seat24,
        e?.seat25,
        e?.seat26,
        e?.seat30,
        e?.seat31,
        e?.seat32,
        e?.seat33,
        e?.seat34,
        e?.seat35,
        e?.seat36,
        e?.seat40,
        e?.seat41,
        e?.seat42,
        e?.seat43,
        e?.seat44,
        e?.seat45,
        e?.seat46,
        e?.seat50,
        e?.seat51,
        e?.seat52,
        e?.seat53,
        e?.seat54,
        e?.seat55,
        e?.seat56,
        e?.seat07,
        e?.seat08,
        e?.seat09,
        e?.seat17,
        e?.seat18,
        e?.seat19,
        e?.seat27,
        e?.seat28,
        e?.seat29,
        e?.seat37,
        e?.seat38,
        e?.seat39,
        e?.seat47,
        e?.seat48,
        e?.seat49,
        e?.seat57,
        e?.seat58,
        e?.seat59,
        e?.seat60,
        e?.seat61,
        e?.seat62,
        e?.seat63,
        e?.seat64,
        e?.seat65,
        e?.seat66,
        e?.seat67,
        e?.seat68,
        e?.seat69,
        e?.seat70,
        e?.seat71,
        e?.seat72,
        e?.seat73,
        e?.seat74,
        e?.seat75,
        e?.seat76,
        e?.seat77,
        e?.seat78,
        e?.seat79,
        e?.seat80,
        e?.seat81,
        e?.seat82,
        e?.seat83,
        e?.seat84,
        e?.seat85,
        e?.seat86,
        e?.seat87,
        e?.seat88,
        e?.seat89,
        e?.seat90,
        e?.seat91,
        e?.seat92,
        e?.seat93,
        e?.seat94,
        e?.seat95,
        e?.seat96,
        e?.seat97,
        e?.seat98,
        e?.seat99
      ]);

  @override
  bool isValidKey(Object? o) => o is RepertoryDetailsRecord;
}
