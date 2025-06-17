import 'package:flutter/material.dart';
import 'features/main/presentation/games/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// class _MyHomePageState extends State<MyHomePage> {
//   late GameCubit _gameCubit;
//
//   @override
//   Widget build(BuildContext context) {
//     final dio = AppNetworkClient();
//     final apiService = GameService(dio);
//     final repository = GamesRepositoryImpl(apiService);
//     final useCase = GameUseCase(repository);
//     _gameCubit = GameCubit(useCase);
//     _gameCubit.loadGames();
//     return BlocProvider<GameCubit>(
//       create: (_) => _gameCubit,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text(widget.title),
//         ),
//         body: BlocBuilder<GameCubit, GameState>(
//           builder: (context, state) {
//             if (state.isLoading) {
//               return const CircularProgressIndicator();
//             }
//             return ListView.builder(
//               itemCount: state.games.length,
//               itemBuilder: (context, index) {
//                 final game = state.games[index];
//                 return ListTile(
//                   title: Text(game.title ?? 'No Title'),
//                   subtitle: Text(game.genre ?? ''),
//                 );
//               },
//             );
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             _gameCubit.loadGames();
//           },
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ), // This trailing comma makes auto-formatting nicer for build methods.
//       ),
//     );
//   }
// }
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "NFT",
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _splashImage(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 55),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Find, Collect and Sell Amazing NFTs",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Explore the best collection’s of NFTs and buy and sell your NFTs as well",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          wordSpacing: 2, // khoang cach chu
                          letterSpacing: 2, // khoang cach ky tu
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/facebook.png'),
                    SizedBox(width: 12),
                    Image.asset('assets/images/google.png'),
                  ],
                ),
                _customButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_customButton(BuildContext context) {
  // InWell
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) {
            return ScreenHomePage();
          },
        ),
      );
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Get Started",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          SizedBox(width: 50), // thay Spacer bằng SizedBox
          Image.asset('assets/images/next.png'),
        ],
      ),
    ),
  );
}

_splashImage() {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: Image.asset('assets/images/splash.png'),
  );
}
