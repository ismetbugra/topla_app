import 'package:flutter/material.dart';
import '../models/opponent_post.dart';
import 'create_opponent_post_screen.dart';

class FindOpponentScreen extends StatefulWidget {
  const FindOpponentScreen({super.key});

  @override
  State<FindOpponentScreen> createState() => _FindOpponentScreenState();
}

class _FindOpponentScreenState extends State<FindOpponentScreen> {
  String selectedCity = 'Tümü';
  int selectedPlayerCount = 0;
  double maxPrice = 1000;
  final List<String> cities = ['Tümü', 'İstanbul', 'Ankara', 'İzmir', 'Bursa'];
  final List<int> playerCounts = [0, 5, 7, 11];

  // Örnek ilanlar
  final List<Map<String, dynamic>> _samplePosts = [
    {
      'title': 'Kadıköy Halısaha Maçı',
      'city': 'İstanbul',
      'playerCount': 7,
      'price': 450,
      'date': '2024-03-20',
      'time': '20:00',
      'fieldName': 'Kadıköy Spor Kompleksi',
      'userName': 'Ege Kılıçaslan Şalk',
      'photoUrl': 'https://randomuser.me/api/portraits/men/9.jpg',
      'description':
          'Orta seviye bir maç arıyoruz. Takımımız düzenli olarak haftada 2 gün antrenman yapıyor. Profesyonel bir maç olacak.',
    },
    {
      'title': 'Çankaya Halısaha Maçı',
      'city': 'Ankara',
      'playerCount': 5,
      'price': 350,
      'date': '2024-03-21',
      'time': '19:00',
      'fieldName': 'Çankaya Spor Merkezi',
      'userName': 'Nedim Arda Şalk',
      'photoUrl': 'https://randomuser.me/api/portraits/men/8.jpg',
      'description':
          'Amatör seviye bir maç arıyoruz. Arkadaşlarımızla eğlenceli bir maç yapmak istiyoruz.',
    },
    {
      'title': 'Karşıyaka Halısaha Maçı',
      'city': 'İzmir',
      'playerCount': 11,
      'price': 800,
      'date': '2024-03-22',
      'time': '21:00',
      'fieldName': 'Karşıyaka Spor Salonu',
      'userName': 'Ahmet Yılmaz',
      'photoUrl': 'https://randomuser.me/api/portraits/men/1.jpg',
      'description':
          'Profesyonel bir maç arıyoruz. Takımımız bölgesel ligde mücadele ediyor. Ciddi bir maç olacak.',
    },
    {
      'title': 'Nilüfer Halısaha Maçı',
      'city': 'Bursa',
      'playerCount': 7,
      'price': 400,
      'date': '2024-03-23',
      'time': '20:30',
      'fieldName': 'Nilüfer Spor Kompleksi',
      'userName': 'Mehmet Demir',
      'photoUrl': 'https://randomuser.me/api/portraits/men/2.jpg',
      'description':
          'Orta-üst seviye bir maç arıyoruz. Takımımız düzenli olarak antrenman yapıyor.',
    },
    {
      'title': 'Beşiktaş Halısaha Maçı',
      'city': 'İstanbul',
      'playerCount': 5,
      'price': 500,
      'date': '2024-03-24',
      'time': '19:30',
      'fieldName': 'Beşiktaş Spor Merkezi',
      'userName': 'Ali Kaya',
      'photoUrl': 'https://randomuser.me/api/portraits/men/3.jpg',
      'description':
          'Amatör-orta seviye bir maç arıyoruz. Arkadaşlarımızla düzenli olarak maç yapıyoruz.',
    },
    {
      'title': 'Çankaya Halısaha Maçı',
      'city': 'Ankara',
      'playerCount': 11,
      'price': 750,
      'date': '2024-03-25',
      'time': '20:00',
      'fieldName': 'Çankaya Spor Kompleksi',
      'userName': 'Can Özkan',
      'photoUrl': 'https://randomuser.me/api/portraits/men/4.jpg',
      'description':
          'Profesyonel bir maç arıyoruz. Takımımız amatör ligde mücadele ediyor.',
    },
    {
      'title': 'Bornova Halısaha Maçı',
      'city': 'İzmir',
      'playerCount': 7,
      'price': 400,
      'date': '2024-03-26',
      'time': '21:00',
      'fieldName': 'Bornova Spor Merkezi',
      'userName': 'Burak Şahin',
      'photoUrl': 'https://randomuser.me/api/portraits/men/5.jpg',
      'description':
          'Orta seviye bir maç arıyoruz. Takımımız haftada bir gün antrenman yapıyor.',
    },
    {
      'title': 'Osmangazi Halısaha Maçı',
      'city': 'Bursa',
      'playerCount': 5,
      'price': 350,
      'date': '2024-03-27',
      'time': '20:00',
      'fieldName': 'Osmangazi Spor Salonu',
      'userName': 'İsmet Buğra Topyurt',
      'photoUrl': 'https://randomuser.me/api/portraits/men/6.jpg',
      'description':
          'Amatör seviye bir maç arıyoruz. Arkadaşlarımızla eğlenceli bir maç yapmak istiyoruz.',
    },
  ];

