import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

final Color highlight = Colors.grey;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Color darkTheme = Color(0xff47595C);
  final Color greenBtn = Color(0xff5CBD7A);
  final Color blackBtn = Color(0xff747474);
  final Color lightTheme = Color(0xffFFFFFF);
  final Color blackNum = Color(0xff5B5B5B);
  final Color shadowDark = Color(0xff263238);
  final Color shadowLight = Color(0xffADACAC);
  final Color rightDarkTheme = Color(0xff3F4C4E);
  final Color rigthLightTheme = Color(0xffF5F5F5);
  Color? rightTheme;
  Color? themeBtn;
  Color? themeNum;
  Color? theme;
  Color? blurTheme;

  Color? selectTheme({bool? value}) {
    setState(() {
      if (value == null) {
        value = true;
      } else if (value!) {
        theme = lightTheme;
        themeNum = blackNum;
        blurTheme = shadowLight;
        themeBtn = blackBtn;
        rightTheme = rigthLightTheme;
      } else {
        theme = darkTheme;
        themeNum = lightTheme;
        blurTheme = shadowDark;
        themeBtn = greenBtn;
        rightTheme = rightDarkTheme;
      }
    });
  }

  double? valueA;
  double? valueB;
  var sbResult = StringBuffer();
  String? operator;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[
              Color(0xFF99D972),
              Color(0xFF7ED079),
              Color(0xFF5CBD7A),
              Color(0xFF5CBD7A),
              Color(0xFF5CBD7A),
            ],
          ),
        ),
        child: Column(
          children: [
            // ========================================
            // For Output
            // ========================================
            Expanded(
              key: const Key("top"),
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(right: 17, bottom: 22),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 13),
                        width: 150,
                        decoration: BoxDecoration(
                          color: theme,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectTheme(value: true);
                                });
                              },
                              child: Image.asset(
                                'assets/icons/light.png',
                                width: 20,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                selectTheme(value: false);
                              },
                              child: Image.asset(
                                'assets/icons/dark.png',
                                width: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: AutoSizeText(
                        sbResult.toString(),
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 60,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ========================================
            Expanded(
              key: const Key("bottom"),
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(18)),
                  color: theme,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 15,
                      color: blurTheme!,
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      key: const Key('Left'),
                      children: [
                        Row(
                          key: const Key("row1"),
                          children: [
                            // Button Clear
                            Container(
                              height: 67,
                              width: 153,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 0),
                                    blurRadius: 4,
                                    color: blurTheme!,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  "C",
                                  style: TextStyle(
                                    color: Color(0xff5CBD7A),
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  onPrimary: highlight,
                                  primary: theme,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: () {
                                  clearValue();
                                },
                              ),
                            ),
                            // Button Backspace
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 23, right: 24),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: blurTheme!,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: Icon(
                                  Icons.backspace,
                                  color: themeBtn,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: theme,
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  deleteValue();
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height / 45,
                        ),
                        Row(
                          key: const Key("row2"),
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: blurTheme!,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: Text(
                                  "7",
                                  style: TextStyle(
                                    color: themeNum,
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: theme,
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("7");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: blurTheme!,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: Text(
                                  "8",
                                  style: TextStyle(
                                    color: themeNum,
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: theme,
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("8");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: blurTheme!,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: Text(
                                  "9",
                                  style: TextStyle(
                                    color: themeNum,
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: theme,
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("9");
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height / 45,
                        ),
                        Row(
                          key: const Key("row3"),
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: blurTheme!,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: Text(
                                  "4",
                                  style: TextStyle(
                                    color: themeNum,
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: theme,
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("4");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: blurTheme!,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: Text(
                                  "5",
                                  style: TextStyle(
                                    color: themeNum,
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: theme,
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("5");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: blurTheme!,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                    color: themeNum,
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: theme,
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("6");
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height / 45,
                        ),
                        Row(
                          key: const Key("row4"),
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: blurTheme!,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    color: themeNum,
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: theme,
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("1");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: blurTheme!,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    color: themeNum,
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: theme,
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("2");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: blurTheme!,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                    color: themeNum,
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: theme,
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("3");
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height / 55,
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 23),
                            width: 241,
                            height: 67,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: blurTheme!,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              child: Text(
                                "0",
                                style: TextStyle(
                                  color: themeNum,
                                  fontSize: 30,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: theme,
                                onPrimary: highlight,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {
                                appendValue("0");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      key: const Key('Right'),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: rightTheme,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 65,
                                height: 67,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: ElevatedButton(
                                  child: Text(
                                    "÷",
                                    style: TextStyle(
                                      color: themeBtn,
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
                                  onPressed: () {
                                    appendValue("÷");
                                  },
                                ),
                              ),
                              SizedBox(
                                height: size.height / 45,
                              ),
                              Container(
                                width: 65,
                                height: 67,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: ElevatedButton(
                                  child: Text(
                                    "×",
                                    style: TextStyle(
                                      color: themeBtn,
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
                                  onPressed: () {
                                    appendValue("×");
                                  },
                                ),
                              ),
                              SizedBox(
                                height: size.height / 45,
                              ),
                              Container(
                                width: 65,
                                height: 67,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: ElevatedButton(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      color: themeBtn,
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
                                  onPressed: () {
                                    appendValue("-");
                                  },
                                ),
                              ),
                              SizedBox(
                                height: size.height / 45,
                              ),
                              Container(
                                width: 65,
                                height: 67,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: ElevatedButton(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      color: themeBtn,
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
                                  onPressed: () {
                                    appendValue("+");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height / 45,
                        ),
                        FloatingActionButton(
                          backgroundColor: const Color(0xff91D774),
                          child: const Text(
                            "=",
                            style: TextStyle(fontSize: 30),
                          ),
                          onPressed: () {
                            appendValue("=");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    sbResult.write("0");
    operator = "";
  }

  void deleteValue() => setState(() {
        String strResult = sbResult.toString();
        if (strResult.length > 0) {
          String lastCharacter = strResult.substring(strResult.length - 1);
          if (lastCharacter == "÷" ||
              lastCharacter == "×" ||
              lastCharacter == "-" ||
              lastCharacter == "+") {
            operator = "";
          }
          strResult = strResult.substring(0, strResult.length - 1);
          sbResult.clear();
          sbResult.write(strResult.length == 0 ? "0" : strResult);
        }
      });

  void clearValue() => setState(() {
        operator = "";
        sbResult.clear();
        sbResult.write("0");
      });

  void appendValue(String value) => setState(() {
        bool isDoCalculate = false;
        String strResult = sbResult.toString();
        String lastCharacter = strResult.substring(strResult.length - 1);
        if (((value == "9" ||
                value == "8" ||
                value == "7" ||
                value == "4" ||
                value == "3" ||
                value == "2" ||
                value == "1")) &&
            (sbResult.toString() == "+" ||
                sbResult.toString() == "-" ||
                sbResult.toString() == "×" ||
                sbResult.toString() == "÷")) {
          return;
        } else if (value == "0" &&
            (lastCharacter == "÷" ||
                lastCharacter == "×" ||
                lastCharacter == "-" ||
                lastCharacter == "+")) {
          return;
        } else if (value == "0" && sbResult.toString() == "0") {
          return;
        } else if (value == "=") {
          isDoCalculate = true;
        } else if (value == "÷" ||
            value == "×" ||
            value == "-" ||
            value == "+") {
          if (operator!.isEmpty) {
            operator = value;
          } else {
            isDoCalculate = true;
          }
        }

        if (!isDoCalculate) {
          if (sbResult.toString() == "0" && value != "0") {
            sbResult.clear();
          }
          sbResult.write(value);
        } else {
          List<String> values = sbResult.toString().split(operator!);
          if (values.length == 2 &&
              values[0].isNotEmpty &&
              values[1].isNotEmpty) {
            valueA = double.parse(values[0]);
            valueB = double.parse(values[1]);
            sbResult.clear();
            double total = 0;
            switch (operator) {
              case "÷":
                total = valueA! / valueB!;
                break;
              case "×":
                total = valueA! * valueB!;
                break;
              case "-":
                total = valueA! - valueB!;
                break;
              case "+":
                total = valueA! + valueB!;
            }
            sbResult.write(total);
            if (value == "÷" || value == "×" || value == "-" || value == "+") {
              operator = value;
              sbResult.write(value);
            } else {
              operator = "";
            }
          } else {
            String strResult = sbResult.toString();
            String lastCharacter = strResult.substring(strResult.length - 1);
            if (value == "÷" || value == "×" || value == "-" || value == "+") {
              sbResult.clear();
              sbResult.write(
                  strResult.substring(0, strResult.length - 1) + "" + value);
              operator = value;
            } else if (value == "=" &&
                (lastCharacter == "÷" ||
                    lastCharacter == "×" ||
                    lastCharacter == "-" ||
                    lastCharacter == "+")) {
              operator = value;
              sbResult.clear();
              sbResult.write(strResult.substring(0, strResult.length - 1));
            }
          }
        }
      });
}
