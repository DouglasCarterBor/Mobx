import 'package:mobx/mobx.dart';
part 'controller.g.dart';

//COMANDO PARA CRIAR O CÓDIGO MANUALMENTE
//flutter pub run build_runner (build ou watch)
//SENDO QUE O BUILD GERA O ARQUIVO SOMENTE QUANDO EXECUTADO
//O WATCH FICA MONITORANDO AS ALTERAÇÕES QUE FAZ NESTE ARQUIVO E ATUALIZA O DOCUMENTO (SE FECHAR O ANDROID STUDIO, PRECISA EXECUTAR O COMANDO NOVAMENTE)
//CRTL + C CANCELA O MONITORAMENTO

class Controller = ControllerBase with _$Controller;

//UTILIZAÇÃO DO MIXIM STORE É PARA GERAÇÃO DOS CÓDIGOS AUTOMÁTICOS

abstract class ControllerBase with Store{

  ControllerBase(){
    //EXECUTA SEMPRE QUE UM OBSERVÁVEL TEM SEU ESTADO ALTERADO
    autorun((_){
      // print(email);
      // print(senha);
      // print(emailSenha);
      // print(formularioValidado);
    });
  }

  @observable
  String email = "";

  @observable
  String senha = "";

  @observable
  bool usuarioLogado = false;

  @observable
  bool carregando = false;

  @computed
  String get emailSenha => "$email - $senha";

  bool get formularioValidado => email.length >= 5 && senha.length >= 5;

  @action
  void setEmail(valor) => email = valor;

  @action
  void setSenha(valor) => senha = valor;

  @action
  Future<void> logar() async {
    usuarioLogado = false;
    carregando = true;

    //PROCESSAMENTO FICTÍCIO
    await Future.delayed(const Duration(seconds: 1));

    carregando = false;
    usuarioLogado = true;


  }


  // @observable
  // int contador = 0;
  //
  // @action
  // incrementar(){
  //   contador++;
  // }

  //CÓDIGO MANUAL

  // final Observable<int> _contador = Observable(0);
  // late Action incrementar;
  //
  // Controller(){
  //   incrementar = Action(_incrementar);
  // }
  //
  // _incrementar(){
  //   _contador.value++;
  // }
  //
  // Observable<int> get contador => _contador;

}