  List<Map<String, dynamic>> get _filteredPosts {
    var filtered = _samplePosts;

    if (selectedCity != 'Tümü') {
      filtered =
          filtered.where((post) => post['city'] == selectedCity).toList();
    }

    if (selectedPlayerCount != 0) {
      filtered = filtered
          .where((post) => post['playerCount'] == selectedPlayerCount)
          .toList();
    }

    filtered = filtered.where((post) => post['price'] <= maxPrice).toList();

    return filtered;
  }

  void _showFilterDialog(BuildContext context, String type) {
    List<dynamic> items = type == 'city' ? cities : playerCounts;
    dynamic selected = type == 'city' ? selectedCity : selectedPlayerCount;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(type == 'city' ? 'Şehir Seç' : 'Kişi Sayısı Seç'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(type == 'city'
                    ? items[index]
                    : items[index] == 0
                        ? 'Tümü'
                        : '${items[index]} vs ${items[index]}'),
                selected: items[index] == selected,
                selectedTileColor: Colors.green.withOpacity(0.1),
                onTap: () {
                  setState(() {
                    if (type == 'city') {
                      selectedCity = items[index];
                    } else {
                      selectedPlayerCount = items[index];
                    }
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rakip Bul',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateOpponentPostScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
                elevation: 2,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              icon: const Icon(Icons.add_circle_outline),
              label: const Text(
                'İlan Oluştur',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => _showFilterDialog(context, 'city'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedCity,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () =>
                              _showFilterDialog(context, 'playerCount'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedPlayerCount == 0
                                      ? 'Kişi Sayısı'
                                      : '$selectedPlayerCount vs $selectedPlayerCount',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maksimum Fiyat: ${maxPrice.toStringAsFixed(0)} TL',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Slider(
                          value: maxPrice,
                          min: 0,
                          max: 1000,
                          divisions: 20,
                          activeColor: Colors.green,
                          label: maxPrice.toStringAsFixed(0),
                          onChanged: (double value) {
                            setState(() {
                              maxPrice = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // İlan Listesi
            Expanded(
              child: _filteredPosts.isEmpty
                  ? const Center(
                      child: Text(
                        'Filtrelere uygun ilan bulunamadı',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 60),
                      itemCount: _filteredPosts.length,
                      itemBuilder: (context, index) {
                        final post = _filteredPosts[index];
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundImage:
                                          NetworkImage(post['photoUrl']),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            post['userName'],
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            post['fieldName'],
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                const Divider(),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildInfoColumn('Kişi Sayısı',
                                        '${post['playerCount']} vs ${post['playerCount']}'),
                                    _buildInfoColumn(
                                        'Fiyat', '${post['price']} TL'),
                                    _buildInfoColumn('Tarih', post['date']),
                                    _buildInfoColumn('Saat', post['time']),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                // Açıklama
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    post['description'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // TODO: İletişim sayfasına yönlendir
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'İletişime Geç',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
