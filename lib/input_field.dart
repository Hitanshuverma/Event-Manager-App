
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const Inputfield({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const Divider(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 52,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    readOnly: widget == null?false:true,
                    autofocus: false,
                    cursorColor: Colors.white,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      // fillColor: Colors.white,
                      focusColor: Colors.black,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          // color: Colors.grey[900],
                          width: 0,
                        ),
                      )
                    ),
                  ),
                ),
                widget == null ? Container():Container(child: widget)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
