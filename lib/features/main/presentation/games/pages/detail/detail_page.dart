import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_list/features/main/domain/usecase/game_usecase.dart';
import 'package:flutter_game_list/features/main/presentation/games/bloc/game_detail/game_detail_cubit.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../../core/network/network_provider/network_provider.dart';
import '../../../../data/datasources/game_services.dart';
import '../../../../data/repositories/games_repository_impl.dart';
import '../../../../domain/entities/game_detail.dart';
import '../home/top_appbar.dart';
import 'bottom_appbar_detail.dart';

class ScreenDetailPage extends StatefulWidget {
  final int id;

  const ScreenDetailPage({super.key, required this.id});

  @override
  State<ScreenDetailPage> createState() => _ScreenDetailPageState();
}

class _ScreenDetailPageState extends State<ScreenDetailPage>
    with SingleTickerProviderStateMixin {
  late GameDetailCubit _gameDetailCubit;
  late TabController _tabController;
  final List<String> tabs = ['Recent', 'Treading', 'Popular', 'Top', 'Tab 5'];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onAppBarTap(int index) {
    if (index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });
    }
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    final dio = AppNetworkClient();
    final apiService = GameService(dio);
    final repository = GamesRepositoryImpl(apiService);
    final useCase = GameDetailUseCase(repository);
    _gameDetailCubit = GameDetailCubit(useCase);
    _gameDetailCubit.loadGame(widget.id);
    return Scaffold(
      appBar: appBar(selectedIndex, tabs, _onAppBarTap),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: BlocProvider<GameDetailCubit>(
                  create: (_) => _gameDetailCubit,
                  child: Container(
                    color: Colors.black,
                    child: BlocBuilder<GameDetailCubit, GameDetailState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _titleGame(state.game),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(vertical: 12),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: FadeInImage.assetNetwork(
                                      placeholder:
                                          'assets/images/placeholder.png',
                                      image: state.game.thumbnail,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Image.asset('assets/images/user.png'),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "User3243",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "By ${state.game.developer}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Current Price",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          "₹ 139.00",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Remaining time",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Text(
                                            state.game.releaseDate,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Visitors",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Text(
                                            "20.2k",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: double.infinity,
                                  child: Text(
                                    "Detail’s: ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Html(
                                  data: state.game.description,
                                  style: {"body": Style(color: Colors.white)},
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              bottomAppbarDetail(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _titleGame(GameDetail gameDetail) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "${gameDetail.title}\n",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            TextSpan(
              text: "By ${gameDetail.publisher}",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        alignment: Alignment.topRight,
        child: Icon(Icons.favorite_border, color: Colors.white, size: 20),
      ),
    ],
  );
}
