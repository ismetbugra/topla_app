import 'package:flutter/material.dart';

class Halisaha {
  final String name;
  final String city;
  final String address;
  final String photoUrl;
  final double price;
  final List<String> availableHours;
  final String sahaTuru; // Kapalı veya Açık
  final String zeminTuru; // Suni çim, doğal çim veya sentetik
  final bool aydinlatma;
  final bool soyunmaOdasi;
  final bool kafeterya;
  final bool otopark;
  final bool ayakkabiKiralama;
  final bool wifi;
  final bool krediKarti;

  Halisaha({
    required this.name,
    required this.city,
    required this.address,
    required this.photoUrl,
    required this.price,
    required this.availableHours,
    required this.sahaTuru,
    required this.zeminTuru,
    required this.aydinlatma,
    required this.soyunmaOdasi,
    required this.kafeterya,
    required this.otopark,
    required this.ayakkabiKiralama,
    required this.wifi,
    required this.krediKarti,
  });
}

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final List<Halisaha> _halisahalar = [
    Halisaha(
      name: "Dabakoğlu Halısaha",
      city: "Çanakkale",
      address: "Merkez, Çanakkale",
      photoUrl:
          "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=800",
      price: 180,
      availableHours: [
        "09:00",
        "10:00",
        "11:00",
        "12:00",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "17:00",
        "18:00",
        "19:00",
        "20:00",
        "21:00",
        "22:00"
      ],
      sahaTuru: "Kapalı",
      zeminTuru: "Suni Çim",
      aydinlatma: true,
      soyunmaOdasi: true,
      kafeterya: true,
      otopark: true,
      ayakkabiKiralama: true,
      wifi: true,
      krediKarti: true,
    ),
    Halisaha(
      name: "Emniyet Halısaha",
      city: "Çanakkale",
      address: "Merkez, Çanakkale",
      photoUrl:
          "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=800",
      price: 160,
      availableHours: [
        "09:00",
        "10:00",
        "11:00",
        "12:00",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "17:00",
        "18:00",
        "19:00",
        "20:00",
        "21:00",
        "22:00"
      ],
      sahaTuru: "Açık",
      zeminTuru: "Suni Çim",
      aydinlatma: true,
      soyunmaOdasi: true,
      kafeterya: false,
      otopark: true,
      ayakkabiKiralama: false,
      wifi: false,
      krediKarti: true,
    ),
    Halisaha(
      name: "TR Cup Halısaha",
      city: "Çanakkale",
      address: "Merkez, Çanakkale",
      photoUrl:
          "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=800",
      price: 200,
      availableHours: [
        "09:00",
        "10:00",
        "11:00",
        "12:00",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "17:00",
        "18:00",
        "19:00",
        "20:00",
        "21:00",
        "22:00"
      ],
      sahaTuru: "Kapalı",
      zeminTuru: "Sentetik",
      aydinlatma: true,
      soyunmaOdasi: true,
      kafeterya: true,
      otopark: true,
      ayakkabiKiralama: true,
      wifi: true,
      krediKarti: true,
    ),
    Halisaha(
      name: "Dardanel Halısaha",
      city: "Çanakkale",
      address: "Merkez, Çanakkale",
      photoUrl:
          "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=800",
      price: 170,
      availableHours: [
        "09:00",
        "10:00",
        "11:00",
        "12:00",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "17:00",
        "18:00",
        "19:00",
        "20:00",
        "21:00",
        "22:00"
      ],
      sahaTuru: "Açık",
      zeminTuru: "Suni Çim",
      aydinlatma: true,
      soyunmaOdasi: true,
      kafeterya: true,
      otopark: true,
      ayakkabiKiralama: false,
      wifi: true,
      krediKarti: true,
    ),
    Halisaha(
      name: "Barbaros Halısaha",
      city: "Çanakkale",
      address: "Merkez, Çanakkale",
      photoUrl:
          "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=800",
      price: 150,
      availableHours: [
        "09:00",
        "10:00",
        "11:00",
        "12:00",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "17:00",
        "18:00",
        "19:00",
        "20:00",
        "21:00",
        "22:00"
      ],
      sahaTuru: "Açık",
      zeminTuru: "Suni Çim",
      aydinlatma: true,
      soyunmaOdasi: true,
      kafeterya: false,
      otopark: true,
      ayakkabiKiralama: false,
      wifi: false,
      krediKarti: true,
    ),
  ];

  String _selectedCity = "Tümü";
  String _selectedSahaTuru = "Tümü";
  String _selectedZeminTuru = "Tümü";
  bool _showOnlyAydinlatma = false;
  bool _showOnlySoyunmaOdasi = false;
  bool _showOnlyKafeterya = false;
  bool _showOnlyOtopark = false;
  bool _showOnlyAyakkabiKiralama = false;
  bool _showOnlyWifi = false;
  bool _showOnlyKrediKarti = false;

  List<String> _cities = [
    "Tümü",
    "İstanbul",
    "Ankara",
    "İzmir",
    "Bursa",
    "Çanakkale"
  ];
  List<String> _sahaTurleri = ["Tümü", "Kapalı", "Açık"];
  List<String> _zeminTurleri = ["Tümü", "Suni Çim", "Doğal Çim", "Sentetik"];

  List<Halisaha> get _filteredHalisahalar {
    var filtered = _halisahalar;

    if (_selectedCity != "Tümü") {
      filtered = filtered.where((h) => h.city == _selectedCity).toList();
    }

    if (_selectedSahaTuru != "Tümü") {
      filtered =
          filtered.where((h) => h.sahaTuru == _selectedSahaTuru).toList();
    }

    if (_selectedZeminTuru != "Tümü") {
      filtered =
          filtered.where((h) => h.zeminTuru == _selectedZeminTuru).toList();
    }

    if (_showOnlyAydinlatma) {
      filtered = filtered.where((h) => h.aydinlatma).toList();
    }

    if (_showOnlySoyunmaOdasi) {
      filtered = filtered.where((h) => h.soyunmaOdasi).toList();
    }

    if (_showOnlyKafeterya) {
      filtered = filtered.where((h) => h.kafeterya).toList();
    }

    if (_showOnlyOtopark) {
      filtered = filtered.where((h) => h.otopark).toList();
    }

    if (_showOnlyAyakkabiKiralama) {
      filtered = filtered.where((h) => h.ayakkabiKiralama).toList();
    }

    if (_showOnlyWifi) {
      filtered = filtered.where((h) => h.wifi).toList();
    }

    if (_showOnlyKrediKarti) {
      filtered = filtered.where((h) => h.krediKarti).toList();
    }

    return filtered;
  }

  void _showReservationDialog(BuildContext context, Halisaha halisaha) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 500,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.network(
                        halisaha.photoUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${halisaha.price} TL / Saat',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        halisaha.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              halisaha.address,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Tesis Özellikleri',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _buildFeatureChip('Saha Türü', halisaha.sahaTuru),
                          _buildFeatureChip('Zemin', halisaha.zeminTuru),
                          if (halisaha.aydinlatma)
                            _buildFeatureChip('Aydınlatma', 'Var'),
                          if (halisaha.soyunmaOdasi)
                            _buildFeatureChip('Soyunma Odası', 'Var'),
                          if (halisaha.kafeterya)
                            _buildFeatureChip('Kafeterya', 'Var'),
                          if (halisaha.otopark)
                            _buildFeatureChip('Otopark', 'Var'),
                          if (halisaha.ayakkabiKiralama)
                            _buildFeatureChip('Ayakkabı Kiralama', 'Var'),
                          if (halisaha.wifi) _buildFeatureChip('Wi-Fi', 'Var'),
                          if (halisaha.krediKarti)
                            _buildFeatureChip('Kredi Kartı', 'Kabul Ediliyor'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Müsait Saatler',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: halisaha.availableHours.map((hour) {
                          return ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('$hour için rezervasyon yapıldı'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(hour),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Kapat'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.green,
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rezervasyon',
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Sıralama'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text('Fiyat (Artan)'),
                                  leading: const Icon(Icons.arrow_upward),
                                  onTap: () {
                                    setState(() {
                                      _halisahalar.sort(
                                          (a, b) => a.price.compareTo(b.price));
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Fiyat (Azalan)'),
                                  leading: const Icon(Icons.arrow_downward),
                                  onTap: () {
                                    setState(() {
                                      _halisahalar.sort(
                                          (a, b) => b.price.compareTo(a.price));
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('İsim (A-Z)'),
                                  leading: const Icon(Icons.sort_by_alpha),
                                  onTap: () {
                                    setState(() {
                                      _halisahalar.sort(
                                          (a, b) => a.name.compareTo(b.name));
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.sort),
                      label: const Text('Sırala'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => StatefulBuilder(
                            builder: (context, setState) => AlertDialog(
                              title: const Text('Filtreleme'),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Şehir',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    _buildFilterDropdown(
                                      value: _selectedCity,
                                      items: _cities,
                                      label: 'Şehir',
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedCity = value!;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Saha Türü',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    _buildFilterDropdown(
                                      value: _selectedSahaTuru,
                                      items: _sahaTurleri,
                                      label: 'Saha Türü',
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedSahaTuru = value!;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Zemin Türü',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    _buildFilterDropdown(
                                      value: _selectedZeminTuru,
                                      items: _zeminTurleri,
                                      label: 'Zemin Türü',
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedZeminTuru = value!;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Özellikler',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        _buildFilterChip(
                                          label: 'Aydınlatma',
                                          selected: _showOnlyAydinlatma,
                                          onSelected: (value) {
                                            setState(() {
                                              _showOnlyAydinlatma = value!;
                                            });
                                          },
                                        ),
                                        _buildFilterChip(
                                          label: 'Soyunma Odası',
                                          selected: _showOnlySoyunmaOdasi,
                                          onSelected: (value) {
                                            setState(() {
                                              _showOnlySoyunmaOdasi = value!;
                                            });
                                          },
                                        ),
                                        _buildFilterChip(
                                          label: 'Kafeterya',
                                          selected: _showOnlyKafeterya,
                                          onSelected: (value) {
                                            setState(() {
                                              _showOnlyKafeterya = value!;
                                            });
                                          },
                                        ),
                                        _buildFilterChip(
                                          label: 'Otopark',
                                          selected: _showOnlyOtopark,
                                          onSelected: (value) {
                                            setState(() {
                                              _showOnlyOtopark = value!;
                                            });
                                          },
                                        ),
                                        _buildFilterChip(
                                          label: 'Ayakkabı Kiralama',
                                          selected: _showOnlyAyakkabiKiralama,
                                          onSelected: (value) {
                                            setState(() {
                                              _showOnlyAyakkabiKiralama =
                                                  value!;
                                            });
                                          },
                                        ),
                                        _buildFilterChip(
                                          label: 'Wi-Fi',
                                          selected: _showOnlyWifi,
                                          onSelected: (value) {
                                            setState(() {
                                              _showOnlyWifi = value!;
                                            });
                                          },
                                        ),
                                        _buildFilterChip(
                                          label: 'Kredi Kartı',
                                          selected: _showOnlyKrediKarti,
                                          onSelected: (value) {
                                            setState(() {
                                              _showOnlyKrediKarti = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedCity = 'Tümü';
                                      _selectedSahaTuru = 'Tümü';
                                      _selectedZeminTuru = 'Tümü';
                                      _showOnlyAydinlatma = false;
                                      _showOnlySoyunmaOdasi = false;
                                      _showOnlyKafeterya = false;
                                      _showOnlyOtopark = false;
                                      _showOnlyAyakkabiKiralama = false;
                                      _showOnlyWifi = false;
                                      _showOnlyKrediKarti = false;
                                    });
                                  },
                                  child: const Text('Sıfırla'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Kapat'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.filter_list),
                      label: const Text('Filtrele'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _filteredHalisahalar.length,
                itemBuilder: (context, index) {
                  final halisaha = _filteredHalisahalar[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () => _showReservationDialog(context, halisaha),
                      borderRadius: BorderRadius.circular(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
                            child: Image.network(
                              halisaha.photoUrl,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  halisaha.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        size: 16, color: Colors.grey[600]),
                                    const SizedBox(width: 4),
                                    Text(
                                      halisaha.address,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.attach_money,
                                        size: 16, color: Colors.grey[600]),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${halisaha.price} TL / Saat',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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

  Widget _buildFilterDropdown({
    required String value,
    required List<String> items,
    required String label,
    required Function(String?) onChanged,
  }) {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool selected,
    required Function(bool?) onSelected,
  }) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      selectedColor: Colors.green.withOpacity(0.2),
      checkmarkColor: Colors.green,
      labelStyle: TextStyle(
        color: selected ? Colors.green : Colors.black,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
