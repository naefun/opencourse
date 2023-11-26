import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleTextButton extends StatelessWidget {
  const GoogleTextButton({super.key, required this.text, required this.action});

  final String text;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff4285F4),
            borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(3, 0), // changes position of shadow
                  ),
                ],
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              "lib/assets/images/google-icon.svg",
              width: 26,
              height: 26,
              // fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Text(
              text,
              style: const TextStyle(color: Color(0xffffffff)),
            ),
          )
        ]),
      ),
    );
  }
}
