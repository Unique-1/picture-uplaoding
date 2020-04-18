import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import 'dart:io';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PendingAssesmentDetails(),
    );
  }
}
class PendingAssesmentDetails extends StatefulWidget {

  @override
  _PendingAssesmentDetailsState createState() =>
      _PendingAssesmentDetailsState();
}

class _PendingAssesmentDetailsState extends State<PendingAssesmentDetails> {


  final currencyFormatter = new NumberFormat("#,##0.00", "en_US");
  String name, amount;
  double insertAmount = 00.0;
  DateTime _dateTime;
  
  List dataList = new List();
  List <File>img=new List<File>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final imgController = TextEditingController();

  
  Future<File> imageFile;
  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
   });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('Details')),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 4,
                child: Container(
                  //height: 0.60 * MediaQuery.of(context).size.height,
                  //height: 430.0,
                  width: MediaQuery.of(context).size.width,
                  child: getTop(context),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  //height: 0.30 * MediaQuery.of(context).size.height,
                  // height: 300.0,
                  width: MediaQuery.of(context).size.width,
                  child: getMidle(context),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  // height: 0.10 * MediaQuery.of(context).size.height,
                  //  height: 100.0,
                  width: MediaQuery.of(context).size.width,
                  child: getBottom(context),
                ),
              ),
            ]),
      ),
    );
  }

  Widget getTop(context) {
   
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Claim #",
                style: TextStyle(fontSize: 18, fontFamily: 'Didact Gothic')),
            Text("Insurance Company",
                style: TextStyle(fontSize: 18, fontFamily: 'Didact Gothic')),
            Divider(
              height: 10,
              thickness: 2,
            ),
            /*
  ===========================================================================
  ======================================DATE=================================
  ===========================================================================
  */
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                'Date',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, fontFamily: 'Didact Gothic'),
              ),
            ),
            InkWell(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate:
                            _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025))
                    .then((date) {
                  setState(() {
                    _dateTime = date;
                    //DateFormat("dd/mm/yyyy").format(_dateTime);
                  });
                });
              },
              child: Container(
                width: double.maxFinite,
                height: 56.0,
                margin: EdgeInsets.only(top: 8),
                alignment: Alignment.centerLeft,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[300])),
                padding: EdgeInsets.only(left: 10, right: 8),
                child: Text(
                  _dateTime == null ? 'SelectDate' : _dateTime.toString(),
                  style: TextStyle(fontFamily: 'Google', fontSize: 16),
                ),
              ),
            ),
            /*
  ===========================================================================
  ==================================NAME=====================================
  ===========================================================================
  */
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                'Name',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontFamily: 'Didact Gothic'),
              ),
            ),
            Container(
              height: 56.0,
              padding: EdgeInsets.only(left: 8),
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300], width: 1)),
              child: TextFormField(
                controller: titleController,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintStyle: new TextStyle(color: Colors.grey[500]),
                  hintText: "Name",
                  fillColor: Colors.transparent,
                ),

                // onChanged: (value) {
                //   name = value;
                // },
              ),
            ),
            /*
  ===========================================================================
  ================================ASSESMENt AMOUNT===========================
  ===========================================================================
  */

            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                'Assesment Amount',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontFamily: 'Didact Gothic'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 4,
                  child: Container(
                    height: 56.0,
                    padding: EdgeInsets.only(left: 8),
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300], width: 1)),
                    child: TextFormField(
                      controller: amountController,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintStyle: new TextStyle(color: Colors.grey[500]),
                        hintText: "Assesment Amount",
                        fillColor: Colors.transparent,
                      ),
                      // onSaved: (value) {
                      //   amount = value;
                      // },

                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Flexible(
                      flex: 1,
                      child: Transform.rotate(
                        angle: math.pi / 4,
                        child: IconButton(
                          icon: Icon(
                            Icons.attachment,
                            size: 35,
                          ),
                          tooltip: 'Attachment',
                          onPressed: () {
                            //_takePicture();
                            pickImageFromGallery(ImageSource.gallery);
                          },
                        ),
                      )),
                )
              ],
            ),

            /*
  ===========================================================================
  =================================BUTTON====================================
  ===========================================================================
  */
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                      onPressed: () {
                        setState(() {
                          name = titleController.text +
                              "." +
                              double.parse(amountController.text).toString() ;
                          dataList.add(name);
                          img.add(imageFile);
                          //dataList.add(imageFile);
                          insertAmount = insertAmount +
                              double.parse(amountController.text);
                          titleController.clear();
                          amountController.clear();
                          
                        });
                      },
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Insert', style: TextStyle(fontSize: 16))),
                  Padding(
                      padding: EdgeInsets.only(
                    left: 30,
                  )),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        titleController.clear();
                        amountController.clear();
                      });
                    },
                    child: Text('Cancel', style: TextStyle(fontSize: 16)),
                  )
                ],
              ),
            )
          ]),
    );
  }

  Widget getMidle(context) {
    return Container(
      child: ListView.builder(
          itemCount: dataList == null ? 0 : dataList.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: EdgeInsets.all(0),
              child: Card(
                child: ListTile(
                    title: Flexible(
                  fit: FlexFit.loose,
                  flex: 9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Flexible(
                      // flex: 2,
                      Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Item Name'),
                              
                              Text(
                                dataList[index].toString().split(".")[0],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Amount'),
                              Text(
                                dataList[index].toString().split(".")[1],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),

                      //IMAGE
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        // child: Padding(
                        //   padding: const EdgeInsets.only(top: 12, left: 10),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(1),
                          ),
                          child: Image.file(img[index].imageFile),
                         // child: showImage(),
                        ),
                      
                      )
                      
                    ],
                  ),
                )),
              ),
            );
          }),
    );
  }

  Widget getBottom(context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Text('Total Assesment Amount',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Didact Gothic')),
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: 40,
              width: 150,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(1),
              ),
              child: Text(
                "${currencyFormatter.format(double.parse(insertAmount.toString()))}",
                //insertAmount.toString(),
                textAlign: TextAlign.left,
                //overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            // width: 300,
            // height: 300,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
}

