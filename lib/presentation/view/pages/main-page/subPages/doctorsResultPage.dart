import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vezeeta_clone/presentation/view/reusable_screens/SearchByNameScreen.dart';
import 'package:vezeeta_clone/presentation/view/reusable_screens/filterScreen.dart';
import 'package:vezeeta_clone/presentation/view/reusable_screens/splash_screen.dart';



import '../../../../../data/controller/doctorController.dart';
import '../../../../../data/model/doctorModel.dart';
import '../../../managers/colorsManager.dart';
import '../../../managers/textStyleManager.dart';
import '../../../reuseable_widgets/doctorCardWidget.dart';
import 'selectCityPage.dart';


int pageNumber = 1;



class DoctorsListPage extends StatefulWidget {
  const DoctorsListPage(
      {Key? key,this.filter,  this.cityName})
      : super(key: key);
  final String? cityName;
  final Map<String , dynamic>? filter;


  @override
  State<DoctorsListPage> createState() => _DoctorsListPageState();
}

class _DoctorsListPageState extends State<DoctorsListPage> {
  final ScrollController _controller = ScrollController();

@override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  print(widget.filter);
    return Scaffold(
      body: Column(
        children: [
          // customized app bar
          DecoratedBox(
            decoration: const BoxDecoration(color: ColorManager.appBarColor),
            child: SizedBox(
              height: 85,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 5, right: 45),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Searching in",
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            child: Card(
                              margin: EdgeInsets.zero,
                              elevation: 0,
                              color: const Color.fromRGBO(
                                  3, 94, 179, 0.7137254901960784),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.cityName!,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectCityPage())),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.zero,
            elevation: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // search
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchByNameScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              Text(
                                "search for,doctor",
                                style: TextStyling.subTitleStyleText,
                              )
                            ],
                          ),
                        ),
                      )),
                )  ,              //filter buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(children: [

                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              elevation: 0,
                            ),
                            onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FilterScreen()));},
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.filter_alt_outlined),
                                  Text("Filter")
                                ]))),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              elevation: 0,
                            ),
                            onPressed: () {},
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.location_on_rounded),
                                  Text("Map")
                                ]))),
                  ]),
                ),
                // premium adv

                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                  elevation: 0,
                  color: ColorManager.lightBlueBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical:20.0, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/logo.png"),
                                  width: 80,
                                ),
                                SizedBox(width: 10),
                                Card(
                                  color: Colors.red,
                                  margin: EdgeInsets.only(top: 6),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      "Care",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Save up to 50% of you medical bills.",
                              style: TextStyle(
                                  color: ColorManager.lightBlueTextColor),
                            )
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(2, 112, 204, 1)),
                            onPressed: () {},
                            child: Text(
                              "Upgrade",
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),



          Expanded(

              child: StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {

                  getSharedPerefernces() async{
                    final SharedPreferences prefs = await SharedPreferences.getInstance();

                    String  val = prefs.getString("doctorSpecialization") ?? "";
                    return val;
                  }


                  return StreamBuilder<List<Body>>(
                    stream: DoctorController().doctorDataResult(pageNumber ,  getSharedPerefernces() ,widget.cityName! , widget.filter),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:

                        case ConnectionState.waiting:

                         WidgetsBinding.instance.addPostFrameCallback((_) async {
                                showDialog(context: context, builder: (context)=>const SplashScreen());
                            });
                           return const Text('')  ;
                        case ConnectionState.active:

                        case ConnectionState.done:

                          if (snapshot.hasData) {
                            Navigator.pop(context);
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _controller.addListener(() {
                                if (_controller.position.pixels >
                                    _controller.position.maxScrollExtent) {
                                  setState(() {
                                    pageNumber++;
                                  });
                                }
                              });
                            });
                            List<Body> data = snapshot.data;

                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                                controller: _controller,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return DoctorCardWidget(
                                      doctorData: data[index]);
                                });
                          } else {
                            return const Center(
                              child: Text("there is no data"),
                            );
                          }
                      }
                    },
                  );
                },
              ))
        ],
      ),
    );
  }
}
