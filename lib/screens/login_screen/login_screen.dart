import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sclp_final/constants/app_assets.dart';
import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/repo/repo_auth.dart';
import 'package:sclp_final/screens/login_screen/widgets/circular_loading_widget.dart';
import 'package:sclp_final/screens/widgets/theme_widget.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _password;
  String? _username;

  bool _isLoading = false;
  bool _isPasswordObscured = true;

  void _loginPressed() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      if (_username != null && _password != null) {
        setState(() {
          _isLoading = true;
        });
        context
            .read<RepoAuthImpl>()
            .authorize(_username!, _password!)
            .whenComplete(() {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushNamedAndRemoveUntil(
              context, '/settings', (route) => false);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.fromLTRB(37, 0, 37, 80),
                    color: ThemeWidget.instanceOf(context)?.color,
                    child: Image.asset(
                      AppAssets.images.logo,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 3) {
                                return S.of(context).inputErrorUsernameShort;
                              }
                              return null;
                            },
                            onSaved: (newValue) => _username = newValue,
                            decoration: InputDecoration(
                                label: Text(S.of(context).username),
                                prefixIcon: const Icon(Icons.account_box),
                                filled: true,
                                fillColor: ThemeWidget.instanceOf(context)
                                    ?.color
                                    ?.withOpacity(0.3),
                                border: InputBorder.none),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 8) {
                                return S.of(context).inputErrorPasswordShort;
                              }
                              return null;
                            },
                            onSaved: (newValue) => _password = newValue,
                            obscureText: _isPasswordObscured,
                            decoration: InputDecoration(
                                label: Text(S.of(context).password),
                                prefixIcon: const Icon(Icons.password),
                                suffixIcon: GestureDetector(
                                  onTap: () => setState(() {
                                    _isPasswordObscured = !_isPasswordObscured;
                                  }),
                                  child: _isPasswordObscured
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                ),
                                filled: true,
                                fillColor: ThemeWidget.instanceOf(context)
                                    ?.color
                                    ?.withOpacity(0.3),
                                border: InputBorder.none),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                  ),
                                  onPressed: _loginPressed,
                                  child: Text(S.of(context).signIn),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (_isLoading) const CircularLoadingWidget()
        ],
      ),
    );
  }
}
