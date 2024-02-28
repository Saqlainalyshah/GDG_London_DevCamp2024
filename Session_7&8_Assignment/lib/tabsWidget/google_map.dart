import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapServices extends StatefulWidget {
  const GoogleMapServices({super.key});

  @override
  State<GoogleMapServices> createState() => _GoogleMapServicesState();
}

class _GoogleMapServicesState extends State<GoogleMapServices> {
  Location locationController =  Location();
  static final LatLng initialCameraPosition =  LatLng( 24.3539,75.16683);
  LatLng? currentPosition;

  Future<void> getUserLocation() async{
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled= await locationController.serviceEnabled();

    if(serviceEnabled){
      serviceEnabled=await locationController.requestService();
    }else{
      return;
    }
    permissionGranted= await locationController.hasPermission();
    if(permissionGranted==PermissionStatus.denied){
      permissionGranted=await locationController.requestPermission();
      if(permissionGranted!=PermissionStatus.granted){
        return;
      }
    }
    locationController.onLocationChanged.listen((LocationData currentLocation) {
      if(currentLocation.latitude!=null && currentLocation.longitude!=null){
        setState(() {
        currentPosition= LatLng(currentLocation.latitude!, currentLocation.longitude!);
        debugPrint("$currentPosition");
        });
      }

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition:  CameraPosition(
        target: initialCameraPosition,
        zoom: 13.0,
      ),
      mapType: MapType.normal, // You can change this to other map types
      onMapCreated: (GoogleMapController controller) {
        // Do something when the map is created, if needed
      },
      markers: {
         Marker(
          markerId: const MarkerId("1"),
          position: initialCameraPosition,
          infoWindow: const InfoWindow(
            title: "Marker Title",
            snippet: "Marker Snippet",
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      },
    );
  }
}
