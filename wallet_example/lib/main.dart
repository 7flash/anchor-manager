import 'package:flutter/material.dart';
import 'package:anchor_manager/anchor_manager.dart';

void main() {
  runApp(WalletApp());
}

class WalletApp extends StatefulWidget {
  @override
  _WalletAppState createState() => _WalletAppState();
}

class _WalletAppState extends State<WalletApp> {
  String result = "";

  void onPressed() async {
    final result = await AnchorWallet().resolve(AnchorConstants.exampleUri);

    setState(() {
      this.result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("Signing Request URI: "),
              TextField(
                readOnly: true,
                controller:
                    TextEditingController(text: AnchorConstants.exampleUri),
                maxLines: 7,
              ),
              TextButton(
                onPressed: onPressed,
                child: Text(
                  "RESOLVE",
                  textAlign: TextAlign.center,
                ),
              ),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
