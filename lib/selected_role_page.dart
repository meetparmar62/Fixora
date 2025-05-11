import 'package:fixora/customer_register.dart';
import 'package:fixora/worker_register.dart';
import 'package:flutter/material.dart';

class SelectedRolePage extends StatefulWidget {
  const SelectedRolePage({super.key});

  @override
  State<SelectedRolePage> createState() => _SelectedRolePageState();
}

class _SelectedRolePageState extends State<SelectedRolePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Role"),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blue.shade100,

        child: Center(
          child: Container(
            width: 320,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>CustomerRegister ()));
                  },
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text("Customer",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>WorkerRegister ()));
                  },
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color:Colors.blueGrey.shade100,
                    ),
                    child: Center(
                      child: Text("Worker",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}