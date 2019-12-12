import 'dart:async';
mixin Validators{


  var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      //String digito;
      // if(email.contains('$digito . $digito . $digito - $digito')){
      if(email.length>10){
        sink.add(email);
      }else{
        sink.addError("O CPF não é valido");
      }
    }
  );

  var passwordValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
      if(password.length>4){
        sink.add(password);
      }else{
        sink.addError("A senha precisa ter mais de 4 caracteres");
      }
    }
  );

}