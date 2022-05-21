import 'package:atividadeFalta/models/emissora.dart';
import 'package:atividadeFalta/ui/pages/home_page/widgets/lista_emissoras.dart';
import 'package:atividadeFalta/ui/pages/emissora_page/emissora_page.dart';
import 'package:flutter/material.dart';

import '../../datasource/datasource.dart';
import '../../ui/components/components.dart';
import '../../pages/pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Emissoras / Novelas')],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: EmissoraRemote().get(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CirculoEspera();
                default:
                  if (snapshot.hasError) {
                    return GestureDetector(
                      child: MensagemErro(
                          'Erro ao acessar a API (${snapshot.error.toString()})'),
                      onTap: () {
                        setState(() {});
                      },
                    );
                  } else {
                    return ListaEmissora(snapshot.data as List<Emissora>);
                  }
              }
            },
          ))
        ],
      ),
    );
  }
}
