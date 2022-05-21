import 'package:atividadeFalta/models/emissora.dart';
import 'package:atividadeFalta/ui/components/Imagem.dart';
import 'package:atividadeFalta/ui/pages/emissora_page/emissora_page.dart';
import 'package:flutter/material.dart';

class ListaEmissora extends StatelessWidget {
  final List<Emissora> lista;
  const ListaEmissora(this.lista,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Imagem(
                      lista[index].logo,
                      redonda: true,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Expanded(
                    child: Text(lista[index].nome,
                        style: const TextStyle(fontSize: 35)),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            onTap: () {
              _abrirItem(context,lista[index]);
            },
          );
        });

  }
  void _abrirItem(BuildContext context,Emissora emissora) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EmissoraPage(emissora)));
  }
}
