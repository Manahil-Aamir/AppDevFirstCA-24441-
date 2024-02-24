import 'package:flutter/material.dart';
import 'model/product.dart';
import 'package:math_expressions/math_expressions.dart';
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
      theme: ThemeData.dark().copyWith(primaryColor: Colors.purple,),
      home: const LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});


  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/flutterlogo.png', height: 50.0, width:50.0),
                const SizedBox(height: 16.0),
                const Text('SHRINE'),
              ],
            ),
            const SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
                       
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),

            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
               TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: () {
                    Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyWidget()),
                      );

                  }
                  
                  ),
              ]
            )
          ],
        )
        )
      
    );
  }
}  

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  

List<Card> _buildGridCards(BuildContext context){

  List<Product> products = mockProducts;
print(products);
if (products.isEmpty) {
  return <Card>[
    Card(
      child: ListTile(
        title: Text('No Data Found'),
      ),
    ),
  ];
}
    final ThemeData theme = Theme.of(context);

return products.map((product){
    return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0/11.0,
                child: Image.asset(product.ImageUrl),
              ),
             Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                 Text(
                    product.name,
                    style: theme.textTheme.titleLarge,

                    maxLines: 1,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    product.price,
                    style: theme.textTheme.titleSmall,
                  ),
                  ],
                ),
              ),
             ),
              ],
          ),
    );
}).toList();
}
  @override
  Widget build(BuildContext context) {
       return Scaffold(
       appBar: AppBar(
          title: const Text('SHRINE'), 
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: (){
              print('Menu Button');
            },
          ),

          actions: <Widget>[
            IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: (){
             print('Search Button');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: (){
              print('Filter Button');
            },
          ),
          ]
        ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0/9.0,
        children: _buildGridCards(context),
          ),
        
      resizeToAvoidBottomInset: false,
    );
  }
}

      
