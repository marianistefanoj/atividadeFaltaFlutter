import 'package:flutter/material.dart';

class MensagemErro extends StatelessWidget {
  final texto;
  const MensagemErro(this.texto,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
            Icon(Icons.error, color: Colors.red,size: 244,),
            Text(texto, style: TextStyle(fontSize: 28, color: Colors.red)),
        ],
      )
    );
  }
}
