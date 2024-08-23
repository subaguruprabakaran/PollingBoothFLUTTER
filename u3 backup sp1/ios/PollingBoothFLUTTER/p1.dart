import 'package:flutter/material.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';
class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
   final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child:  ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(

                child: Text('SRC Admin'),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(248,238,255,2),
                    image: DecorationImage(image: AssetImage("assets/real.jpeg"))
                ),
              ),
              Card(
                elevation: 20,
                //shadowColor: Colors.orange,
                child: ListTile(
                  leading: Icon(Icons.money,color: Colors.black,size:30,),
                  title: Text("Total paid",style: TextStyle(color: Colors.black,fontSize: 20),),
                  trailing:  IconButton(
                      icon: const Icon(Icons.chevron_right_sharp, size: 30,color: Colors.black,),
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor:Colors.black,
                          context: context,
                          builder: (context) {
                            return Wrap(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.edit,color: Colors.white,),
                                    title: Text('Edit',style: TextStyle(color: Colors.white),),
                                  ),





                                ]
                            );
                          },
                        );
                      }
                  ),
                ),
              ),
              Card(
                elevation: 20,
                shadowColor: Colors.orange,
                child: ListTile(
                  leading: Icon(Icons.money,color: Colors.black,size:30,),
                  title: Text("Add Costomer",style: TextStyle(color: Colors.black,fontSize: 20),),
                  trailing:  IconButton(
                      icon: const Icon(Icons.chevron_right_sharp, size: 30,color: Colors.black,),
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor:Colors.black,
                          context: context,
                          builder: (context) {
                            return Wrap(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.edit,color: Colors.white,),
                                    title: Text('Edit',style: TextStyle(color: Colors.white),),
                                  ),





                                ]
                            );
                          },
                        );
                      }
                  ),
                ),
              ),

            ]// Populate the Drawer in the last step.
        ),
      ),
      body: Column(
          children: [
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      backgroundColor: Colors.orange.shade200
                  ),
                  onPressed: () {
                     _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                      context: context,
                      onCode: (code) {
                      setState(() {
                      this.code = code;
                    });
                    });
                  },
                  child: Text(code ?? "QR code")),
            ),///QR SCANER
          ]
      ),
    );
  }
}

