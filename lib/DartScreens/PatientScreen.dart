import 'package:flutter/material.dart';
import '../ApiFunc/callPatientApi.dart';
import '../TabBarScreen/NonVacinated.dart';
import '../TabBarScreen/PartialVacinated.dart';
import '../TabBarScreen/FullyVacinatedScreen.dart';
class PatientScreen extends StatefulWidget {
  @override
  State createState() => new PatientPageState();
}

class PatientPageState extends State<PatientScreen> {
  @override
    List patient=[];

  Widget build(BuildContext context) {
    Future<void> getPatient(String type) async {
      patient =await getPatientApi(type);
    }

    return new DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: [
                Tab(
                  icon: Icon(Icons.medication_outlined),
                  text: 'Non Vaccinated',
                  // onTap:getPatient
                ),
                Tab(
                    icon: Icon(Icons.local_hospital),
                    text: 'Partial Vaccinated'),
                Tab(icon: Icon(Icons.local_pharmacy), text: 'Fully Vaccinated'),
              ],
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff5808e5),
            title: Text('Patients'),
          ),
          body: TabBarView(
            children: [
                 new  NonVaccinatedScreen(),
                 new PartialVacinatedScreen(),
                 new FullyVacinatedScreen()
              // new Column(
              //   children: <Widget>[
              //       new Text('Car '),
              //   ],
              // ),
            ],
          ),
        ));
  }
}
