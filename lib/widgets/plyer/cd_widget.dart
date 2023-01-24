
import 'package:flutter/material.dart';

class cd_widget extends StatelessWidget {
  const cd_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 12,
            color: Color.fromRGBO(0, 0, 0, 0.16),
          )
        ],
        image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1531651008558-ed1740375b39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
            fit: BoxFit.cover),
        color: Color.fromARGB(255, 18, 107, 203),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, //                   <--- border color
              width: 8.0,
            ),
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
