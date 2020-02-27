import 'package:clone_youtube/api.dart';
import 'package:clone_youtube/model/video.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String q) {
    Api api = Api();
    return api.pesquisar(q);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: _listarVideos('street fighter'),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (contex, index) {
                      return Column(
                        children: <Widget>[
                          Text('Texto qualquer' + index.toString())
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 2,
                          color: Colors.red,
                        ),
                    itemCount: snapshot.data.length);
              } else {
                return Text('Nenhum dado a ser exibido');
              }
              break;
          }
        });
  }
}
