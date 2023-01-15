import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interntsk/visible.dart';
import 'genres.dart';

class Generesscreen extends StatefulWidget {
  const Generesscreen({Key? key}) : super(key: key);

  @override
  State<Generesscreen> createState() => _GeneresscreenState();
}

class _GeneresscreenState extends State<Generesscreen> {


  @override
  final _firstVisibilityKey = UniqueKey();
  final _secondVisibilityKey = UniqueKey();
  final GlobalKey<State<BottomSheetContent>> key = new GlobalKey<State<BottomSheetContent>>();
  final  Color? selectedColor =Colors.grey;
  final DataServices dataServices = DataServices();
  bool _isChecked = false;

  bool isChecked1 = false;

 final List<String> selectedGenres = [];
  bool isLoading = false;



  @override
  Widget build(BuildContext context) {
    print("Parent widget rebuild!");
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
                    Stack(
                      children: [
                        Visibility(
                          key: _firstVisibilityKey,
                          visible: selectedGenres.isEmpty ,
                          child: GestureDetector(
                            onTap: () {

                                showBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return BottomSheetContent(
                                          selectedGenres:selectedGenres,genres:genres,key:key,parentState: this);

                              });
                                setState(() {

                                });

                            },
                            child: Column(
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
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Visibility(
                          key:_secondVisibilityKey,
                          visible: selectedGenres.isNotEmpty ,
                          child: Row(
                            children: [
                              Expanded(
                                child: Wrap(
                                  children: [
                                    ...selectedGenres.map((String item) {
                                      return Chip(
                                        backgroundColor: Colors.orange,
                                        label: Text(item),
                                        onDeleted: () {
                                          setState(() {
                                            selectedGenres.remove(item);
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
                                                return BottomSheetContent(
                                                    selectedGenres:selectedGenres,genres:genres,key:key,
                                                    parentState: this);
                                              });
                                        }
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),


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
                            value: isChecked1,
                            activeColor: Colors.orange,
                            checkColor: Colors.black,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked1 = value == true;
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