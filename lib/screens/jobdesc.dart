import 'package:flutter/material.dart';
import 'package:internship_fair/constants/constants.dart';

class JobDesc extends StatefulWidget {
  final String jobPosition, companyName, minStipend, duration, workfromHome;
  final int id;
  const JobDesc(
    {Key? key,
    required this.id,
    required this.jobPosition,
    required this.companyName,
    required this.minStipend,
    required this.duration,
    required this.workfromHome})
    : super(key: key);

  @override
  State<JobDesc> createState() => _JobDescState();
}

class _JobDescState extends State<JobDesc> {

  bool abtcomp = false;
  bool jd = false;
  bool whocan = false;
  bool perks = false;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;

    final jobPosn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.jobPosition,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: textgreen,
              fontFamily: "poppins",
              fontSize: sizefont*1.5,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 0.003 * size.height,
        ),
        Text(
          widget.companyName,
          style: TextStyle(
            color: blackColor,
            fontFamily: "poppins",
            fontSize: sizefont*1.2,
          ),
        ),
        SizedBox(
          height: 0.003 * size.height,
        ),
        Text(
          'Location',
          style: TextStyle(
            color: darkgrey,
            fontFamily: "poppins",
            fontSize: sizefont,
          ),
        ),
      ],
    );

    final jobDetails = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: sizefont*0.2),
                child: CircleAvatar(
                  radius:sizefont*0.6,
                  backgroundColor: textgreen,
                  child: Icon(
                    Icons.location_on_sharp,
                    color: whiteColor,
                    size: sizefont,
                  ),
                ),
              ),
              SizedBox(
                width: sizefont*0.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MODE',
                    style: TextStyle(
                      color: darkgrey,
                      fontFamily: "poppins",
                      fontSize: sizefont,
                    ),
                  ),
                  Text(
                    widget.workfromHome,
                    style: TextStyle(
                      color: blackColor,
                      fontFamily: "poppins",
                      fontSize: sizefont*0.8,
                    ),
                  ),
                ],
              ),
            ],
          ),
         SizedBox(
           width: size.width*0.05,
         ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: sizefont*0.2),
                child: CircleAvatar(
                  radius:sizefont*0.6,
                  backgroundColor: textgreen,
                  child: Icon(
                    Icons.currency_rupee_outlined,
                    color: whiteColor,
                    size: sizefont,
                  ),
                ),
              ),
              SizedBox(
                width: sizefont*0.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MIN STIPEND',
                    style: TextStyle(
                      color: darkgrey,
                      fontFamily: "poppins",
                      fontSize: sizefont,
                    ),
                  ),
                  Text(
                    widget.minStipend,
                    style: TextStyle(
                      color: blackColor,
                      fontFamily: "poppins",
                      fontSize: sizefont*0.8,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: size.width*0.05,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: sizefont*0.2),
                child: CircleAvatar(
                  radius:sizefont*0.6,
                  backgroundColor: textgreen,
                  child: Icon(
                    Icons.timer,
                    color: whiteColor,
                    size: sizefont,
                  ),
                ),
              ),
              SizedBox(
                width: sizefont*0.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DURATION',
                    style: TextStyle(
                      color: darkgrey,
                      fontFamily: "poppins",
                      fontSize: sizefont,
                    ),
                  ),
                  Text(
                    widget.duration,
                    style: TextStyle(
                      color: blackColor,
                      fontFamily: "poppins",
                      fontSize: sizefont*0.8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );

    final aboutComp = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            abtcomp = !abtcomp;
          });},
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: Text(
                  'About The Company',
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: "poppins",
                    fontSize: sizefont,
                  ),),),);},
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListTile(
              contentPadding: const EdgeInsets.only(bottom: 30),
              title: Text(
                'MPYG is a one-of-a-kind platform aimed at helping yoga enthusiasts get a personalized & real-time feedback-based yoga experience. It is an artificial intelligence-based yoga platform that provides real-time audiovisual instructions to people of all ages taking into account their medical conditions.',
                style: TextStyle(color: blackColor,fontFamily: "poppins", fontSize: sizefont*0.8,
                ),),),),
          isExpanded: abtcomp, canTapOnHeader: true,),    
      ],
    );

    final jD = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            jd = !jd;
          });},
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: Text(
                  'Job Details',
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: "poppins",
                    fontSize: sizefont,
                  ),),),);},
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListTile(
              contentPadding: const EdgeInsets.only(bottom: 30),
              title: Text(
                'MPYG is a one-of-a-kind platform aimed at helping yoga enthusiasts get a personalized & real-time feedback-based yoga experience. It is an artificial intelligence-based yoga platform that provides real-time audiovisual instructions to people of all ages taking into account their medical conditions.',
                style: TextStyle(color: blackColor,fontFamily: "poppins", fontSize: sizefont*0.8,
                ),),),),
          isExpanded: jd, canTapOnHeader: true,),    
      ],
    );

    final whoCan = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            whocan = !whocan;
          });},
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: Text(
                  'Who Can Apply',
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: "poppins",
                    fontSize: sizefont,
                  ),),),);},
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListTile(
              contentPadding: const EdgeInsets.only(bottom: 10),
              title: Text(
                'MPYG is a one-of-a-kind platform aimed at helping yoga enthusiasts get a personalized & real-time feedback-based yoga experience. It is an artificial intelligence-based yoga platform that provides real-time audiovisual instructions to people of all ages taking into account their medical conditions.',
                style: TextStyle(color: blackColor,fontFamily: "poppins", fontSize: sizefont*0.8,
                ),),),),
          isExpanded: whocan, canTapOnHeader: true,),    
      ],
    );

    final perkS = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            perks = !perks;
          });},
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: Text(
                  'Perks',
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: "poppins",
                    fontSize: sizefont,
                  ),),),);},
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListTile(
              contentPadding: const EdgeInsets.only(bottom: 30),
              title: Text(
                'MPYG is a one-of-a-kind platform aimed at helping yoga enthusiasts get a personalized & real-time feedback-based yoga experience. It is an artificial intelligence-based yoga platform that provides real-time audiovisual instructions to people of all ages taking into account their medical conditions.',
                style: TextStyle(color: blackColor,fontFamily: "poppins", fontSize: sizefont*0.8,
                ),),),),
          isExpanded: perks, canTapOnHeader: true,),    
      ],
    );

    final applyButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        color: blackTeal,
        child: MaterialButton(
            padding: EdgeInsets.symmetric(vertical: sizefont*0.7),
            onPressed: () {
            },
            child: SizedBox(
              width: size.width,
              child: Text(
                "Apply",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'poppins', fontSize: sizefont, color: whiteColor),
              ),
            )));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined, color: blackColor),
          iconSize: sizefont*1.5,
          onPressed: () => Navigator.of(context).pop(),),
          centerTitle: true,
          backgroundColor: whiteColor,
          title: Text(
            'Job Description',
            style: TextStyle(fontFamily: 'poppins',fontSize: sizefont*1.5, color: blackColor),
          )),
      body:SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.symmetric(vertical: 27, horizontal: size.width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              jobPosn,
              SizedBox(height: size.width*0.05,),
              jobDetails,
              SizedBox(height: size.width*0.05,),
              aboutComp,
              SizedBox(height: size.width*0.03,),
              jD,
              SizedBox(height: size.width*0.03,),
              whoCan,
              SizedBox(height: size.width*0.03,),
              perkS,
              SizedBox(height: size.width*0.05,),
              applyButton
          ]),
          ),
      ),
    );
  }
}