import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'genres.dart';

class Generesscreen extends StatefulWidget {
  const Generesscreen({Key? key}) : super(key: key);

  @override
  State<Generesscreen> createState() => _GeneresscreenState();
}

class _GeneresscreenState extends State<Generesscreen> {
  @override
  final DataServices dataServices = DataServices();
  bool _isChecked = false;

  List<String> _selectedGenres = [];
     Color? _selectedColor;
  @override
 void initState() {
    setState(() {
      Color? _selectedColor;
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        backgroundColor: Colors.black,
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {},
            child: Container(

              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
          future: dataServices.loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic>? genres = snapshot.data;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "Let's create your ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' Account',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange,
                                      fontSize: 25)),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "First Name*",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(.5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Last Name*",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(.5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Mobile No*",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultTextStyle(
                      style: TextStyle(color: Colors.white),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          prefixText: "+91",
                          prefixStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.white.withOpacity(.5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Email*",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(.5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Visibility(
                      visible: _selectedGenres.isEmpty,
                      child: GestureDetector(
                          onTap: () {
                            showBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    color: Colors.black,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Geners",
                                          style:
                                              TextStyle(color: Colors.orange),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Wrap(
                                          children: genres!.map((genre) {


                                            _selectedColor = _selectedGenres.length == 0 ? Colors.grey : Colors.orange;
                                            return ChoiceChip(
                                              label: Text(genre),
                                              selected: _selectedGenres.contains(genre),
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  if (selected) {
                                                    _selectedGenres.add(genre);
                                                    _selectedColor = _selectedGenres.length >= 1 ? Colors.orange : Colors.grey;
                                                    print(_selectedGenres);
                                                  } else {
                                                    _selectedGenres.remove(genre);
                                                    _selectedColor = _selectedGenres.length >= 1 ? Colors.orange : Colors.grey;
                                                  }
                                                });
                                              },
                                              selectedColor: _selectedColor,
                                            );

                                          }).toList(),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              top: 50),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .end,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: ElevatedButton(
                                                    style:
                                                    ButtonStyle(
                                                      backgroundColor:
                                                      MaterialStateProperty
                                                          .all(Colors
                                                          .black),
                                                    ),
                                                    onPressed: () =>
                                                        Navigator.of(
                                                            context)
                                                            .pop(
                                                            _selectedGenres),
                                                    child: Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .orange),
                                                    )),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: ElevatedButton(
                                                    style:
                                                    ButtonStyle(
                                                      backgroundColor:
                                                      MaterialStateProperty
                                                          .all(Colors
                                                          .black),
                                                    ),
                                                    onPressed: () =>
                                                        Navigator.of(
                                                            context)
                                                            .pop(),
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .orange),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 320),
                                child: Text(
                                  "Genre",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.downloading,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    )),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                        visible: _selectedGenres.isNotEmpty,
                        child: Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                children: [
                                  ..._selectedGenres.map((String item) {
                                    return Chip(
                                      backgroundColor: Colors.orange,
                                      label: Text(item),
                                      onDeleted: () {
                                        setState(() {
                                          _selectedGenres.remove(item);
                                        });
                                      },
                                    );
                                  }).toList(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      size: 32.0,
                                      color: Colors.deepOrange,
                                    ),
                                    onPressed: () {
                                      showBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              color: Colors.black,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Geners",
                                                    style: TextStyle(
                                                        color: Colors.orange),
                                                  ),
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  Wrap(
                                                    children:
                                                        genres!.map((genre) {
                                                      Color? _selectedColor =
                                                          Colors.orange;

                                                      return ChoiceChip(
                                                        label: Text(genre),
                                                        selected:
                                                            _selectedGenres
                                                                .contains(
                                                                    genre),
                                                        onSelected:
                                                            (bool selected) {
                                                          setState(() {
                                                            if (selected) {
                                                              _selectedGenres
                                                                  .add(genre);
                                                              _selectedColor =
                                                                  _selectedGenres
                                                                              .length >=
                                                                          1
                                                                      ? Colors
                                                                          .orange
                                                                      : Colors
                                                                          .grey;
                                                              print(
                                                                  _selectedGenres);
                                                            } else {
                                                              _selectedGenres
                                                                  .remove(
                                                                      genre);
                                                              _selectedColor =
                                                                  _selectedGenres
                                                                              .length >=
                                                                          1
                                                                      ? Colors
                                                                          .orange
                                                                      : Colors
                                                                          .grey;
                                                            }
                                                          });
                                                          setState(() {});
                                                        },
                                                        selectedColor:
                                                            _selectedColor,
                                                      );
                                                    }).toList(),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 50),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Colors
                                                                            .black),
                                                              ),
                                                              onPressed: () =>
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(
                                                                          _selectedGenres),
                                                              child: Text(
                                                                "OK",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .orange),
                                                              )),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Colors
                                                                            .black),
                                                              ),
                                                              onPressed: () =>
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(),
                                                              child: Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .orange),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Performance Type*",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          color: Colors.white,
                          child: Checkbox(
                            value: _isChecked,
                            activeColor: Colors.orange,
                            checkColor: Colors.black,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value == true;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "In Person",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          color: Colors.white,
                          child: Checkbox(
                            value: _isChecked,
                            activeColor: Colors.orange,
                            checkColor: Colors.black,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value == true;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "Virtual",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orangeAccent),
                          ),
                          onPressed: () {},
                          child: Text("SUBMIT")),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
