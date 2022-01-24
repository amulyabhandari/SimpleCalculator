import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());

}
class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output="0";
  String output1= '0';
  double num1=0.0;
  double num2=0.0;
  String operand='';
  operation(String btntext)
  {
    if(btntext=="C") {
      output1 = "0";
      num2=0.0;
      num1 = 0.0;
      operand="";

    }
    else if (btntext=="+" || btntext=="-" || btntext=="/" ||btntext=="x" )
{
  num1=double.parse(output);
  operand=btntext;
  output1="0";
}
    else if(btntext== "=") {
      num2 = double.parse(output);
      if (operand == "-") {
        output1 = (num1 - num2).toString();
      }
      if (operand == "/") {
        output1 = (num1 / num2).toString();
      }
      if (operand == "x") {
        output1 = (num1 * num2).toString();
      }
      if (operand == "+") {
        output1 = (num1 + num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
      else
        {
          output1=output1+btntext;
          
        }
      setState(() {
        output= double.parse(output1).toStringAsFixed(2);
      });
  }
  Widget button(String btntext)
  {
    return  Expanded(
      child: RawMaterialButton(
        onPressed: () {
          operation(btntext);
          },
        shape: Border.all(color: Colors.black,width: 2),
        fillColor: Colors.black12,
        padding: const EdgeInsets.all(30.0),
        splashColor: Colors.black,
        child:  Text(
            btntext,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),

        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculator by Amulya"),
          backgroundColor: Colors.black,

        ),
        body: Container(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight ,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width:2),
                      color: Colors.black12,
                    ),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom:8),
                    child: Text(
                      output,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:80,

                      ),
                    ),
                  ),
              ),
              Row(
                children:  [
                  button("9"),
                  const SizedBox(
                    width: 8,
                  ),
                  button("8"),
                  const SizedBox(
                    width: 8,
                  ),
                  button("7"),
                  const SizedBox(
                    width: 8,
                  ),
                  button("/"),
                  const SizedBox(
                    width: 8,
                  ),
                ],

              ),
              const SizedBox(
                height: 5,
              ),

              Row(
                children:  [
                  button("6"),
                  const SizedBox(
                    width: 8,
                  ),
                  button("5"),
                  const SizedBox(
                    width: 8,
                  ),
                  button("4"),
                  const SizedBox(
                    width: 8,
                  ),
                  button("x"),
                  const SizedBox(
                    width: 8,
                  ),
                ],

              ),
              const SizedBox(
                height: 5,
              ),


              Row(
                children:  [
                  button("3"),
                  const SizedBox(
                    width: 8,
                  ),
                  button("2"),
                  const SizedBox(
                    width: 8,
                  ),
                  button("1"),
                  const SizedBox(
                    width: 8,
                  ),
                  button("-"),
                  const SizedBox(
                    width: 8,
                  ),
                ],

              ),
              const SizedBox(
                height: 5,
              ),


              Row(
                children:  [
                  button("0"),
                  const SizedBox(
                    width: 8,
                  ),
                  button("C"),
                  const SizedBox(
                    width: 8,
                  ),
                  button("="),
                  const SizedBox(
                    width: 8,
                  ),
                  button("+"),
                  const SizedBox(
                    width: 8,
                  ),
                ],

              ),


            ],

          ),
        ),
      ),
    );
  }
}
