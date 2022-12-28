import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final heroTag;
  final Wpoknom;
  final WpokTipo;
  final WpokNum;
  final WpokImg;

  final WpokAltura;
  final WpokPeso;

  DetailsScreen({Key? key, this.heroTag, this.Wpoknom, this.WpokTipo, this.WpokNum, this.WpokImg, this.WpokAltura, this.WpokPeso}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: 
        widget.WpokTipo=="Grass" ? Colors.greenAccent
        : widget.WpokTipo=="Fire" ?Colors.redAccent
        : widget.WpokTipo=="Water" ?Colors.blueAccent
        : widget.WpokTipo=="Bug" ?Colors.lightGreenAccent
        : widget.WpokTipo=="Poison" ?Colors.purpleAccent
        : widget.WpokTipo=="Electric" ?Colors.amber
        : widget.WpokTipo=="Ground" ?Colors.brown
        : widget.WpokTipo=="Fighting" ?Colors.orange
        : widget.WpokTipo=="Psychic" ?Colors.pinkAccent
        : widget.WpokTipo=="Dragon" ?Colors.blueGrey
        : widget.WpokTipo=="Rock" ?Colors.grey
        : widget.WpokTipo=="Ice" ?Colors.lightBlue
        : Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _FlechaAtras(),
          _NombreNumeroPokemon(),
          _TipoPokemon(),
          _PokeballFondo(),
          Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Altura:",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.WpokAltura.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Peso:",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.WpokPeso.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              top: (height * 0.2),
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                    imageUrl:
                        widget.WpokImg,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover),
              )),
        ],
      ),
    );
  }

  Widget _FlechaAtras() {
    return Positioned(
        top: 35,
        left: 5,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  Widget _NombreNumeroPokemon() {
    return Positioned(
        top: 90,
        left: 20,
        right: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.Wpoknom.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text("#" + widget.WpokNum.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))
          ],
        ));
  }

  Widget _TipoPokemon() {
    return Positioned(
        top: 130,
        left: 25,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.WpokTipo.toString(),
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ));
  }

  Widget _PokeballFondo() {
    var height = MediaQuery.of(context).size.height;

    return Positioned(
        top: height * 0.18,
        right: -30,
        child: Image.asset(
          'images/pokeball.png',
          height: 200,
          fit: BoxFit.fitHeight,
        ));
  }
}
