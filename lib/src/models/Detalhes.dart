List<Detalhes> detalhes = [];

class Detalhes {
  String? about;
  double? fee;

  Detalhes({this.about, this.fee});

  AddDetalhe(sobre, taxa) {
    Detalhes d = new Detalhes(
      about: sobre,
      fee: taxa,
    );
    detalhes.add(d);
  }

  List<Detalhes> GetListDetalhes() {
    return detalhes;
  }
}
