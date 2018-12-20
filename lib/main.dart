import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_recyclerview/Contact.dart';
void main() => runApp(Recyclerview());

class Recyclerview extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Recyclerview',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("RecylerView"),
          backgroundColor: Colors.green,
        ),
        body: Recyclerclass() ,
      ),
    );
  }

}
class Recyclerclass extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new  RandomwordState();
  }
}
class RandomwordState extends State<Recyclerclass> {
  List<Contact> contacts = [
    Contact(fullName: "Mohammed Ramzan",email: "ramzanelayodath@yahoo.com"),
    Contact(fullName: "Mukund Lal",email: "mukundlal@gmail.com"),
    Contact(fullName: "Mohammed Shani",email: "shanisha@gmail.com")
  ];
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView.builder(itemBuilder: (_,int index) =>EachList(this.contacts[index].fullName,this.contacts[index].email),
        itemCount: this.contacts.length
      ),
    );
  }

}

class EachList extends StatelessWidget {
  String name = "";
  String email = "";

  EachList(this.name, this.email);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
            child: Text(name[0]),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white
        ),
        title: Text(name,
            style: TextStyle(fontSize: 18)),
        subtitle: Text(email,
          style: TextStyle(fontSize: 16),),
      onTap: (){
        final snackBar = SnackBar(
          content: Text(name),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change!
            },
          ),
        );

        // Find the Scaffold in the Widget tree and use it to show a SnackBar!
        Scaffold.of(context).showSnackBar(snackBar);
      },
      );
  }
}

/* padding: EdgeInsets.all(8.0),
child: Row(
children: <Widget>[
CircleAvatar(
child: Text(name[0]),
backgroundColor: Colors.green,
foregroundColor: Colors.white
),
Padding(padding: EdgeInsets.only(right: 10.0)),
Text(this.name,
style: TextStyle(fontSize: 18))
],
), */

