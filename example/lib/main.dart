import 'package:auth_screen_lock/auth_screen_lock.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Next Screen Lock'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
              child: ScreenLock(
            digits:4,
            onCancelled: Navigator.of(context).pop,
            onUnlocked: Navigator.of(context).pop,
            useBlur: false,
            keyPadConfig: KeyPadConfig(
                buttonConfig: KeyPadButtonConfig(
                  side:  const MaterialStatePropertyAll(
            BorderSide(color: Colors.green, width: 3)),
                    backgroundColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.brown,
                    ),
                    buttonStyle: ButtonStyle(
                      enableFeedback: true,
                      elevation: MaterialStateProperty.all<double>(0),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                          side: const BorderSide(color: Colors.red, width: 30),
                        ),
                      ),
                      //     ))
                    ))
                // buttonConfig: StyledInputConfig(
                //     width: 63,
                //     height: 63,
                //     textStyle:
                //         StyledInputConfig.getDefaultTextStyle(
                //                 context)
                //             .copyWith(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold,
                //                 backgroundColor:
                //                     Colors.transparent),
                //     buttonStyle: ButtonStyle(
                //       enableFeedback: true,
                //       elevation:
                //           MaterialStateProperty.all<double>(0),
                //       foregroundColor:
                //           MaterialStateProperty.all<Color>(
                //               AppTheme.of(context)
                //                   .labelPinColor),
                //       backgroundColor:
                //           MaterialStateProperty.all<Color>(
                //               AppTheme.of(context)
                //                   .backGroundButtonPinColor),
                //       shape: MaterialStateProperty.all<
                //           RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //           borderRadius:
                //               BorderRadius.circular(60),
                //           side: const BorderSide(
                //               color: Colors.white, width: 3),
                //         ),
                //       ),
                //     ))

                ),
            secretsConfig: SecretsConfig(
                secretConfig: SecretConfig(
              enabledColor: Colors.orange,
              disabledColor: Colors.purple,
              builder: (context, config, enabled) => Container(
                width: 25,
                height: 25,

                //#272b38
                decoration: BoxDecoration(
                  gradient: enabled
                      ? const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: Colors.accents,
                          stops: [0, 0.001, 0.2, 0.8, 1])
                      : null,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                  color: enabled ? config.enabledColor : config.disabledColor,
                ),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                // width: config.width,
                // height: config.height,
              ),
            )),
          )),
        ));
  }
}
