import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/screen_body/edit_profile.dart';
import '../widgets/Text_Widget.dart';
import '../widgets/list_file.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class SliderFunction extends StatefulWidget {
  const SliderFunction({Key? key}) : super(key: key);

  @override
  State<SliderFunction> createState() => _SliderFunctionState();
}
int activeindex=0;
class _SliderFunctionState extends State<SliderFunction> {
  @override
  Widget build(BuildContext context) {

    double Height=MediaQuery.of(context).size.height;
    double Width=MediaQuery.of(context).size.width;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions( height: Height*(0.3-0.05),
            enlargeCenterPage: true,
            //enableInfiniteScroll: false,
            enlargeStrategy:  CenterPageEnlargeStrategy.scale,
            autoPlay: true,
            onPageChanged: (index , reason)=>{
            setState( () =>activeindex=index ),
               }
            ),
          items: SliderList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: Width*(0.9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(item.image.toString())
                        )
                    ),
                    padding: const EdgeInsets.only(left: 10,top: 20,),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 170,
                          height: 50,
                          child: TextWidget(text: item.subTitle.toString(),color: Colors.black,
                            fontSize: 16,fontWeight: FontWeight.bold,),
                        )
                      ],
                    )
                );
              },
            );
          }).toList(),
        ),
        buildSizedBox(),
        AnimatedSmoothIndicator(
          activeIndex: activeindex,
          count: SliderList.length,
        effect: const ScrollingDotsEffect(
          activeDotScale: 1.1,
          dotHeight: 8.0,
          dotWidth: 8.0,
          dotColor:Color(0xFFD4EAEA),
          activeDotColor: Colors.amber
        ),)

      ],
    );
  }
}
