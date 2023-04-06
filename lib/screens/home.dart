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
  final _formKey = GlobalKey<FormState>();
  String result = 'R\$';

  double commaToDot(TextEditingController value) {
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
    });
  }

  bool validation(String? value) {
    if (value != null) {
        if (value.isEmpty || double.parse(value.replaceAll(',', '.')) < 0) {
          return true;
        }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Custo de Viagem"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.85
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
                                if (_formKey.currentState!.validate()) {
                                  tripCost();
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
