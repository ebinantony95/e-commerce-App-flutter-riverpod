import 'package:flutter/widgets.dart';
import 'package:sneakcom_ecom/util/constants/images.dart';

class LogoSen extends StatelessWidget {
  const LogoSen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(Myimages.loginLogodark, width: 270, height: 270),
    );
  }
}
