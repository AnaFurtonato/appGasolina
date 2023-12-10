import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,        
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

 class _MyHomePageState extends State<MyHomePage> {

  final _inputAlcool = TextEditingController();
  final _inputGasolina = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double _resultado = 0;
  String _label = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,  
       
      body: Center(
        child: SingleChildScrollView(          
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,            
              children: <Widget> [ 
                Form(
                  key: _formKey,
                  child: Column(
                  children: [
                    Image.asset('assets/imagens/posto.png',
                    width:  100,
                    height: 110,
                    ),
                    const Text(
                      'Álcool ou Gasolina',
                      style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(    
                      controller: _inputAlcool,                 
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Valor do Alcool',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        labelStyle: TextStyle(color: Colors.white),
                      
      
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty || double.parse(value) <= 0){
                            return 'Informe o valor do Álcool';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(   
                      controller: _inputGasolina,                      
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),                      
                      obscureText: false,
                      decoration: const InputDecoration(
                        labelText: 'Valor da Gasolina',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        labelStyle: TextStyle(color: Colors.white)
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty || double.parse(value) <= 0){
                            return 'Informe o valor da Gasolina';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton( onPressed: (){if(_formKey.currentState?.validate() ?? false){
                          _resultado = double.parse(_inputAlcool.text) / (double.parse(_inputGasolina.text));
      
                          if(_resultado < 0.7){
                            _label = "O Álcool está mais barato";
                          } else if ( _resultado >= 0.7){
                            _label = "A Gasolina está mais barato";
                          }                  
      
                          setState(() {
                            
                          });
                      }}, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Icon(Icons.play_arrow, color: Colors.black,),
                        Text('Verificar', style: const TextStyle(color: Colors.black,)),
                    ])
                    ),          
                    GestureDetector(
                      onLongPress: (){
                        _inputAlcool.clear();
                        _inputGasolina.clear();
                        _label = '';
      
                        setState(() {
                          
                        });
                      },
                      child: Text(
                        _label,
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )
                  ],
                ))
              ],
            ),          
          ),
        ),
      ),
      
    );
  }
}
//double.parse(value) <= 0 = transforma o valor em numero e verifica se é menor que zero
//key: null = seria um id do formulario, para acionar ele 
//_formKey.currentState?.validate() ?? false = Se o status do formulario for valido, se tiver tudo escrito nos campos e não tiver faltando nada para dar as mensagens de validação
//_label = _resultado.toStringAsFixed(1); = coloca apenas um valor depois da virgula  
//Color _cor = Colors.black; = mudando acor de fundo de acordo com a cor que vai estar na variavel (Color é a "variavel" para declarar cor) 
//GestureDetector = adiciona um evento em algo que não tem evento 
//onLongPress: (){_cor = Colors.black; _inputAltura.clear(); _inputPeso.clear(); _label = ''; setState(() {});}, = evento que dispara ao clicar no botão
//SingleChildScrollView = Arruma o layout, tira aquela mensagem de layout estourando
//labelStyle = muda a cor do label de dentro do campo do TextFormField