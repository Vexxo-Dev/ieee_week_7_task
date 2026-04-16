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
      title: 'Week 7 Task',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF1F1F1),
        fontFamily: 'sans-serif',
      ),
      home: const ProductDetailsScreen(),
    );
  }
}

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final TextEditingController _quantityController = TextEditingController(text: '1');
  int _quantity = 1;
  bool _isFavorite = false;

  void _changeQuantity(int value) {
    final next = (_quantity + value).clamp(1, 99);
    setState(() {
      _quantity = next;
      _quantityController.text = '$_quantity';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
          child: CircleAvatar(
            radius: 17,
            backgroundColor: Colors.transparent,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                side: const BorderSide(color: Colors.black, width: 2),
                shape: const CircleBorder(),
              ),
              onPressed: () {},
              child: const Icon(Icons.arrow_back_rounded, color: Colors.black, size: 18, weight: 700),
            ),
          ),
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 39,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: const Color(0xFFD32F2F),
              size: 36,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Center(
              child: Image.network(
                'https://i.ibb.co/ds757PfP/image.png',
                height: 360,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 18),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Chair',
                style: TextStyle(
                  color: Color(0xFF5E5E5E),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Text(
                '\$212',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF202124),
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Minimalist Style with\npillow',
              style: TextStyle(
                fontSize: 48,
                height: 1.1,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1D2127),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Loren ipsun dolor sit anet, consectetur adipisci elit, sed eiusnod tempor incidunt ut labore et dolore nagna aliqua. Ut enim ad ninin venian, quis nostrun exercitationen ullan corporis suscipit laboriosan, nisi ut aliquid ex ea connodi consequatur.',
              style: TextStyle(
                fontSize: 12,
                height: 1.5,
                color: Color(0xFF2D2F34),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const _ColorDot(color: Color(0xFF1F5F97)),
                const SizedBox(width: 10),
                const _ColorDot(color: Color(0xFFD52D2E)),
                const SizedBox(width: 10),
                const _ColorDot(color: Color(0xFF1FB447)),
                const SizedBox(width: 10),
                const _ColorDot(color: Color(0xFFF6A800)),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFF202124)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () => _changeQuantity(-1),
                            icon: const Icon(Icons.remove, size: 30),
                          ),
                        ),
                        SizedBox(
                          width: 58,
                          child: TextField(
                            controller: _quantityController,
                            readOnly: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isCollapsed: true,
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () => _changeQuantity(1),
                            icon: const Icon(Icons.add, size: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: const Color(0xFFD13D3D),
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  final Color color;

  const _ColorDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
