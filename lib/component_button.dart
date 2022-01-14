import 'package:calculator_2/main.dart';
import 'package:flutter/material.dart';

final Color highlight = Colors.grey;

class ButtonC extends StatelessWidget {
  const ButtonC({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      width: 153,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 4,
            color: Color(0xffADACAC),
          ),
        ],
      ),
      child: ElevatedButton(
        child: Text(
          "C",
          style: TextStyle(
            color: Color(0xff5CBD7A),
            fontSize: 30,
          ),
        ),
        style: ElevatedButton.styleFrom(
          onPrimary: highlight,
          primary: Color(0xffFFFFFF),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

class ButtonB extends StatelessWidget {
  const ButtonB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 23, right: 24),
      width: 65,
      height: 67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0xffADACAC),
          ),
        ],
      ),
      child: ElevatedButton(
        child: Icon(
          Icons.backspace,
          color: Color(0xff747474),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xffFFFFFF),
          onPrimary: highlight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 0,
        ),
        onPressed: () {},
      ),
    );
  }
}

class ButtonNum extends StatefulWidget {
  final int number;
  final double widthBtn;
  const ButtonNum({
    Key? key,
    required this.number,
    this.widthBtn = 65,
  }) : super(key: key);

  @override
  State<ButtonNum> createState() => _ButtonNumState();
}

class _ButtonNumState extends State<ButtonNum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 23),
      width: widget.widthBtn,
      height: 67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0xffADACAC),
          ),
        ],
      ),
      child: ElevatedButton(
        child: Text(
          widget.number.toString(),
          style: TextStyle(
            color: Color(0xff5B5B5B),
            fontSize: 30,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xffFFFFFF),
          onPrimary: highlight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 0,
        ),
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}

class ButtonOp extends StatelessWidget {
  final String operator;
  final double widthBtn;
  const ButtonOp({
    Key? key,
    required this.operator,
    this.widthBtn = 65,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthBtn,
      height: 67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ElevatedButton(
        child: Text(
          operator,
          style: const TextStyle(
            color: Color(0xff5B5B5B),
            fontSize: 30,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: highlight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 0,
        ),
        onPressed: () {},
      ),
    );
  }
}
