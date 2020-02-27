import 'package:clone_youtube/customSearchDelegate.dart';
import 'package:clone_youtube/telas/biblioteca.dart';
import 'package:clone_youtube/telas/emalta.dart';
import 'package:clone_youtube/telas/inicio.dart';
import 'package:clone_youtube/telas/inscricao.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _pesquisa = '';
  
  @override
  Widget build(BuildContext context) {

    

    List<Widget> telas = [
      Inicio(_pesquisa),
      EmAlta(),
      Biblioteca(),
      Inscricao(),
    ];

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          //color: Colors.grey,
        ),
        title: Image.asset(
          'img/youtube3.png',
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.videocam),
          //   onPressed: () {
          //     print('videocam');
          //   },
          // ),
          // IconButton(
          //   icon: Icon(Icons.account_circle),
          //   onPressed: () {
          //     print('conta');
          //   },
          // ),

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async{
              String res =  await showSearch(
                context: context, 
                delegate: CustomSearchDelegate());
                setState(() {
                  _pesquisa = res;
                });
            },

          ),


        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
            print(indice);
            _pesquisa = '';
          });
        },
        type: BottomNavigationBarType.fixed,
        //fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text('Início'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Em Alta'),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            title: Text('Inscrições'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Biblioteca'),
            icon: Icon(Icons.library_add),
          ),
        ],
      ),
    );
  }
}
