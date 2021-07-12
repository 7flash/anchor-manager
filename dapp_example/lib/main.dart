import 'package:flutter/material.dart';
import 'package:anchor_manager/anchor_manager.dart';

void main() {
  runApp(DappApp());
}

class DappApp extends StatefulWidget {
  @override
  _DappAppState createState() => _DappAppState();
}

class _DappAppState extends State<DappApp> {
  String result = "";

  void onPressed() async {
    final result = await AnchorDapp().transact(AnchorConstants.exampleUri);

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
              ),
              TextButton(
                onPressed: onPressed,
                child: Text("TRANSACT"),
              ),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  final String requestUri =
      "esr:gmN0S9_Eeqy57zv_9xn9eU3hL_bxCbUs-jptJqsXY3-JtawgA8OyJhPmVwahDAwM4bo2Z88yMjJAAIy2hTEUlk659XTlBC8YnyXExz8YSMuk5qXkFxWnKqSkJqfmlWSW5hoZGemnpaam6OamMllnlJQUFFvp6ycn6SXmJWfkF-nlZOZl6yenmZgYJyUm6pokJxvpmqSaGupaJlsm6xqkplqkWlqYWxiZmDMAAA";

  final String actor = "sevenflash42";

  final String privateKey =
      "5KinBtVFxVTYcZwJS1WrTDJr2hJpoy5VDhty8rJKra45KXZpLMA";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () async {
              // final anchor = await AnchorLink.fromIdentityRequest(
              //   requestUri,
              //   actor,
              //   privateKey,
              // );

              final anchor = AnchorLink(
                privateKey: privateKey,
                actor: actor,
              );

              final result = await anchor.resolve(requestUri);

              // print("authorized as ${anchor.actor}");
            },
            child: Text(
              "Anchor Sign",
              style: TextStyle(
                fontSize: 48,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
