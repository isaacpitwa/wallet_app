import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
   List<dynamic> _contacts = [
    {
      'name': 'John',
      'avatar': 'assets/images/avatar-1.png',
    },
    {
      'name': 'Samantha',
      'avatar': 'assets/images/avatar-2.png',
    },
    {
      'name': 'Mary',
      'avatar': 'assets/images/avatar-3.png',
    },
    {
      'name': 'Julian',
      'avatar': 'assets/images/avatar-4.png',
    },
    {
      'name': 'Sara',
      'avatar': 'assets/images/avatar-5.png',
    },
    {
      'name': 'Kabir Singh',
      'avatar': 'assets/images/avatar-6.png',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161621),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Contacts', style: TextStyle(color: Colors.blueGrey),),
        centerTitle: true,
        leading: const BackButton(color: Colors.blueGrey,),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: FadeInDown(
            duration: const Duration(milliseconds: 500),
            child: Container(
              height: 45,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey,),
                  hintText: 'Search contacts',
                  hintStyle:  const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xff272730),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
