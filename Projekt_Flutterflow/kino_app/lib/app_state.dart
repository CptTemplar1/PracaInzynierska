import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _selectedSeats = [];
  List<String> get selectedSeats => _selectedSeats;
  set selectedSeats(List<String> _value) {
    _selectedSeats = _value;
  }

  void addToSelectedSeats(String _value) {
    _selectedSeats.add(_value);
  }

  void removeFromSelectedSeats(String _value) {
    _selectedSeats.remove(_value);
  }

  void removeAtIndexFromSelectedSeats(int _index) {
    _selectedSeats.removeAt(_index);
  }

  void updateSelectedSeatsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _selectedSeats[_index] = updateFn(_selectedSeats[_index]);
  }

  void insertAtIndexInSelectedSeats(int _index, String _value) {
    _selectedSeats.insert(_index, _value);
  }

  int _seat00 = 0;
  int get seat00 => _seat00;
  set seat00(int _value) {
    _seat00 = _value;
  }

  int _seat01 = 0;
  int get seat01 => _seat01;
  set seat01(int _value) {
    _seat01 = _value;
  }

  int _seat02 = 0;
  int get seat02 => _seat02;
  set seat02(int _value) {
    _seat02 = _value;
  }

  int _seat03 = 0;
  int get seat03 => _seat03;
  set seat03(int _value) {
    _seat03 = _value;
  }

  int _seat04 = 0;
  int get seat04 => _seat04;
  set seat04(int _value) {
    _seat04 = _value;
  }

  int _seat05 = 0;
  int get seat05 => _seat05;
  set seat05(int _value) {
    _seat05 = _value;
  }

  int _seat06 = 0;
  int get seat06 => _seat06;
  set seat06(int _value) {
    _seat06 = _value;
  }

  int _seat10 = 0;
  int get seat10 => _seat10;
  set seat10(int _value) {
    _seat10 = _value;
  }

  int _seat11 = 0;
  int get seat11 => _seat11;
  set seat11(int _value) {
    _seat11 = _value;
  }

  int _seat12 = 0;
  int get seat12 => _seat12;
  set seat12(int _value) {
    _seat12 = _value;
  }

  int _seat13 = 0;
  int get seat13 => _seat13;
  set seat13(int _value) {
    _seat13 = _value;
  }

  int _seat14 = 0;
  int get seat14 => _seat14;
  set seat14(int _value) {
    _seat14 = _value;
  }

  int _seat15 = 0;
  int get seat15 => _seat15;
  set seat15(int _value) {
    _seat15 = _value;
  }

  int _seat16 = 0;
  int get seat16 => _seat16;
  set seat16(int _value) {
    _seat16 = _value;
  }

  int _seat20 = 0;
  int get seat20 => _seat20;
  set seat20(int _value) {
    _seat20 = _value;
  }

  int _seat21 = 0;
  int get seat21 => _seat21;
  set seat21(int _value) {
    _seat21 = _value;
  }

  int _seat22 = 0;
  int get seat22 => _seat22;
  set seat22(int _value) {
    _seat22 = _value;
  }

  int _seat23 = 0;
  int get seat23 => _seat23;
  set seat23(int _value) {
    _seat23 = _value;
  }

  int _seat24 = 0;
  int get seat24 => _seat24;
  set seat24(int _value) {
    _seat24 = _value;
  }

  int _seat25 = 0;
  int get seat25 => _seat25;
  set seat25(int _value) {
    _seat25 = _value;
  }

  int _seat26 = 0;
  int get seat26 => _seat26;
  set seat26(int _value) {
    _seat26 = _value;
  }

  int _seat30 = 0;
  int get seat30 => _seat30;
  set seat30(int _value) {
    _seat30 = _value;
  }

  int _seat31 = 0;
  int get seat31 => _seat31;
  set seat31(int _value) {
    _seat31 = _value;
  }

  int _seat32 = 0;
  int get seat32 => _seat32;
  set seat32(int _value) {
    _seat32 = _value;
  }

  int _seat33 = 0;
  int get seat33 => _seat33;
  set seat33(int _value) {
    _seat33 = _value;
  }

  int _seat34 = 0;
  int get seat34 => _seat34;
  set seat34(int _value) {
    _seat34 = _value;
  }

  int _seat35 = 0;
  int get seat35 => _seat35;
  set seat35(int _value) {
    _seat35 = _value;
  }

  int _seat36 = 0;
  int get seat36 => _seat36;
  set seat36(int _value) {
    _seat36 = _value;
  }

  int _seat40 = 0;
  int get seat40 => _seat40;
  set seat40(int _value) {
    _seat40 = _value;
  }

  int _seat41 = 0;
  int get seat41 => _seat41;
  set seat41(int _value) {
    _seat41 = _value;
  }

  int _seat42 = 0;
  int get seat42 => _seat42;
  set seat42(int _value) {
    _seat42 = _value;
  }

  int _seat43 = 0;
  int get seat43 => _seat43;
  set seat43(int _value) {
    _seat43 = _value;
  }

  int _seat44 = 0;
  int get seat44 => _seat44;
  set seat44(int _value) {
    _seat44 = _value;
  }

  int _seat45 = 0;
  int get seat45 => _seat45;
  set seat45(int _value) {
    _seat45 = _value;
  }

  int _seat46 = 0;
  int get seat46 => _seat46;
  set seat46(int _value) {
    _seat46 = _value;
  }

  int _seat50 = 0;
  int get seat50 => _seat50;
  set seat50(int _value) {
    _seat50 = _value;
  }

  int _seat51 = 0;
  int get seat51 => _seat51;
  set seat51(int _value) {
    _seat51 = _value;
  }

  int _seat52 = 0;
  int get seat52 => _seat52;
  set seat52(int _value) {
    _seat52 = _value;
  }

  int _seat53 = 0;
  int get seat53 => _seat53;
  set seat53(int _value) {
    _seat53 = _value;
  }

  int _seat54 = 0;
  int get seat54 => _seat54;
  set seat54(int _value) {
    _seat54 = _value;
  }

  int _seat55 = 0;
  int get seat55 => _seat55;
  set seat55(int _value) {
    _seat55 = _value;
  }

  int _seat56 = 0;
  int get seat56 => _seat56;
  set seat56(int _value) {
    _seat56 = _value;
  }

  String _scannedCode = '';
  String get scannedCode => _scannedCode;
  set scannedCode(String _value) {
    _scannedCode = _value;
  }

  int _secretCounter1 = 0;
  int get secretCounter1 => _secretCounter1;
  set secretCounter1(int _value) {
    _secretCounter1 = _value;
  }

  int _secretCounter2 = 0;
  int get secretCounter2 => _secretCounter2;
  set secretCounter2(int _value) {
    _secretCounter2 = _value;
  }

  int _secretCounter3 = 0;
  int get secretCounter3 => _secretCounter3;
  set secretCounter3(int _value) {
    _secretCounter3 = _value;
  }

  String _UploadedVideo = '';
  String get UploadedVideo => _UploadedVideo;
  set UploadedVideo(String _value) {
    _UploadedVideo = _value;
  }

  bool _CommentsSectionVisibility = false;
  bool get CommentsSectionVisibility => _CommentsSectionVisibility;
  set CommentsSectionVisibility(bool _value) {
    _CommentsSectionVisibility = _value;
  }

  String _LastlyUploadedAvatar = '';
  String get LastlyUploadedAvatar => _LastlyUploadedAvatar;
  set LastlyUploadedAvatar(String _value) {
    _LastlyUploadedAvatar = _value;
  }

  String _LastlyUploadedThumbnail = '';
  String get LastlyUploadedThumbnail => _LastlyUploadedThumbnail;
  set LastlyUploadedThumbnail(String _value) {
    _LastlyUploadedThumbnail = _value;
  }

  String _LastlyUploadedVideo = '';
  String get LastlyUploadedVideo => _LastlyUploadedVideo;
  set LastlyUploadedVideo(String _value) {
    _LastlyUploadedVideo = _value;
  }

  bool _flippableCardVideoController = false;
  bool get flippableCardVideoController => _flippableCardVideoController;
  set flippableCardVideoController(bool _value) {
    _flippableCardVideoController = _value;
  }

  List<int> _thumbsUpCountList = [];
  List<int> get thumbsUpCountList => _thumbsUpCountList;
  set thumbsUpCountList(List<int> _value) {
    _thumbsUpCountList = _value;
  }

  void addToThumbsUpCountList(int _value) {
    _thumbsUpCountList.add(_value);
  }

  void removeFromThumbsUpCountList(int _value) {
    _thumbsUpCountList.remove(_value);
  }

  void removeAtIndexFromThumbsUpCountList(int _index) {
    _thumbsUpCountList.removeAt(_index);
  }

  void updateThumbsUpCountListAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _thumbsUpCountList[_index] = updateFn(_thumbsUpCountList[_index]);
  }

  void insertAtIndexInThumbsUpCountList(int _index, int _value) {
    _thumbsUpCountList.insert(_index, _value);
  }

  String _oldAvatarToDelete = '';
  String get oldAvatarToDelete => _oldAvatarToDelete;
  set oldAvatarToDelete(String _value) {
    _oldAvatarToDelete = _value;
  }

  List<DocumentReference> _RandomizedKKTubeVideos = [
    FirebaseFirestore.instance.doc('/kkTubeVideos/example')
  ];
  List<DocumentReference> get RandomizedKKTubeVideos => _RandomizedKKTubeVideos;
  set RandomizedKKTubeVideos(List<DocumentReference> _value) {
    _RandomizedKKTubeVideos = _value;
  }

  void addToRandomizedKKTubeVideos(DocumentReference _value) {
    _RandomizedKKTubeVideos.add(_value);
  }

  void removeFromRandomizedKKTubeVideos(DocumentReference _value) {
    _RandomizedKKTubeVideos.remove(_value);
  }

  void removeAtIndexFromRandomizedKKTubeVideos(int _index) {
    _RandomizedKKTubeVideos.removeAt(_index);
  }

  void updateRandomizedKKTubeVideosAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _RandomizedKKTubeVideos[_index] = updateFn(_RandomizedKKTubeVideos[_index]);
  }

  void insertAtIndexInRandomizedKKTubeVideos(
      int _index, DocumentReference _value) {
    _RandomizedKKTubeVideos.insert(_index, _value);
  }

  String _oldThumbnailToDelete = '';
  String get oldThumbnailToDelete => _oldThumbnailToDelete;
  set oldThumbnailToDelete(String _value) {
    _oldThumbnailToDelete = _value;
  }

  List<DocumentReference> _RandomizedSubscribedKKTubeVideos = [
    FirebaseFirestore.instance.doc('/kkTubeVideos/example')
  ];
  List<DocumentReference> get RandomizedSubscribedKKTubeVideos =>
      _RandomizedSubscribedKKTubeVideos;
  set RandomizedSubscribedKKTubeVideos(List<DocumentReference> _value) {
    _RandomizedSubscribedKKTubeVideos = _value;
  }

  void addToRandomizedSubscribedKKTubeVideos(DocumentReference _value) {
    _RandomizedSubscribedKKTubeVideos.add(_value);
  }

  void removeFromRandomizedSubscribedKKTubeVideos(DocumentReference _value) {
    _RandomizedSubscribedKKTubeVideos.remove(_value);
  }

  void removeAtIndexFromRandomizedSubscribedKKTubeVideos(int _index) {
    _RandomizedSubscribedKKTubeVideos.removeAt(_index);
  }

  void updateRandomizedSubscribedKKTubeVideosAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _RandomizedSubscribedKKTubeVideos[_index] =
        updateFn(_RandomizedSubscribedKKTubeVideos[_index]);
  }

  void insertAtIndexInRandomizedSubscribedKKTubeVideos(
      int _index, DocumentReference _value) {
    _RandomizedSubscribedKKTubeVideos.insert(_index, _value);
  }

  String _transactionTypeTicket = 'Kupno Biletu';
  String get transactionTypeTicket => _transactionTypeTicket;
  set transactionTypeTicket(String _value) {
    _transactionTypeTicket = _value;
  }

  String _transactionTypeStreaming = 'Kupno Streamingu';
  String get transactionTypeStreaming => _transactionTypeStreaming;
  set transactionTypeStreaming(String _value) {
    _transactionTypeStreaming = _value;
  }

  String _transactionTypeBlik = 'Wpłata Blikiem';
  String get transactionTypeBlik => _transactionTypeBlik;
  set transactionTypeBlik(String _value) {
    _transactionTypeBlik = _value;
  }

  String _transactionTypeCode = 'Wpłata Kodem';
  String get transactionTypeCode => _transactionTypeCode;
  set transactionTypeCode(String _value) {
    _transactionTypeCode = _value;
  }

  bool _showDetailedSerchBar = false;
  bool get showDetailedSerchBar => _showDetailedSerchBar;
  set showDetailedSerchBar(bool _value) {
    _showDetailedSerchBar = _value;
  }

  DocumentReference? _newTicket;
  DocumentReference? get newTicket => _newTicket;
  set newTicket(DocumentReference? _value) {
    _newTicket = _value;
  }

  DocumentReference? _newStreaming;
  DocumentReference? get newStreaming => _newStreaming;
  set newStreaming(DocumentReference? _value) {
    _newStreaming = _value;
  }

  int _seat07 = 0;
  int get seat07 => _seat07;
  set seat07(int _value) {
    _seat07 = _value;
  }

  int _seat08 = 0;
  int get seat08 => _seat08;
  set seat08(int _value) {
    _seat08 = _value;
  }

  int _seat09 = 0;
  int get seat09 => _seat09;
  set seat09(int _value) {
    _seat09 = _value;
  }

  int _seat17 = 0;
  int get seat17 => _seat17;
  set seat17(int _value) {
    _seat17 = _value;
  }

  int _seat18 = 0;
  int get seat18 => _seat18;
  set seat18(int _value) {
    _seat18 = _value;
  }

  int _seat19 = 0;
  int get seat19 => _seat19;
  set seat19(int _value) {
    _seat19 = _value;
  }

  int _seat27 = 0;
  int get seat27 => _seat27;
  set seat27(int _value) {
    _seat27 = _value;
  }

  int _seat28 = 0;
  int get seat28 => _seat28;
  set seat28(int _value) {
    _seat28 = _value;
  }

  int _seat29 = 0;
  int get seat29 => _seat29;
  set seat29(int _value) {
    _seat29 = _value;
  }

  int _seat37 = 0;
  int get seat37 => _seat37;
  set seat37(int _value) {
    _seat37 = _value;
  }

  int _seat38 = 0;
  int get seat38 => _seat38;
  set seat38(int _value) {
    _seat38 = _value;
  }

  int _seat39 = 0;
  int get seat39 => _seat39;
  set seat39(int _value) {
    _seat39 = _value;
  }

  int _seat47 = 0;
  int get seat47 => _seat47;
  set seat47(int _value) {
    _seat47 = _value;
  }

  int _seat48 = 0;
  int get seat48 => _seat48;
  set seat48(int _value) {
    _seat48 = _value;
  }

  int _seat49 = 0;
  int get seat49 => _seat49;
  set seat49(int _value) {
    _seat49 = _value;
  }

  int _seat57 = 0;
  int get seat57 => _seat57;
  set seat57(int _value) {
    _seat57 = _value;
  }

  int _seat58 = 0;
  int get seat58 => _seat58;
  set seat58(int _value) {
    _seat58 = _value;
  }

  int _seat59 = 0;
  int get seat59 => _seat59;
  set seat59(int _value) {
    _seat59 = _value;
  }

  int _seat60 = 0;
  int get seat60 => _seat60;
  set seat60(int _value) {
    _seat60 = _value;
  }

  int _seat61 = 0;
  int get seat61 => _seat61;
  set seat61(int _value) {
    _seat61 = _value;
  }

  int _seat62 = 0;
  int get seat62 => _seat62;
  set seat62(int _value) {
    _seat62 = _value;
  }

  int _seat63 = 0;
  int get seat63 => _seat63;
  set seat63(int _value) {
    _seat63 = _value;
  }

  int _seat64 = 0;
  int get seat64 => _seat64;
  set seat64(int _value) {
    _seat64 = _value;
  }

  int _seat65 = 0;
  int get seat65 => _seat65;
  set seat65(int _value) {
    _seat65 = _value;
  }

  int _seat66 = 0;
  int get seat66 => _seat66;
  set seat66(int _value) {
    _seat66 = _value;
  }

  int _seat67 = 0;
  int get seat67 => _seat67;
  set seat67(int _value) {
    _seat67 = _value;
  }

  int _seat68 = 0;
  int get seat68 => _seat68;
  set seat68(int _value) {
    _seat68 = _value;
  }

  int _seat69 = 0;
  int get seat69 => _seat69;
  set seat69(int _value) {
    _seat69 = _value;
  }

  int _seat70 = 0;
  int get seat70 => _seat70;
  set seat70(int _value) {
    _seat70 = _value;
  }

  int _seat71 = 0;
  int get seat71 => _seat71;
  set seat71(int _value) {
    _seat71 = _value;
  }

  int _seat72 = 0;
  int get seat72 => _seat72;
  set seat72(int _value) {
    _seat72 = _value;
  }

  int _seat73 = 0;
  int get seat73 => _seat73;
  set seat73(int _value) {
    _seat73 = _value;
  }

  int _seat74 = 0;
  int get seat74 => _seat74;
  set seat74(int _value) {
    _seat74 = _value;
  }

  int _seat75 = 0;
  int get seat75 => _seat75;
  set seat75(int _value) {
    _seat75 = _value;
  }

  int _seat76 = 0;
  int get seat76 => _seat76;
  set seat76(int _value) {
    _seat76 = _value;
  }

  int _seat77 = 0;
  int get seat77 => _seat77;
  set seat77(int _value) {
    _seat77 = _value;
  }

  int _seat78 = 0;
  int get seat78 => _seat78;
  set seat78(int _value) {
    _seat78 = _value;
  }

  int _seat79 = 0;
  int get seat79 => _seat79;
  set seat79(int _value) {
    _seat79 = _value;
  }

  int _seat80 = 0;
  int get seat80 => _seat80;
  set seat80(int _value) {
    _seat80 = _value;
  }

  int _seat81 = 0;
  int get seat81 => _seat81;
  set seat81(int _value) {
    _seat81 = _value;
  }

  int _seat82 = 0;
  int get seat82 => _seat82;
  set seat82(int _value) {
    _seat82 = _value;
  }

  int _seat83 = 0;
  int get seat83 => _seat83;
  set seat83(int _value) {
    _seat83 = _value;
  }

  int _seat84 = 0;
  int get seat84 => _seat84;
  set seat84(int _value) {
    _seat84 = _value;
  }

  int _seat85 = 0;
  int get seat85 => _seat85;
  set seat85(int _value) {
    _seat85 = _value;
  }

  int _seat86 = 0;
  int get seat86 => _seat86;
  set seat86(int _value) {
    _seat86 = _value;
  }

  int _seat87 = 0;
  int get seat87 => _seat87;
  set seat87(int _value) {
    _seat87 = _value;
  }

  int _seat88 = 0;
  int get seat88 => _seat88;
  set seat88(int _value) {
    _seat88 = _value;
  }

  int _seat89 = 0;
  int get seat89 => _seat89;
  set seat89(int _value) {
    _seat89 = _value;
  }

  int _seat90 = 0;
  int get seat90 => _seat90;
  set seat90(int _value) {
    _seat90 = _value;
  }

  int _seat91 = 0;
  int get seat91 => _seat91;
  set seat91(int _value) {
    _seat91 = _value;
  }

  int _seat92 = 0;
  int get seat92 => _seat92;
  set seat92(int _value) {
    _seat92 = _value;
  }

  int _seat93 = 0;
  int get seat93 => _seat93;
  set seat93(int _value) {
    _seat93 = _value;
  }

  int _seat94 = 0;
  int get seat94 => _seat94;
  set seat94(int _value) {
    _seat94 = _value;
  }

  int _seat95 = 0;
  int get seat95 => _seat95;
  set seat95(int _value) {
    _seat95 = _value;
  }

  int _seat96 = 0;
  int get seat96 => _seat96;
  set seat96(int _value) {
    _seat96 = _value;
  }

  int _seat97 = 0;
  int get seat97 => _seat97;
  set seat97(int _value) {
    _seat97 = _value;
  }

  int _seat98 = 0;
  int get seat98 => _seat98;
  set seat98(int _value) {
    _seat98 = _value;
  }

  int _seat99 = 0;
  int get seat99 => _seat99;
  set seat99(int _value) {
    _seat99 = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
