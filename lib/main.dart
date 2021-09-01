import 'package:flutter/foundation.dart';
import 'package:proteasy/exercicios.dart';
import 'package:proteasy/projeto.dart';
import 'package:proteasy/projetos.dart';
import 'package:proteasy/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proteasy/home.dart';
import 'package:introduction_screen/introduction_screen.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => BottomAppBarDemo()),
    );
  }


  Widget _buildImage(String assetName, [double width = 250]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
      bodyTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 16),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Boas Vindas",
          body:
          "Bem vindo ao Proteasy, o software de planejamento de próteses parciais removíveis agora cabe na palma da mão com sua versão mobile.",
          image: _buildImage('Grupo1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Projetos",
          body:
          "Agora você pode salvar seus projetos e revê-los quando necessário, identificando e organizando seus projetos.",
          image: _buildImage('Grupo2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Público",
          body:
          "O app agora contém exercícios de PPR para fixação de conteúdos vistos no curso de odontologia, voltado tanto para estudantes quanto para profissionais.",
          image: _buildImage('Grupo3.png'),
          decoration: pageDecoration,
        ),

      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}


