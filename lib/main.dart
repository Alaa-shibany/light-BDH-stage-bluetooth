import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'common_widgets/BackgroundPaint.dart';
import 'control_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock the screen orientation to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arduino Control App',
      home: BluetoothScreen(),
    );
  }
}

class BluetoothScreen extends StatefulWidget {
  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  late BluetoothDevice selectedDevice; // Selected Arduino device
  late BluetoothConnection connection; // Bluetooth connection instance
  bool isConnect = false;
  // Function to send data to Arduino

  // Function to connect to the selected device

  showTheDilog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Device connected"),
        content: const Text('The device connected successfully'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }

  void connectToDevice() async {
    // ignore: unnecessary_null_comparison
    if (selectedDevice == null) {
      print("No device selected");
      Fluttertoast.showToast(
          msg: "Can not find HC-05 device",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black38,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    connection = await BluetoothConnection.toAddress(selectedDevice.address);
    print("Connected to ${selectedDevice.name}");
    setState(() {
      isConnect = true;
    });
    showTheDilog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            //this for the background
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
              // (screenWidth * 2.1434668500180276)
              //     .toDouble()
            ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: Background(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // Discover Arduino device
                    List<BluetoothDevice> devices =
                        await bluetooth.getBondedDevices();
                    for (BluetoothDevice device in devices) {
                      if (device.name == "HC-05") {
                        selectedDevice = device;
                        connectToDevice(); // Connect to the selected device
                        break;
                      }
                    }
                  },
                  child: const Text('Connect to HC-05'),
                ),
                isConnect
                    ? ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage(
                                      connection: connection,
                                    )), // Replace SecondPage with your target page
                          );
                        },
                        child: const Text('Send Data to HC-05'),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          Fluttertoast.showToast(
                              msg: "You have to connect to  HC-05 first",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black38,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child: const Text('Not working'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
