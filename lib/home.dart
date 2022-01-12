import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/controller.dart';
import 'package:mobx_aula/principal.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // int _contador = 0;
  //
  // _incrementar(){
  //   setState(() {
  //     _contador++;
  //   });
  // }

  late Controller controller;
  late ReactionDisposer reactionDisposer;


 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //AUTORUN SEMPRE É CHAMADO
    // autorun((_){
    //   print(controller.formularioValidado);
    // });

    //REACTION É POSSÍVEL DEFINIR QUAL OBSERVAVEL VOCÊ QUER SER NOTIFICADO

    controller = Provider.of<Controller>(context);

    reactionDisposer = reaction(
            (_)=> controller.usuarioLogado,

        (usuarioLogado){
     if(usuarioLogado == true){
       Navigator.of(context).pushReplacement(
         MaterialPageRoute(builder: (_) => const Principal())
       );
     }
        }
    );
  }

  @override
  void dispose() {
    super.dispose();
    reactionDisposer();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Padding(padding: const EdgeInsets.all(16),
            //   child: Observer(
            //     builder: (_){
            //       return Text(
            //         "${controller.contador}",
            //         style: const TextStyle(fontSize: 100),
            //       );
            //     },
            //   ),
            // ),

            Padding(padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: const InputDecoration(labelText: "Email"),
                  onChanged: controller.setEmail,
                ),
            ),
            Padding(padding: const EdgeInsets.all(16),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Senha",
                  ),
                  onChanged: controller.setSenha,
                ),
            ),
            Padding(padding: const EdgeInsets.all(16),
                child: Observer(builder: (_){
                  return Text(
                      controller.formularioValidado
                          ? "Validado"
                          : "* Campos não validados"
                  );
                },)
            ),

            Padding(padding: const EdgeInsets.all(16),
              child: Observer(
                builder: (_){
                  return ElevatedButton(
                    child: controller.carregando ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ) :  const Text(
                      "Logar",
                      style:  TextStyle(
                          color: Colors.black, fontSize: 30
                      ),
                    ),
                    onPressed: controller.formularioValidado
                        ? (){controller.logar();}
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
