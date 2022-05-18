/*
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResumenWidget extends StatefulWidget {
  const ResumenWidget({required Key key}) : super(key: key);

  @override
  _ResumenWidgetState createState() => _ResumenWidgetState();
}

class _ResumenWidgetState extends State<ResumenWidget> {
  late String choiceChipsValue1;
  late String choiceChipsValue2;
  late String choiceChipsValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF9E9E9E),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.kindpng.com%2Fpicc%2Fm%2F24-245173_dama-profesor-perfil-la-cabeza-mujeres-mujer-user.png&f=1&nofb=1',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 14),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Nombre y Apellido',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF0052AB),
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                  child: Text(
                    'Edad',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF0052AB),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0xFF0052AB),
                        offset: Offset(0, -3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.4, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FlutterFlowChoiceChips(
                            initiallySelected: [choiceChipsValue1],
                            options: [
                              ChipData('Secciones', Icons.category_outlined)
                            ],
                            onChanged: (val) =>
                                setState(() => choiceChipsValue1 = val.first),
                            selectedChipStyle: ChipStyle(
                              backgroundColor: Color(0xFF00DCA8),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              iconColor: Colors.white,
                              iconSize: 18,
                              elevation: 4,
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF323B45),
                                  ),
                              iconColor: Color(0xFF323B45),
                              iconSize: 18,
                              elevation: 1,
                            ),
                            chipSpacing: 20,
                            multiselect: false,
                            alignment: WrapAlignment.start,
                          ),
                        ),
                        Expanded(
                          child: FlutterFlowChoiceChips(
                            initiallySelected: [choiceChipsValue2],
                            options: [ChipData('Resumen', Icons.article_sharp)],
                            onChanged: (val) =>
                                setState(() => choiceChipsValue2 = val.first),
                            selectedChipStyle: ChipStyle(
                              backgroundColor: Color(0xFF00DCA8),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              iconColor: Colors.white,
                              iconSize: 18,
                              elevation: 4,
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF323B45),
                                  ),
                              iconColor: Color(0xFF323B45),
                              iconSize: 18,
                              elevation: 4,
                            ),
                            chipSpacing: 20,
                            multiselect: false,
                            alignment: WrapAlignment.start,
                          ),
                        ),
                        Expanded(
                          child: FlutterFlowChoiceChips(
                            initiallySelected: [choiceChipsValue3],
                            options: [ChipData('+ Miembro', Icons.people_alt)],
                            onChanged: (val) =>
                                setState(() => choiceChipsValue3 = val.first),
                            selectedChipStyle: ChipStyle(
                              backgroundColor: Color(0xFF00DCA8),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              iconColor: Colors.white,
                              iconSize: 18,
                              elevation: 4,
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF323B45),
                                  ),
                              iconColor: Color(0xFF323B45),
                              iconSize: 18,
                              elevation: 4,
                            ),
                            chipSpacing: 20,
                            multiselect: false,
                            alignment: WrapAlignment.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.account_circle,
                              ),
                              title: Text(
                                'Nombre: ',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              subtitle: Text(
                                'Nombre Y Apellido',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.cake,
                              ),
                              title: Text(
                                'Edad:',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              subtitle: Text(
                                '##',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.add_box_sharp,
                              ),
                              title: Text(
                                'Grupo Sanguíneo:',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              subtitle: Text(
                                '##+',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.chrome_reader_mode,
                              ),
                              title: Text(
                                'Vacunas',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              subtitle: Text(
                                '* 1ª Dosis\n* 2ª Dosis ',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.add_comment_outlined,
                              ),
                              title: Text(
                                'Cirugías',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              subtitle: Text(
                                '* Fecha y Tipo de cirugia',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.tablets,
                              ),
                              title: Text(
                                'Medicamentos',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              subtitle: Text(
                                'Insulina, paracetamol',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
