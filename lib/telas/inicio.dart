import 'package:clone_youtube/api.dart';
import 'package:clone_youtube/model/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {
  String pesquisa;
  Inicio(this.pesquisa);
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
        future: _listarVideos(widget.pesquisa),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Sem conexão');
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
              return CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (contex, index) {
                      List<Video> videos = snapshot.data;
                      Video video = videos[index];

                      return GestureDetector(
                        onTap: () {
                          FlutterYoutube.playYoutubeVideoById(
                            apiKey: chave_youtube_api,
                            videoId: video.id,
                            autoPlay: true,
                            fullScreen: true
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(video.imagem))),
                            ),
                            ListTile(
                              title: Text(video.titulo),
                              subtitle: Text(video.canal),
                            )
                          ],
                        ),
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
