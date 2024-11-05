import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel_controller.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel_state.dart';
import 'package:travel_guide_app/utils/widgets/gradient_text.dart';

import '../../../gen/assets.gen.dart';
import 'hotel.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  late final HotelController _controller;

  HotelController _createController() {
    _controller = HotelController();
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(),
      child: BlocBuilder<HotelController, HotelState>(
        builder: (context, state) {
          return Scaffold(
            body: _buildUI(context, state),
            //bottomNavigationBar: _buildBottomUI(context, state),
          );
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context, HotelState state) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.backgrounds.cityBackground.path),
          opacity: 0.5,
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(context, state),
            _buildRecommendationText(context, state),
            _buildHotelEntriesList(context, state),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationText(BuildContext context, HotelState state) {
    if (state.isRecommending) {
      return GradientText(
        'Our Recommendations',
        style: const TextStyle(
          fontSize: 25,
          shadows: <Shadow>[
            Shadow(
                offset: Offset(0.0, 4.0),
                blurRadius: 15.0,
                color: Colors.lightBlueAccent),
          ],
        ),
        gradient: LinearGradient(colors: [
          Colors.blue.shade300,
          Colors.blue.shade900,
        ]),
      );
    } else {
      return Container();
    }
  }

  Widget _buildHotelEntriesList(BuildContext context, HotelState state) {
    return Expanded(
      child: AnimatedList(
        key: _controller.listKey,
        initialItemCount: state.hotels.length + 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index, animation) {
          if (index == state.hotels.length) {
            if (!state.isDone) {
              return _buildProcessIndicator(context, state);
            } else {
              return Container();
            }
          } else {
            return _buildHotelEntry(context, state.hotels[index], animation);
          }
        },
        controller: _controller.getScrollController(),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, HotelState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: SearchAnchor(
          isFullScreen: false,
          headerTextStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
          viewElevation: 5.0,
          viewConstraints: const BoxConstraints(
            minHeight: 100,
            maxHeight: 400
          ),
          builder: (context, controller) {
            return SearchBar(
              controller: controller,
              hintText: 'Find your next destination',
              hintStyle: WidgetStateProperty.all(
                const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              elevation: const WidgetStatePropertyAll(5.0),
              onSubmitted: (prompt) async {
                await _controller.updateHotelLists(prompt);
              },
              textStyle: WidgetStateProperty.all(
                const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(Icons.search),
              ),
              trailing: <Widget>[
                IconButton(
                  icon: const Icon(Icons.filter_alt_outlined),
                  onPressed: () {},
                ),
              ],
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) async {
            List<String> suggestions =
                await _controller.getSuggestion(controller.text);
            return List<ListTile>.generate(suggestions.length, (int index) {
              return ListTile(
                title: Text(
                  suggestions[index],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                onTap: () async {
                  controller.closeView(suggestions[index]);
                  await _controller.updateHotelLists(suggestions[index]);
                },
              );
            });
          }),
    );
  }

  Widget _buildHotelEntry(
      BuildContext context, Hotel entry, Animation<double> animation) {
    return ScaleTransition(
      key: UniqueKey(),
      scale: CurvedAnimation(parent: animation, curve: Curves.bounceOut),
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          height: 150,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 5.0,
                    offset: Offset(0, 6))
              ]),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 17.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.name,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          const Icon(Icons.star),
                          Text(
                            '${entry.rating}/5',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.place),
                          Text(
                            entry.location,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ]),
              ),
              Container(
                  width: 140,
                  height: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        entry.imageUrl,
                      ),
                    ),
                  )),
            ],
          )),
    );
  }

  Widget _buildProcessIndicator(BuildContext context, HotelState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: state.loading ? 1.0 : 00,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
