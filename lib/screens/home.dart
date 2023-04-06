import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController distanceController = TextEditingController();
  TextEditingController gasPriceController = TextEditingController();
  TextEditingController autonomyController = TextEditingController();
  TextEditingController passengerController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); //Chave global que vai realizar as validações no clique.
  String result = 'R\$'; //Foi necessário criar essa variável para trocar o texto de estado.

  double commaToDot(TextEditingController value) { // Função que troca a vírgula do input por ponto
    return double.parse(value.text.replaceAll(',', '.'));
  }

  tripCost() {
    double distance = commaToDot(distanceController);
    double autonomy = commaToDot(autonomyController);
    double gasPrice = commaToDot(gasPriceController);
    double passengers = commaToDot(passengerController);

    setState(() {
      result =
          "R\$ ${(((distance / autonomy) * gasPrice)/passengers).toStringAsFixed(2).replaceAll('.', ',')}";
    }); //Substitui a String result pelo resultado da conta, formatando-a para duas casas decimais e com vírgula.
  }

  bool validation(String? value) { //Validação a ser realizada pela _formKey.
    if (value != null) {
        if (value.isEmpty || double.parse(value.replaceAll(',', '.')) < 0) {
          return true;
        }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form( //Para utlizar a GlobalKey<FormState> ela tem que estar no local mais alto da árvore.
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Custo de Viagem"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.85 //Operador ternário para alterar tamanho de acordo com orientação
                  : MediaQuery.of(context).size.height * 1.5,
              width: MediaQuery.of(context).size.width * 0.90,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (validation(value)) {
                          return 'Insira um número válido';
                        }
                        return null;
                      },
                      controller: distanceController,
                      decoration: const InputDecoration(
                        labelText: 'Distância Percorrida (Km)',
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (validation(value)) {
                          return 'Insira um número válido';
                        }
                        return null;
                      },
                      controller: gasPriceController,
                      decoration: const InputDecoration(
                        labelText: 'Preço (R\$/litro)',
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (validation(value)) {
                          return 'Insira um número válido';
                        }
                        return null;
                      },
                      controller: autonomyController,
                      decoration: const InputDecoration(
                        labelText: 'Autonomia (Km/litro)',
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (validation(value)) {
                          return 'Insira um número válido';
                        }
                        return null;
                      },
                      controller: passengerController,
                      decoration: const InputDecoration(
                        labelText: 'Quantidade de pessoas',
                      ),
                    ),
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(children: [
                        const TextSpan(
                          text: 'Seu gasto total será de:\n\n',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: result,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) { //Aqui ocorre a validação da chave
                                  tripCost(); //Caso tudo esteja correto, muda o estado do texto result
                                }
                              },
                              child: const Text(
                                'Calcular',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
