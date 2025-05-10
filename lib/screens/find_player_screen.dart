import 'package:flutter/material.dart';

class Player {
  final String name;
  final int age;
  final String position;
  final String photoUrl;
  final double height;
  final double weight;
  final String city;

  Player({
    required this.name,
    required this.age,
    required this.position,
    required this.photoUrl,
    required this.height,
    required this.weight,
    required this.city,
  });
}

class FindPlayerScreen extends StatefulWidget {
  const FindPlayerScreen({super.key});

  @override
  State<FindPlayerScreen> createState() => _FindPlayerScreenState();
}

class _FindPlayerScreenState extends State<FindPlayerScreen> {
  final List<Player> _players = [
    Player(
      name: "Ege Kılıçaslan Şalk",
      age: 24,
      position: "Forvet",
      photoUrl: "https://randomuser.me/api/portraits/men/9.jpg",
      height: 1.82,
      weight: 77,
      city: "İstanbul",
    ),
    Player(
      name: "Nedim Arda Şalk",
      age: 26,
      position: "Orta Saha",
      photoUrl: "https://randomuser.me/api/portraits/men/8.jpg",
      height: 1.84,
      weight: 79,
      city: "İstanbul",
    ),
    Player(
      name: "Ahmet Yılmaz",
      age: 25,
      position: "Forvet",
      photoUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      height: 1.78,
      weight: 75,
      city: "İstanbul",
    ),
    Player(
      name: "Mehmet Demir",
      age: 28,
      position: "Orta Saha",
      photoUrl: "https://randomuser.me/api/portraits/men/2.jpg",
      height: 1.82,
      weight: 78,
      city: "Ankara",
    ),
    Player(
      name: "Ali Kaya",
      age: 23,
      position: "Defans",
      photoUrl: "https://randomuser.me/api/portraits/men/3.jpg",
      height: 1.85,
      weight: 80,
      city: "İzmir",
    ),
    Player(
      name: "Can Özkan",
      age: 30,
      position: "Kaleci",
      photoUrl: "https://randomuser.me/api/portraits/men/4.jpg",
      height: 1.90,
      weight: 85,
      city: "Bursa",
    ),
    Player(
      name: "Burak Şahin",
      age: 26,
      position: "Forvet",
      photoUrl: "https://randomuser.me/api/portraits/men/5.jpg",
      height: 1.80,
      weight: 77,
      city: "Antalya",
    ),
    Player(
      name: "İsmet Buğra Topyurt",
      age: 24,
      position: "Orta Saha",
      photoUrl: "https://randomuser.me/api/portraits/men/6.jpg",
      height: 1.83,
      weight: 76,
      city: "İstanbul",
    ),
    Player(
      name: "Mehmet Emin Tok",
      age: 27,
      position: "Defans",
      photoUrl: "https://randomuser.me/api/portraits/men/12.jpg",
      height: 1.87,
      weight: 82,
      city: "Ankara",
    ),
  ];

  String _selectedPosition = "Tümü";
  String _selectedCity = "Tümü";
  String _sortBy = "Yaş";
  List<String> _positions = ["Tümü", "Forvet", "Orta Saha", "Defans", "Kaleci"];
  List<String> _cities = [
    "Tümü",
    "İstanbul",
    "Ankara",
    "İzmir",
    "Bursa",
    "Antalya"
  ];
  List<String> _sortOptions = ["Yaş", "Boy", "Kilo"];

  List<Player> get _filteredPlayers {
    var filtered = _players;

    if (_selectedPosition != "Tümü") {
      filtered = filtered
          .where((player) => player.position == _selectedPosition)
          .toList();
    }

    if (_selectedCity != "Tümü") {
      filtered =
          filtered.where((player) => player.city == _selectedCity).toList();
    }

    switch (_sortBy) {
      case "Yaş":
        filtered.sort((a, b) => a.age.compareTo(b.age));
        break;
      case "Boy":
        filtered.sort((a, b) => a.height.compareTo(b.height));
        break;
      case "Kilo":
        filtered.sort((a, b) => a.weight.compareTo(b.weight));
        break;
    }

    return filtered;
  }

  void _showFilterDialog(BuildContext context, String type) {
    List<String> items = type == 'position' ? _positions : _cities;
    String selected = type == 'position' ? _selectedPosition : _selectedCity;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(type == 'position' ? 'Pozisyon Seç' : 'Şehir Seç'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
                selected: items[index] == selected,
                selectedTileColor: Colors.green.withOpacity(0.1),
                onTap: () {
                  setState(() {
                    if (type == 'position') {
                      _selectedPosition = items[index];
                    } else {
                      _selectedCity = items[index];
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

  void _showSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sıralama Seç'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _sortOptions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_sortOptions[index]),
                selected: _sortOptions[index] == _sortBy,
                selectedTileColor: Colors.green.withOpacity(0.1),
                onTap: () {
                  setState(() {
                    _sortBy = _sortOptions[index];
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
          'Oyuncu Bul',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterButton(
                  context,
                  Icons.sports_soccer,
                  'Pozisyon',
                  _selectedPosition,
                  () => _showFilterDialog(context, 'position'),
                ),
                _buildFilterButton(
                  context,
                  Icons.location_on,
                  'Şehir',
                  _selectedCity,
                  () => _showFilterDialog(context, 'city'),
                ),
                _buildFilterButton(
                  context,
                  Icons.sort,
                  'Sırala',
                  _sortBy,
                  () => _showSortDialog(context),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
              itemCount: _filteredPlayers.length,
              itemBuilder: (context, index) {
                final player = _filteredPlayers[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(player.photoUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                player.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      size: 14, color: Colors.grey[600]),
                                  const SizedBox(width: 4),
                                  Text(
                                    player.city,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(Icons.sports_soccer,
                                      size: 14, color: Colors.grey[600]),
                                  const SizedBox(width: 4),
                                  Text(
                                    player.position,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(Icons.person,
                                      size: 14, color: Colors.grey[600]),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${player.age} yaş, ${player.height}m, ${player.weight}kg',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('İletişime Geç'),
                                content: const Text(
                                    'Oyuncu ile iletişime geçmek için mesaj gönderebilirsiniz.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('İptal'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('Mesaj Gönder'),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'İletişime\nGeç',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
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
    );
  }

  Widget _buildFilterButton(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 100,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.green, size: 20),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 1),
            Text(
              value,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
