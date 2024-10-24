enum GenreType {
  electronic,
  jazzAndBlues,
  cinematic,
  rock,
  people,
  animals,
  ambience
}

GenreType genreTypeFromString(String genreString) {
  switch (genreString.toLowerCase()) {
    case 'electronic':
      return GenreType.electronic;
    case 'jazz & blues':
      return GenreType.jazzAndBlues;
    case 'cinematic':
      return GenreType.cinematic;
    case 'rock':
      return GenreType.rock;
    case 'people':
      return GenreType.people;
    case 'animals':
      return GenreType.animals;
    case 'ambience':
      return GenreType.ambience;
    default:
      throw UnimplementedError();
  }
}

extension GenreTypeExtension on GenreType {
  String get title {
    switch (this) {
      case GenreType.electronic:
        return "Electronic";
      case GenreType.jazzAndBlues:
        return "Jazz & Blues";
      case GenreType.cinematic:
        return "Cinematic";
      case GenreType.rock:
        return "Rock";
      case GenreType.people:
        return "People";
      case GenreType.animals:
        return "Animals";
      case GenreType.ambience:
        return "Ambience";
    }
  }

  String get subtitle {
    switch (this) {
      case GenreType.electronic:
        return "Feel the beat!";
      case GenreType.jazzAndBlues:
        return "Smooth and soulful.";
      case GenreType.cinematic:
        return "Epic soundscapes.";
      case GenreType.rock:
        return "Let's rock!!!";
      case GenreType.people:
        return "Voices and stories.";
      case GenreType.animals:
        return "A sounds of nature.";
      case GenreType.ambience:
        return "Relaxing background sounds.";
    }
  }

  String get imagePath {
    switch (this) {
      case GenreType.electronic:
        return "assets/images/electronic-image.png";
      case GenreType.jazzAndBlues:
        return "assets/images/jazz-image.png";
      case GenreType.cinematic:
        return "assets/images/cinematic-image.png";
      case GenreType.rock:
        return "assets/images/rock-image.png";
      case GenreType.people:
        return "assets/images/people-image.png";
      case GenreType.animals:
        return "assets/images/animals-image.png";
      case GenreType.ambience:
        return "assets/images/ambience-image.png";
    }
  }
}
