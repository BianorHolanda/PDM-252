import 'dart:convert';

class Dependente {
  String nome;
  Dependente(this.nome);

  Map<String, dynamic> toJson() => {'nome': nome};
}

class Funcionario {
  String nome;
  List<Dependente> dependentes;
  Funcionario(this.nome, this.dependentes);

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'dependentes': dependentes.map((d) => d.toJson()).toList(),
      };
}

class EquipeProjeto {
  String nomeProjeto;
  List<Funcionario> funcionarios;
  EquipeProjeto(this.nomeProjeto, this.funcionarios);

  Map<String, dynamic> toJson() => {
        'nomeProjeto': nomeProjeto,
        'funcionarios': funcionarios.map((f) => f.toJson()).toList(),
      };
}

void main() {
  // criar dependentes
  final dep1 = Dependente('Maria');
  final dep2 = Dependente('João');
  final dep3 = Dependente('Ana');
  final dep4 = Dependente('Pedro');

  // criar funcionarios
  final func1 = Funcionario('Carlos', [dep1, dep2]);
  final func2 = Funcionario('Fernanda', [dep3]);
  final func3 = Funcionario('Roberto', [dep4]);

  // criar equipe
  final equipe =
      EquipeProjeto('Sistema de Vendas', [func1, func2, func3]);

  // imprimir JSON formatado
  final encoder = JsonEncoder.withIndent('  ');
  final jsonString = encoder.convert(equipe.toJson());
  print(jsonString);
}
