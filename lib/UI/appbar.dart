import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 10, bottom: 10),
          child: Image.asset(
            'assets/Group 5.png',
          ),
        ),
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  onTap: () {},
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: const Color(0xffFFFFFF),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF004182),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    hintText: 'What do you search for?',
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart_outlined),
                color: Theme.of(context).primaryColor,
                iconSize: 30,
              )
            ],
          ),
        ),
      ],
    );
  }
}
