import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchField extends StatelessWidget {
  const searchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          Flexible(
            child: Stack(
              children: [
                TextFormField(
                  // validator:validator ,
                  // controller: controller_text,
                  // keyboardType: keyboardType,
                  cursorColor: Colors.black,
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                  decoration: InputDecoration(
                    // prefixIcon: prefixIcon,
                    //  suffixIcon: Icon(Icons.search),
                    // suffixIcon: Material(

                    //   // elevation: 5.0,
                    //   color: primaryColor,
                    //   shadowColor: primaryColor,
                    //   borderRadius: BorderRadius.circular(10.0),

                    //   child: Icon(Icons.search, color: Colors.white),
                    // ),
                    border: InputBorder.none,
                    hintText: 'Search here',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                    filled: true,
                    fillColor: Color(0xFFF1F3F6),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 21.0, top: 21.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF1F3F6)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF1F3F6)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // errorBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.red),
                    //   borderRadius: BorderRadius.circular(10.0),
                    // ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF1F3F6)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // focusedErrorBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.red),
                    //   borderRadius: BorderRadius.circular(10.0),
                    // ),
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 99, 176, 238),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
