import 'package:jlife/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DateAndTime extends StatefulWidget {
  const DateAndTime({Key? key}) : super(key: key);

  @override
  _DateAndTimeState createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  int _selectedDay = 2;
  int _selectedRepeat = 0;
  String _selectedHour = '13:30';
  List<int> _selectedExteraCleaning = [];

  ItemScrollController _scrollController = ItemScrollController();

  final List<dynamic> _days = [
    [1, 'Жұма'],
    [2, 'Сенбі'],
    [3, 'Жексенбі'],
    [4, 'Дүйсенбі'],
    [5, 'Сейсенбі'],
    [6, 'Сәрсенбі'],
    [7, 'Бейсенбі'],
    [8, 'Жұма'],
    [9, 'Сенбі'],
    [10, 'Жексенбі'],
    [11, 'Дүйсенбі'],
    [12, 'Сейсенбі'],
    [13, 'Сәрсенбі'],
    [14, 'Бейсенбі'],
    [15, 'Жұма'],
    [16, 'Сенбі'],
    [17, 'Жексенбі'],
    [18, 'Дүйсенбі'],
    [19, 'Сейсенбі'],
    [20, 'Сәрсенбі'],
    [21, 'Бейсенбі'],
    [22, 'Жұма'],
    [23, 'Сенбі'],
    [24, 'Жексенбі'],
    [25, 'Дүйсенбі'],
    [26, 'Сейсенбі'],
    [27, 'Сәрсенбі'],
    [28, 'Бейсенбі'],
    [29, 'Жұма'],
    [30, 'Сенбі'],
    [31, 'Жексенбі']
  ];

  final List<String> _hours = <String>[
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30'
  ];

  final List<String> _repeat = [
    'Қайталамау',
    'Күн сайын',
    'Апта сайын',
    'Ай сайын'
  ];

  final List<dynamic> _exteraCleaning = [
    ['Жуу', 'assets/icons/washing-machine.png', '1000'],
    ['Тоңазытқыш', 'assets/icons/fridge.png', '800'],
    ['Пеш', 'assets/icons/oven.png', '800'],
    ['Жүру құралдары', 'assets/icons/vehicle.png', '2000'],
    ['Терезелер', 'assets/icons/window.png', '2000'],
  ];

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      _scrollController.scrollTo(
        index: 24,
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Icon(Icons.arrow_forward_ios),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                  child: Text(
                    'Күн мен уақытты нақтылау',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text("Қазан 2021"),
                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Colors.grey.shade700,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(width: 1.5, color: Colors.grey.shade200),
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _days.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDay = _days[index][0];
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: 62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _selectedDay == _days[index][0]
                                  ? Colors.blue.shade100.withOpacity(0.5)
                                  : Colors.blue.withOpacity(0),
                              border: Border.all(
                                color: _selectedDay == _days[index][0]
                                    ? Colors.blue
                                    : Colors.white.withOpacity(0),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _days[index][0].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _days[index][1],
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(width: 1.5, color: Colors.grey.shade200),
                  ),
                  child: ScrollablePositionedList.builder(
                      itemScrollController: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: _hours.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedHour = _hours[index];
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _selectedHour == _hours[index]
                                  ? Colors.orange.shade100.withOpacity(0.5)
                                  : Colors.orange.withOpacity(0),
                              border: Border.all(
                                color: _selectedHour == _hours[index]
                                    ? Colors.orange
                                    : Colors.white.withOpacity(0),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _hours[index],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Қайталау",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _repeat.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedRepeat = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _selectedRepeat == index
                                  ? Colors.blue.shade400
                                  : Colors.grey.shade100,
                            ),
                            margin: EdgeInsets.only(right: 20),
                            child: Center(
                                child: Text(
                              _repeat[index],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: _selectedRepeat == index
                                      ? Colors.white
                                      : Colors.grey.shade800),
                            )),
                          ),
                        );
                      },
                    )),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Қосымша қызметтер",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _exteraCleaning.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedExteraCleaning.contains(index)) {
                                _selectedExteraCleaning.remove(index);
                              } else {
                                _selectedExteraCleaning.add(index);
                              }
                            });
                          },
                          child: Container(
                              width: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _selectedExteraCleaning.contains(index)
                                    ? Colors.blue.shade400
                                    : Colors.transparent,
                              ),
                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    _exteraCleaning[index][1],
                                    height: 40,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _exteraCleaning[index][0],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: _selectedExteraCleaning
                                                .contains(index)
                                            ? Colors.white
                                            : Colors.grey.shade800),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "+${_exteraCleaning[index][2]} тнг",
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              )),
                        );
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}
