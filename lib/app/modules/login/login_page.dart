import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:testelogin/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:testelogin/app/shared/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: store.formKey,
            child: Column(
              children: [
                const Center(
                  child: FlutterLogo(
                    size: 200,
                  ),
                ),
                SizedBox(height: size.height * 0.06),
                Container(
                  width:
                  kIsWeb ?
                  size.width * 0.3:size.width * 0.85,
                  child: Center(
                    child: CustomTextFormField(
                      onSaved: (v) => store.email = v,
                      prefixIcon: const Icon(Icons.email,color: Colors.grey,),
                      hintText: "email",
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Insira um email valido';
                        }  else if (!EmailValidator.validate(value)) {
                          return 'Email Invalido';
                        }  else {
                        return null;
                        }
                      },
                      onEditingComplete: () {
                        store.passwordFocus.requestFocus();
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(height: size.height * .02),
                Container(
                    width:
                    kIsWeb ?
                    size.width * 0.3:size.width * 0.85,
                    child: Center(
                      child: Observer(
                        builder: (_)=>CustomTextFormField(
                          onChanged: (v) => store.password = v,
                          onSaved: (v) => store.password = v,
                          prefixIcon: const Icon(Icons.lock,color: Colors.grey,),
                          hintText: "senha",
                          textInputAction: TextInputAction.done,
                          obscureText: !store.passwordVisualized,
                          validator: (v) => v!.isEmpty
                              ? 'Insira sua senha'
                              : v.length < 6
                              ? 'Sua senha tem que ter mais de 6 digitos'
                              : null,
                          onEditingComplete: () {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            FocusScope.of(context).unfocus();
                          },
                          suffixIcon: IconButton(
                            icon: !store.passwordVisualized
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: store.setChangePasswordVisualized,
                          ),
                        )
                      )
                    )
                ),
                SizedBox(height: size.height * .02),
                Observer(
                    builder: (_)=> Container(
                        width:
                        kIsWeb ?
                        size.width * 0.3:size.width * 0.85,
                        child: Center(
                          child: ProgressButton(
                            maxWidth: kIsWeb ?
                            size.width * 0.3:size.width * 0.85,
                            minWidth: 50.0,
                            radius:  store.stateOnlyText == ButtonState.loading ?
                            150.0 : 5.0,
                            progressIndicatorAlignment: MainAxisAlignment.center,
                            stateWidgets: {
                              ButtonState.idle: const Text('Logar',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                              ButtonState.loading: Container(),
                              ButtonState.fail: const Text('Erro ao efetuar o login',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                              ButtonState.success: const Text('Logado',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
                            },
                            stateColors: {
                              ButtonState.idle: Theme.of(context).primaryColor,
                              ButtonState.loading: Theme.of(context).primaryColor,
                              ButtonState.fail: Colors.redAccent,
                              ButtonState.success: Colors.green,
                            },
                            onPressed: ()=>store.setLogin(context),
                            state: store.stateOnlyText,
                          ),
                        )
                    )
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}