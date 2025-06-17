import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_list/features/main/presentation/games/pages/home/top_appbar.dart';

import '../../../../../../core/network/network_provider/network_provider.dart';
import '../../../../data/datasources/game_services.dart';
import '../../../../data/repositories/games_repository_impl.dart';
import '../../../../domain/usecase/game_usecase.dart';
import '../../bloc/games/game_cubit.dart';
import 'bottom_appbar.dart';
import 'list_nft.dart';

class ScreenHomePage extends StatefulWidget {
  const ScreenHomePage({super.key});

  @override
  State<ScreenHomePage> createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage>
    with SingleTickerProviderStateMixin {
  late GameCubit _gameCubit;
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
    final useCase = GameUseCase(repository);
    _gameCubit = GameCubit(useCase);
    _gameCubit.loadGames();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(selectedIndex, tabs, _onAppBarTap),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Collection’s",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: BlocProvider<GameCubit>(
                      create: (_) => _gameCubit,
                      child: Container(
                        color: Colors.black,
                        child: BlocBuilder<GameCubit, GameState>(
                          builder: (context, state) {
                            if (state.isLoading) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return listNFT(state.games);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}
