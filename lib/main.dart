import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frases Motivacionais',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const FrasesPage(),
    );
  }
}

class FrasesPage extends StatefulWidget {
  const FrasesPage({super.key});

  @override
  State<FrasesPage> createState() => _FrasesPageState();
}

class _FrasesPageState extends State<FrasesPage> {
  static const Color _roxo = Color(0xFF6C4AB6);
  static const Color _roxoClaro = Color(0xFFF5F0FF);
  static const Color _roxoMedio = Color(0xFFE5D8FF);
  static const Color _cinza = Color(0xFF777777);

  final Random _random = Random();

  final List<String> _frases = [
    'Acredite em você e siga em frente.',
    'Cada dia é uma nova oportunidade.',
    'Não desista dos seus objetivos.',
    'Grandes resultados começam com pequenos passos.',
    'Você é capaz de ir muito além.',
    'O sucesso começa quando você decide tentar.',
    'Faça hoje algo que seu futuro agradecerá.',
    'Continue mesmo quando estiver difícil.',
    'A persistência transforma sonhos em conquistas.',
    'Confie no processo.',
    'Seu esforço de hoje será sua conquista de amanhã.',
    'Nunca é tarde para começar.',
  ];

  String? _fraseAtual;

  final List<String> _ultimasFrases = [];

  void _novaFrase() {
    String frase;

    do {
      frase = _frases[_random.nextInt(_frases.length)];
    } while (
        frase == _fraseAtual &&
        _frases.length > 1
    );

    setState(() {
      _fraseAtual = frase;

      _ultimasFrases.insert(0, frase);

      if (_ultimasFrases.length > 4) {
        _ultimasFrases.removeLast();
      }
    });

    _mostrarResultado(frase);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _roxoClaro,

      appBar: AppBar(
        backgroundColor: _roxo,
        foregroundColor: Colors.white,

        title: const Text(
          '💬 Frases Motivacionais',
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(
                    alpha: 0.25,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${_frases.length} frases',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            // Banner igual à estrutura do Sorteador
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: _roxoMedio,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '💡',
                    style: TextStyle(
                      fontSize: 58,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Uma frase pode mudar seu dia',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _roxo,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Sua frase:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _cinza,
              ),
            ),

            const SizedBox(height: 10),

            // Card da frase
            Container(
              constraints: const BoxConstraints(
                minHeight: 130,
              ),

              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(14),

                border: Border.all(
                  color: const Color(0xFFDDDDDD),
                ),
              ),

              child: Center(
                child: Text(
                  _fraseAtual ??
                      'Clique no botão abaixo para receber uma frase motivacional.',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize:
                        _fraseAtual == null ? 16 : 21,

                    fontWeight:
                        _fraseAtual == null
                            ? FontWeight.normal
                            : FontWeight.bold,

                    color:
                        _fraseAtual == null
                            ? _cinza
                            : _roxo,

                    height: 1.4,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Mesmo estilo do botão Sortear
            ElevatedButton.icon(
              onPressed: _novaFrase,

              icon: const Icon(
                Icons.shuffle,
                size: 22,
              ),

              label: const Text(
                'NOVA FRASE',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              style: ElevatedButton.styleFrom(
                backgroundColor: _roxo,
                foregroundColor: Colors.white,

                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),

                elevation: 4,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 26),

            if (_ultimasFrases.isNotEmpty) ...[
              const Text(
                'Últimas frases',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _cinza,
                ),
              ),

              const SizedBox(height: 12),

              ListView.builder(
                shrinkWrap: true,

                physics:
                    const NeverScrollableScrollPhysics(),

                itemCount: _ultimasFrases.length,

                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.only(bottom: 8),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                          BorderRadius.circular(12),

                      border: Border.all(
                        color:
                            const Color(0xFFEEEEEE),
                      ),
                    ),

                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _roxoMedio,

                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: _roxo,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      title: Text(
                        _ultimasFrases[index],

                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _mostrarResultado(String frase) {
    showDialog(
      context: context,

      barrierDismissible: true,

      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),

          backgroundColor: Colors.white,

          content: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              const SizedBox(height: 8),

              Container(
                width: 80,
                height: 80,

                decoration: const BoxDecoration(
                  color: _roxoMedio,
                  shape: BoxShape.circle,
                ),

                child: const Center(
                  child: Text(
                    '✨',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Sua frase motivacional',
                style: TextStyle(
                  fontSize: 14,
                  color: _cinza,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Text(
                frase,

                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: _roxo,
                ),

                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                Future.delayed(
                  const Duration(
                    milliseconds: 200,
                  ),
                  _novaFrase,
                );
              },

              child: const Text(
                'Outra frase',

                style: TextStyle(
                  color: _cinza,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: _roxo,
                foregroundColor: Colors.white,

                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),

              child: const Text(
                'Gostei!',
              ),
            ),
          ],
        );
      },
    );
  }
}