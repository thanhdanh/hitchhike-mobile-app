import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final String imgUrl;

  CardHeader({
    this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: .0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 85.0, bottom: 20.0),
                  child: Row(children: [
                    Expanded(
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatistic("Lái xe", "0"),
                            _buildStatistic("Đi nhờ", "0"),
                            _buildStatistic("Điểm", "0"),
                          ],
                        ),
                        SizedBox(height: 40.0),
                        Align(
                          child: Text(
                            "Jessica Jones, 27",
                            style: TextStyle(
                              color: Color.fromRGBO(50, 50, 93, 1),
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          child: Text(
                            "San Francisco, USA",
                            style: TextStyle(
                                color: Color.fromRGBO(50, 50, 93, 1),
                                fontSize: 17.0,
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                        Divider(
                          height: 40.0,
                          thickness: 1.5,
                          indent: 32.0,
                          endIndent: 32.0,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 32.0, right: 32.0),
                          child: Align(
                            child: Text(
                                "An artist of considerable range, Jessica name taken by Melbourne...",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(82, 95, 127, 1),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w200)),
                          ),
                        ),
                      ]),
                    )
                  ]),
                ),
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: Align(
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/profile-screen-avatar.jpg"),
                  radius: 65.0,
                  // maxRadius: 200.0,
                ),
                alignment: FractionalOffset(0.5, 0.0),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildStatistic(String label, String _value) {
    return Column(
      children: [
        Text(
          _value,
          style: TextStyle(
            color: Color.fromRGBO(82, 95, 127, 1),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label,
            style:
                TextStyle(color: Color.fromRGBO(50, 50, 93, 1), fontSize: 12.0))
      ],
    );
  }

  Widget _buildFullName(String _fullName) {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      _fullName,
      style: _nameTextStyle,
    );
  }
}
