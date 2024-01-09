import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoviesRecord extends FirestoreRecord {
  MoviesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  bool hasGenre() => _genre != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "director" field.
  String? _director;
  String get director => _director ?? '';
  bool hasDirector() => _director != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "trailerURL" field.
  String? _trailerURL;
  String get trailerURL => _trailerURL ?? '';
  bool hasTrailerURL() => _trailerURL != null;

  // "streamingLink" field.
  String? _streamingLink;
  String get streamingLink => _streamingLink ?? '';
  bool hasStreamingLink() => _streamingLink != null;

  // "streamingPrice" field.
  double? _streamingPrice;
  double get streamingPrice => _streamingPrice ?? 0.0;
  bool hasStreamingPrice() => _streamingPrice != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _genre = snapshotData['genre'] as String?;
    _description = snapshotData['description'] as String?;
    _director = snapshotData['director'] as String?;
    _duration = snapshotData['duration'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _image = snapshotData['image'] as String?;
    _trailerURL = snapshotData['trailerURL'] as String?;
    _streamingLink = snapshotData['streamingLink'] as String?;
    _streamingPrice = castToType<double>(snapshotData['streamingPrice']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('movies');

  static Stream<MoviesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoviesRecord.fromSnapshot(s));

  static Future<MoviesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoviesRecord.fromSnapshot(s));

  static MoviesRecord fromSnapshot(DocumentSnapshot snapshot) => MoviesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoviesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoviesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoviesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoviesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoviesRecordData({
  String? title,
  String? genre,
  String? description,
  String? director,
  String? duration,
  double? rating,
  String? image,
  String? trailerURL,
  String? streamingLink,
  double? streamingPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'genre': genre,
      'description': description,
      'director': director,
      'duration': duration,
      'rating': rating,
      'image': image,
      'trailerURL': trailerURL,
      'streamingLink': streamingLink,
      'streamingPrice': streamingPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoviesRecordDocumentEquality implements Equality<MoviesRecord> {
  const MoviesRecordDocumentEquality();

  @override
  bool equals(MoviesRecord? e1, MoviesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.genre == e2?.genre &&
        e1?.description == e2?.description &&
        e1?.director == e2?.director &&
        e1?.duration == e2?.duration &&
        e1?.rating == e2?.rating &&
        e1?.image == e2?.image &&
        e1?.trailerURL == e2?.trailerURL &&
        e1?.streamingLink == e2?.streamingLink &&
        e1?.streamingPrice == e2?.streamingPrice;
  }

  @override
  int hash(MoviesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.genre,
        e?.description,
        e?.director,
        e?.duration,
        e?.rating,
        e?.image,
        e?.trailerURL,
        e?.streamingLink,
        e?.streamingPrice
      ]);

  @override
  bool isValidKey(Object? o) => o is MoviesRecord;
}
