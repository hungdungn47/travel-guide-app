import 'package:flutter/material.dart';
import 'package:travel_guide_app/presentation/components/search_bar.dart';
import 'package:travel_guide_app/presentation/components/slider.dart';
import 'package:travel_guide_app/presentation/screens/Search/search_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 252, 250),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTopBar(context),
              buildUI(context),
            ],
          ),
        ));
  }

  Widget buildTopBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: Row(
        children: [
          const Text(
            'Travel\n App',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: '',
                letterSpacing: 1.1),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 20,
                    color: Color(0xFF1BB7C0),
                  ),
                  SizedBox(width: 8, height: 0),
                  Text(
                    'Ninh Bình',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8, height: 0),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 24,
                    color: Color(0xFF1BB7C0),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUI(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              child: CustomSearchBar(),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          buildHomeSlider(context),
          const SizedBox(
            height: 4,
          ),
          buildScrollImage(context),
        ],
      ),
    );
  }

  Widget buildHomeSlider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(context, 'Festival'),
          const SizedBox(
            height: 8,
          ),
          CarouselSliderWidget(),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context, String text) {
    return Container(
      child: Text(
        text,
        style: const TextStyle(
            color: Color(0xFF000000),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildScrollImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        buildTitle(context, "Recommendation"),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildScrollImageItem(
                  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                  'Tràng An, Ninh Bình'),
              buildScrollImageItem(
                  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                  'Tràng An, Ninh Bình'),
            ],
          ),
        )
      ]),
    );
  }

  Widget buildScrollImageItem(String imgUrl, String description) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
              width: 320,
              height: 200,
              // width: double.infinity,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
