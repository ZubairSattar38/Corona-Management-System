import 'package:flutter/material.dart';
import '../TabBarScreen/NonVacinatedDoctor.dart';
import '../Widgets/AddDrawer.dart';

class DoctorScreen extends StatefulWidget {
  @override
  State createState() => new DoctorPageState();
}

class DoctorPageState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: DrawerWidget(),
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: [
                Tab(
                  icon: Icon(Icons.medication_outlined),
                  text: 'Non Vaccinated',
                ),
                Tab(
                    icon: Icon(Icons.local_hospital),
                    text: 'Partial Vaccinated'),
                Tab(icon: Icon(Icons.local_pharmacy), text: 'Fully Vaccinated'),
              ],
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff5808e5),
            title: Text('Doctors'),
          ),
          body: TabBarView(
            children: <Widget>[
              NonVaccinatedScreenDoctor(1),
              NonVaccinatedScreenDoctor(2),
              NonVaccinatedScreenDoctor(3),
            ],
          ),
        ));
  }
}
