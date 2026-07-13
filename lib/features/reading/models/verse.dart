enum VerseType { sloka, doha, chaupai, sortha, aarti }

class Verse {
  final String id;
  final VerseType type;
  final String number;
  final String text;
  final String transliteration;
  final String translation;
  final int audioStart;
  final int audioEnd;
  final int? dohaRef;

  Verse({
    required this.id,
    required this.type,
    required this.number,
    required this.text,
    required this.transliteration,
    required this.translation,
    required this.audioStart,
    required this.audioEnd,
    this.dohaRef,
  });
}
