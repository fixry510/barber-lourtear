import 'package:barber/models/user-data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TechnicItem extends StatelessWidget {
  late final UserData techic;
  TechnicItem({
    Key? key,
    required this.techic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.grey[200]!,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(techic.profileImage),
                fit: BoxFit.cover,
              ),
            ),
            // child: Placeholder(),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "ช่าง ${techic.fullName}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // SizedBox(height: 10),
                  Divider(
                    thickness: 2,
                    color: Colors.grey[900],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
