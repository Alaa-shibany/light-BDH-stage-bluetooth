import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

// ignore: must_be_immutable
class ChatPage extends StatefulWidget {
  static const String routeName = '/chat';
  BluetoothConnection connection;
  ChatPage({super.key, required this.connection});

  @override
  _ChatPage createState() => new _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  bool light0 = false;
  bool light1 = false;
  bool light2 = false;
  bool light3 = false;
  bool light4 = false;
  bool light5 = false;
  bool light6 = false;
  bool light7 = false;
  bool light8 = false;
  bool light9 = false;
  bool led = false;
  bool speed = false;

  void sendDataToArduino(String data) async {
    // ignore: unnecessary_null_comparison
    if (widget.connection == null || !widget.connection.isConnected) {
      print("Not connected to device");
      return;
    }

    widget.connection.output.add(Uint8List.fromList(data.codeUnits));
    await widget.connection.output.allSent;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: mediaQuery.height,
              width: mediaQuery.width,
              child: const Opacity(
                opacity: 0.6,
                child: Image(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill),
              ),
            ),
            //speed
            Positioned(
                top: MediaQuery.of(context).size.height / 2.2,
                left: MediaQuery.of(context).size.width / 6,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      speed = !speed;
                    });
                    speed ? sendDataToArduino('Q') : sendDataToArduino('q');
                  },
                  child: speed
                      ? Image(
                          image: const AssetImage('assets/images/speedOn.png'),
                          height: mediaQuery.height / 20,
                        )
                      : Image(
                          image: const AssetImage('assets/images/speedOff.png'),
                          height: mediaQuery.height / 20,
                        ),
                )),
            //led
            Positioned(
                top: MediaQuery.of(context).size.height / 2.8,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      led = !led;
                    });
                    led ? sendDataToArduino('P') : sendDataToArduino('p');
                  },
                  child: led
                      ? Image(
                          image: const AssetImage('assets/images/ledOn.png'),
                          height: mediaQuery.height / 4,
                        )
                      : Image(
                          image: const AssetImage('assets/images/ledOff.png'),
                          height: mediaQuery.height / 4,
                        ),
                )),
            //light0
            Positioned(
                bottom: 0,
                left: 0,
                child: GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: mediaQuery.height / 4,
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        light0 = true;
                                      });
                                      sendDataToArduino('A');
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  const Text('Volum'),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      sendDataToArduino('a');
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                  onTap: () {
                    setState(() {
                      light0 = !light0;
                    });
                    sendDataToArduino('0');
                  },
                  child: light0
                      ? Image(
                          image: const AssetImage(
                              'assets/images/cornerLeftDown.png'),
                          height: mediaQuery.height / 13,
                        )
                      : Image(
                          image: const AssetImage(
                              'assets/images/cornerLeftDownLow.png'),
                          height: mediaQuery.height / 13,
                        ),
                )),
            //light1
            Positioned(
                top: MediaQuery.of(context).size.height / 1.5,
                left: 0,
                child: GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: mediaQuery.height / 4,
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        light1 = true;
                                      });
                                      sendDataToArduino('B');
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  const Text('Volum'),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      sendDataToArduino('b');
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                  onTap: () {
                    setState(() {
                      light1 = !light1;
                    });
                    sendDataToArduino('1');
                  },
                  child: light1
                      ? Image(
                          image: const AssetImage(
                              'assets/images/normalLeftUp.png'),
                          height: mediaQuery.height / 13,
                        )
                      : Image(
                          image: const AssetImage(
                              'assets/images/normalLeftUpLow.png'),
                          height: mediaQuery.height / 13,
                        ),
                )),
            //light2
            Positioned(
                top: MediaQuery.of(context).size.height / 5,
                left: 0,
                child: GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: mediaQuery.height / 4,
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        light2 = true;
                                      });
                                      sendDataToArduino('C');
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  const Text('Volum'),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      sendDataToArduino('c');
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                  onTap: () {
                    setState(() {
                      light2 = !light2;
                    });
                    sendDataToArduino('2');
                  },
                  child: light2
                      ? Image(
                          image: const AssetImage(
                              'assets/images/normalLeftDown.png'),
                          height: mediaQuery.height / 13,
                        )
                      : Image(
                          image: const AssetImage(
                              'assets/images/normalLeftDownLow.png'),
                          height: mediaQuery.height / 13,
                        ),
                )),

            // light3
            Positioned(
                top: 0,
                left: 0,
                child: GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: mediaQuery.height / 4,
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        light3 = true;
                                      });
                                      sendDataToArduino('D');
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  const Text('Volum'),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      sendDataToArduino('d');
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                  onTap: () {
                    setState(() {
                      light3 = !light3;
                    });
                    sendDataToArduino('3');
                  },
                  child: light3
                      ? Image(
                          image:
                              const AssetImage('assets/images/cornerLeft.png'),
                          height: mediaQuery.height / 13,
                        )
                      : Image(
                          image: const AssetImage(
                              'assets/images/cornerLeftLow.png'),
                          height: mediaQuery.height / 13,
                        ),
                )),
            // light4
            Positioned(
                top: 0,
                right: MediaQuery.of(context).size.width / 2.4,
                child: GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: mediaQuery.height / 4,
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        light4 = true;
                                      });
                                      sendDataToArduino('E');
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  const Text('Volum'),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      sendDataToArduino('e');
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                  onTap: () {
                    setState(() {
                      light4 = !light4;
                    });
                    sendDataToArduino('4');
                  },
                  child: light4
                      ? Image(
                          image: const AssetImage('assets/images/midUp.png'),
                          height: mediaQuery.height / 13,
                        )
                      : Image(
                          image: const AssetImage('assets/images/midUpLow.png'),
                          height: mediaQuery.height / 13,
                        ),
                )),
            // light5
            Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width / 2.4,
                child: GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: mediaQuery.height / 4,
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        light5 = true;
                                      });
                                      sendDataToArduino('F');
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  const Text('Volum'),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      sendDataToArduino('f');
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                  onTap: () {
                    setState(() {
                      light5 = !light5;
                    });
                    sendDataToArduino('5');
                  },
                  child: light5
                      ? Image(
                          image: const AssetImage('assets/images/midDown.png'),
                          height: mediaQuery.height / 13,
                        )
                      : Image(
                          image:
                              const AssetImage('assets/images/midDownLow.png'),
                          height: mediaQuery.height / 13,
                        ),
                )),

            //light6
            Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: mediaQuery.height / 4,
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        light6 = true;
                                      });
                                      sendDataToArduino('G');
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  const Text('Volum'),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      sendDataToArduino('g');
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                  onTap: () {
                    setState(() {
                      light6 = !light6;
                    });
                    sendDataToArduino('6');
                  },
                  child: light6
                      ? Image(
                          image: const AssetImage(
                              'assets/images/cornerRightDown.png'),
                          height: mediaQuery.height / 13,
                        )
                      : Image(
                          image: const AssetImage(
                              'assets/images/cornerRightDownLow.png'),
                          height: mediaQuery.height / 13,
                        ),
                )),
            // light7
            Positioned(
                top: MediaQuery.of(context).size.height / 1.5,
                right: 0,
                child: GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: mediaQuery.height / 4,
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        light7 = true;
                                      });
                                      sendDataToArduino('H');
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  const Text('Volum'),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      sendDataToArduino('h');
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                  onTap: () {
                    setState(() {
                      light7 = !light7;
                    });
                    sendDataToArduino('7');
                  },
                  child: light7
                      ? Image(
                          image: const AssetImage(
                              'assets/images/normalRightUp.png'),
                          height: mediaQuery.height / 13,
                        )
                      : Image(
                          image: const AssetImage(
                              'assets/images/normalRightUpLow.png'),
                          height: mediaQuery.height / 13,
                        ),
                )),
            //light8
            Positioned(
                top: MediaQuery.of(context).size.height / 5,
                right: 0,
                child: GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: mediaQuery.height / 4,
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        light8 = true;
                                      });
                                      sendDataToArduino('I');
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  const Text('Volum'),
                                  SizedBox(
                                    height: mediaQuery.height / 50,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      sendDataToArduino('i');
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                  onTap: () {
                    setState(() {
                      light8 = !light8;
                    });
                    sendDataToArduino('8');
                  },
                  child: light8
                      ? Image(
                          image: const AssetImage(
                              'assets/images/normalRightDown.png'),
                          height: mediaQuery.height / 13,
                        )
                      : Image(
                          image: const AssetImage(
                              'assets/images/normalRightDownLow.png'),
                          height: mediaQuery.height / 13,
                        ),
                )),
            //light9
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: SizedBox(
                        height: mediaQuery.height / 4,
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      light9 = true;
                                    });
                                    sendDataToArduino('J');
                                  },
                                  icon: Icon(Icons.add),
                                ),
                                SizedBox(
                                  height: mediaQuery.height / 50,
                                ),
                                const Text('Volum'),
                                SizedBox(
                                  height: mediaQuery.height / 50,
                                ),
                                IconButton(
                                  onPressed: () {
                                    sendDataToArduino('j');
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  );
                },
                onTap: () {
                  setState(() {
                    print('hi');
                    light9 = !light9;
                  });
                  sendDataToArduino('9');
                },
                child: light9
                    ? Image(
                        image:
                            const AssetImage('assets/images/cornerRight.png'),
                        height: mediaQuery.height / 13,
                      )
                    : Image(
                        image: const AssetImage(
                            'assets/images/cornerRightLow.png'),
                        height: mediaQuery.height / 13,
                      ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              child: Stack(
                children: [
                  //on all right
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2,
                      right: MediaQuery.of(context).size.width / 3.8,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              light6 = light8 = light9 = light7 = true;
                            });
                            sendDataToArduino('O');
                          },
                          child: Image(
                            image:
                                const AssetImage('assets/images/onRight.png'),
                            height: mediaQuery.height / 12,
                          ))),
                  //off all right
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2.3,
                      right: MediaQuery.of(context).size.width / 3.8,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              light6 = light8 = light9 = light7 = false;
                            });
                            sendDataToArduino('o');
                          },
                          child: Image(
                            image:
                                const AssetImage('assets/images/offRight.png'),
                            height: mediaQuery.height / 13,
                          ))),
                  //on all left
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2,
                      left: MediaQuery.of(context).size.width / 4,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              light3 = light0 = light1 = light2 = true;
                            });
                            sendDataToArduino('M');
                          },
                          child: Image(
                            image: const AssetImage('assets/images/onLeft.png'),
                            height: mediaQuery.height / 12,
                          ))),
                  //off all left
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2.3,
                      left: MediaQuery.of(context).size.width / 4,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            light3 = light0 = light1 = light2 = false;
                          });
                          sendDataToArduino('m');
                        },
                        child: Image(
                          image: const AssetImage('assets/images/offLeft.png'),
                          height: mediaQuery.height / 13,
                        ),
                      )),
                  //on all
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2,
                      left: MediaQuery.of(context).size.width / 2.5,
                      child: GestureDetector(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: SizedBox(
                                height: mediaQuery.height / 4,
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              light1 = light2 = light3 =
                                                  light4 = light5 = light6 =
                                                      light7 = light8 =
                                                          light9 = true;
                                            });
                                            sendDataToArduino('Z');
                                          },
                                          icon: Icon(Icons.add),
                                        ),
                                        SizedBox(
                                          height: mediaQuery.height / 50,
                                        ),
                                        const Text('Volum'),
                                        SizedBox(
                                          height: mediaQuery.height / 50,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            sendDataToArduino('z');
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          );
                        },
                        onTap: () {
                          setState(() {
                            light1 = light2 = light3 = light4 = light5 =
                                light6 =
                                    light7 = light8 = light9 = light0 = true;
                          });
                          sendDataToArduino('L');
                        },
                        child: Image(
                          image: const AssetImage('assets/images/onAll.png'),
                          height: mediaQuery.height / 13,
                        ),
                      )),
                  //off all
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2.3,
                      left: MediaQuery.of(context).size.width / 2.5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            light1 = light2 = light3 = light4 = light5 =
                                light6 =
                                    light7 = light8 = light9 = light0 = false;
                          });
                          sendDataToArduino('l');
                        },
                        child: Image(
                          image: const AssetImage('assets/images/offAll.png'),
                          height: mediaQuery.height / 13,
                        ),
                      )),
                  //on all center
                  Positioned(
                      top: MediaQuery.of(context).size.height / 1.75,
                      left: MediaQuery.of(context).size.width / 2.5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            light4 = light5 = true;
                          });
                          sendDataToArduino('N');
                        },
                        child: Image(
                          image: const AssetImage('assets/images/offDown.png'),
                          height: mediaQuery.height / 13,
                        ),
                      )),
                  //off all center
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2.8,
                      left: MediaQuery.of(context).size.width / 2.5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            light4 = light5 = false;
                          });
                          sendDataToArduino('n');
                        },
                        child: Image(
                          image: const AssetImage('assets/images/offUp.png'),
                          height: mediaQuery.height / 13,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
