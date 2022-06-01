class PokeApi2 {
  List<Pokemon>? _pokemon;

  PokeApi2({List<Pokemon>? pokemon}) {
    if (pokemon != null) {
      this._pokemon = pokemon;
    }
  }

  List<Pokemon>? get pokemon => _pokemon;
  set pokemon(List<Pokemon>? pokemon) => _pokemon = pokemon;

  PokeApi2.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      _pokemon = <Pokemon>[];
      json['pokemon'].forEach((v) {
        _pokemon!.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._pokemon != null) {
      data['pokemon'] = this._pokemon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  int? _id;
  String? _num;
  String? _name;
  String? _img;
  List<String>? _type;
  String? _height;
  String? _weight;
  String? _candy;
  int? _candyCount;
  String? _egg;
  double? _spawnChance;
  double? _avgSpawns;
  String? _spawnTime;
  List<double>? _multipliers;
  List<String>? _weaknesses;
  List<NextEvolution>? _nextEvolution;
  // List<PrevEvolution>? _prevEvolution;

  Pokemon(
      {int? id,
      String? num,
      String? name,
      String? img,
      List<String>? type,
      String? height,
      String? weight,
      String? candy,
      int? candyCount,
      String? egg,
      double? spawnChance,
      double? avgSpawns,
      String? spawnTime,
      List<double>? multipliers,
      List<String>? weaknesses,
      List<NextEvolution>? nextEvolution,
    }) {
    if (id != null) {
      this._id = id;
    }
    if (num != null) {
      this._num = num;
    }
    if (name != null) {
      this._name = name;
    }
    if (img != null) {
      this._img = img;
    }
    if (type != null) {
      this._type = type;
    }
    if (height != null) {
      this._height = height;
    }
    if (weight != null) {
      this._weight = weight;
    }
    if (candy != null) {
      this._candy = candy;
    }
    if (candyCount != null) {
      this._candyCount = candyCount;
    }
    if (egg != null) {
      this._egg = egg;
    }
    if (spawnChance != null) {
      this._spawnChance = spawnChance;
    }
    if (avgSpawns != null) {
      this._avgSpawns = avgSpawns;
    }
    if (spawnTime != null) {
      this._spawnTime = spawnTime;
    }
    if (multipliers != null) {
      this._multipliers = multipliers;
    }
    if (weaknesses != null) {
      this._weaknesses = weaknesses;
    }
    if (nextEvolution != null) {
      this._nextEvolution = nextEvolution;
    }
    // if (prevEvolution != null) {
    //   this._prevEvolution = prevEvolution;
    // }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get num => _num;
  set num(String? num) => _num = num;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get img => _img;
  set img(String? img) => _img = img;
  List<String>? get type => _type;
  set type(List<String>? type) => _type = type;
  String? get height => _height;
  set height(String? height) => _height = height;
  String? get weight => _weight;
  set weight(String? weight) => _weight = weight;
  String? get candy => _candy;
  set candy(String? candy) => _candy = candy;
  int? get candyCount => _candyCount;
  set candyCount(int? candyCount) => _candyCount = candyCount;
  String? get egg => _egg;
  set egg(String? egg) => _egg = egg;
  double? get spawnChance => _spawnChance;
  set spawnChance(double? spawnChance) => _spawnChance = spawnChance;
  double? get avgSpawns => _avgSpawns;
  set avgSpawns(double? avgSpawns) => _avgSpawns = avgSpawns;
  String? get spawnTime => _spawnTime;
  set spawnTime(String? spawnTime) => _spawnTime = spawnTime;
  List<double>? get multipliers => _multipliers;
  set multipliers(List<double>? multipliers) => _multipliers = multipliers;
  List<String>? get weaknesses => _weaknesses;
  set weaknesses(List<String>? weaknesses) => _weaknesses = weaknesses;
  List<NextEvolution>? get nextEvolution => _nextEvolution;
  set nextEvolution(List<NextEvolution>? nextEvolution) =>
      _nextEvolution = nextEvolution;
  // List<PrevEvolution>? get prevEvolution => _prevEvolution;
  // set prevEvolution(List<PrevEvolution>? prevEvolution) =>
  //     _prevEvolution = prevEvolution;

  Pokemon.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _num = json['num'];
    _name = json['name'];
    _img = json['img'];
    _type = json['type'].cast<String>();
    _height = json['height'];
    _weight = json['weight'];
    _candy = json['candy'];
    _candyCount = json['candy_count'];
    _egg = json['egg'];
    _spawnChance = json['spawn_chance'];
    _avgSpawns = json['avg_spawns'];
    _spawnTime = json['spawn_time'];
    _multipliers = json['multipliers'].cast<double>();
    _weaknesses = json['weaknesses'].cast<String>();
    if (json['next_evolution'] != null) {
      _nextEvolution = <NextEvolution>[];
      json['next_evolution'].forEach((v) {
        _nextEvolution!.add(new NextEvolution.fromJson(v));
      });
    }
    // if (json['prev_evolution'] != null) {
    //   _prevEvolution = <PrevEvolution>[];
    //   json['prev_evolution'].forEach((v) {
    //     _prevEvolution!.add(new PrevEvolution.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['num'] = this._num;
    data['name'] = this._name;
    data['img'] = this._img;
    data['type'] = this._type;
    data['height'] = this._height;
    data['weight'] = this._weight;
    data['candy'] = this._candy;
    data['candy_count'] = this._candyCount;
    data['egg'] = this._egg;
    data['spawn_chance'] = this._spawnChance;
    data['avg_spawns'] = this._avgSpawns;
    data['spawn_time'] = this._spawnTime;
    data['multipliers'] = this._multipliers;
    data['weaknesses'] = this._weaknesses;
    if (this._nextEvolution != null) {
      data['next_evolution'] =
          this._nextEvolution!.map((v) => v.toJson()).toList();
    }
    // if (this._prevEvolution != null) {
    //   data['prev_evolution'] =
    //       this._prevEvolution!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class NextEvolution {
  String? _num;
  String? _name;

  NextEvolution({String? num, String? name}) {
    if (num != null) {
      this._num = num;
    }
    if (name != null) {
      this._name = name;
    }
  }

  String? get num => _num;
  set num(String? num) => _num = num;
  String? get name => _name;
  set name(String? name) => _name = name;

  NextEvolution.fromJson(Map<String, dynamic> json) {
    _num = json['num'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this._num;
    data['name'] = this._name;
    return data;
  }
}
