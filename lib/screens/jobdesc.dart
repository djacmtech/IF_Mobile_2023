import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/models/addtocart.dart';
import 'package:internship_fair/screens/cart.dart';
import 'package:internship_fair/screens/summary.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class JobDesc extends StatefulWidget {
  final String? jobPosition,
      companyName,
      minStipend,
      duration,
      workfromHome,
      about,
      logo,
      location;
  final List<dynamic> skills, perks, requirements;

  final int jobid;
  const JobDesc(
      {Key? key,
      required this.jobid,
      required this.jobPosition,
      required this.companyName,
      required this.minStipend,
      required this.duration,
      required this.workfromHome,
      required this.about,
      required this.perks,
      required this.location,
      required this.requirements,
      this.logo,
      required this.skills})
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

    void cartAdd() async {
      Loader.show(context,
          progressIndicator: CircularProgressIndicator(color: blackTeal));
      String status = '';
      int userid = GetStorage().read("id");
      try {
        status = await addCart(userid, widget.jobid);
      } on Exception catch (e) {
        Loader.hide();
        print(e);
      }
      Loader.hide();

      if (status == "Success") {
        MotionToast.success(
          width: size.width * 0.6,
          height: 65,
          borderRadius: 10,
          padding: EdgeInsets.zero,
          title: Text(
            "Job successfully added to Cart",
            style: TextStyle(
                color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          description: Text(
            "Your selected job has been successfully added to the cart",
            style: TextStyle(
              color: Colors.white,
              fontSize: sizefont * 0.7,
            ),
          ),
        ).show(context);
        //     ),
        //   ],
        // ),
      } else if (status == "Job already in cart") {
        MotionToast(
          primaryColor: darkgrey,
          width: size.width * 0.8,
          height: sizefont * 5,
          borderRadius: 10,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          title: Text(
            "Job Already in Cart",
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: sizefont * 0.8,
            ),
          ),
          description: Text(
            "Please remove the existing job before adding a new one",
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontSize: sizefont * 0.7,
            ),
          ),
        ).show(context);
      } else {
        MotionToast.error(
          height: sizefont * 5,
          borderRadius: 10,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          title: Row(
            children: [
              // Icon(
              //   Icons.error_outline,
              //   color: Colors.white,
              //   size: 24,
              // ),
              // SizedBox(width: 16),
              Text(
                "Could Not Add to Cart",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: sizefont * 0.9,
                ),
              ),
            ],
          ),
          description: Text(
            "Please check your internet connection and try again",
            style: TextStyle(
              fontFamily: "Poppins",
              color: whiteColor,
              fontSize: sizefont * 0.7,
            ),
          ),
        ).show(context);
      }
    }

    final jobPosn = Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.jobPosition!,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: textgreen,
                  fontFamily: "poppins",
                  fontSize: sizefont * 1.5,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 0.003 * size.height,
            ),
            Text(
              widget.companyName!,
              style: TextStyle(
                color: blackColor,
                fontFamily: "poppins",
                fontSize: sizefont * 1.2,
              ),
            ),
            SizedBox(
              height: 0.003 * size.height,
            ),
            Text(
              widget.location!,
              style: TextStyle(
                color: darkgrey,
                fontFamily: "poppins",
                fontSize: sizefont,
              ),
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.2,
        ),
        Container(
          width: size.width * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.logo!),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );

    final jobDetails = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: sizefont * 0.2),
              child: CircleAvatar(
                radius: sizefont * 0.6,
                backgroundColor: textgreen,
                child: Icon(
                  Icons.location_on_sharp,
                  color: whiteColor,
                  size: sizefont,
                ),
              ),
            ),
            SizedBox(
              width: sizefont * 0.5,
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
                  widget.workfromHome!,
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: "poppins",
                    fontSize: sizefont * 0.8,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: sizefont * 0.2),
              child: CircleAvatar(
                radius: sizefont * 0.6,
                backgroundColor: textgreen,
                child: Icon(
                  Icons.currency_rupee_outlined,
                  color: whiteColor,
                  size: sizefont,
                ),
              ),
            ),
            SizedBox(
              width: sizefont * 0.5,
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
                  widget.minStipend!,
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: "poppins",
                    fontSize: sizefont * 0.8,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: sizefont * 0.2),
              child: CircleAvatar(
                radius: sizefont * 0.6,
                backgroundColor: textgreen,
                child: Icon(
                  Icons.timer,
                  color: whiteColor,
                  size: sizefont,
                ),
              ),
            ),
            SizedBox(
              width: sizefont * 0.5,
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
                  widget.duration!,
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: "poppins",
                    fontSize: sizefont * 0.8,
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
        });
      },
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
                  ),
                ),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListTile(
              contentPadding: const EdgeInsets.only(bottom: 30),
              title: Text(
                widget.about!,
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont * 0.8,
                ),
              ),
            ),
          ),
          isExpanded: abtcomp,
          canTapOnHeader: true,
        ),
      ],
    );

    final jD = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          jd = !jd;
        });
      },
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: Text(
                  'Skills',
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: "poppins",
                    fontSize: sizefont,
                  ),
                ),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListTile(
              contentPadding: const EdgeInsets.only(bottom: 30),
              title: Text(
                widget.skills.toString(),
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont * 0.8,
                ),
              ),
            ),
          ),
          isExpanded: jd,
          canTapOnHeader: true,
        ),
      ],
    );

    final whoCan = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          whocan = !whocan;
        });
      },
      dividerColor: greyColor,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: Text(
                  'Requirements',
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: "poppins",
                    fontSize: sizefont,
                  ),
                ),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListTile(
              contentPadding: const EdgeInsets.only(bottom: 10),
              title: Text(
                widget.requirements.toString(),
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont * 0.8,
                ),
              ),
            ),
          ),
          isExpanded: whocan,
          canTapOnHeader: true,
        ),
      ],
    );

    final perkS = ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          perks = !perks;
        });
      },
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
                  ),
                ),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListTile(
              contentPadding: const EdgeInsets.only(bottom: 30),
              title: Text(
                widget.perks.toString(),
                style: TextStyle(
                  color: blackColor,
                  fontFamily: "poppins",
                  fontSize: sizefont * 0.8,
                ),
              ),
            ),
          ),
          isExpanded: perks,
          canTapOnHeader: true,
        ),
      ],
    );

    final applyButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        color: blackTeal,
        child: Container(
          height: sizefont * 3,
          padding: EdgeInsets.symmetric(vertical: sizefont * 0.5),
          child: MaterialButton(
              onPressed: () {
                cartAdd();
                //   Navigator.pushReplacement(context,
                //       MaterialPageRoute(builder: ((context) => SummaryPage())));
                // },
              },
              child: SizedBox(
                width: size.width,
                child: Text(
                  "Apply",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: sizefont,
                      color: whiteColor),
                ),
              )),
        ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: blackColor),
            iconSize: sizefont * 1.5,
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          backgroundColor: whiteColor,
          title: Text(
            'Job Description',
            style: TextStyle(
                fontFamily: 'poppins',
                fontSize: sizefont * 1.5,
                color: blackColor),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 27, horizontal: size.width * 0.06),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                jobPosn,
                SizedBox(
                  height: size.width * 0.05,
                ),
                jobDetails,
                SizedBox(
                  height: size.width * 0.05,
                ),
                aboutComp,
                SizedBox(
                  height: size.width * 0.03,
                ),
                jD,
                SizedBox(
                  height: size.width * 0.03,
                ),
                whoCan,
                SizedBox(
                  height: size.width * 0.03,
                ),
                perkS,
                SizedBox(
                  height: size.width * 0.05,
                ),
                applyButton
              ]),
        ),
      ),
    );
  }
}
