import 'package:flutter/material.dart';

class TransferMoney extends StatefulWidget {
  final String name;
  final String avatar;
  const TransferMoney({Key? key,required this.name, required this.avatar}) : super(key: key);

  @override
  _TransferMoneyState createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  var amount = TextEditingController(text: "0.00");

  final FocusNode _focusNode = new FocusNode();
  final TextEditingController _editingController = new TextEditingController();
  bool isFocused = false;

  final List<String> _feedbacks = [
    'Awsome 🙌',
    'Nice 🔥',
    "Cool 🤩",
    'Amazing work 👍🏼',
  ];

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(onFocusChanged);
  }
  void onFocusChanged() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });

     print('focus changed.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Send Money', style: TextStyle(color: Colors.black),),
        leading: const BackButton(color: Colors.black,),
      ),
      body: Container(),
    );
  }
}
