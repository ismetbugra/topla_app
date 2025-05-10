import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateOpponentPostScreen extends StatefulWidget {
  const CreateOpponentPostScreen({super.key});

  @override
  State<CreateOpponentPostScreen> createState() =>
      _CreateOpponentPostScreenState();
}

class _CreateOpponentPostScreenState extends State<CreateOpponentPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  final _fieldNameController = TextEditingController();
  final _contactInfoController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _playerCount = 7;
  double _price = 500;

  @override
  void dispose() {
    _cityController.dispose();
    _fieldNameController.dispose();
    _contactInfoController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.green,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.green,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yeni İlan Oluştur',
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
        child: SingleChildScrollView(
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
                child: const Text(
                  'Halısaha maçı için rakip takım arıyorsanız, aşağıdaki formu doldurarak ilanınızı oluşturabilirsiniz.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 80),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildSectionTitle('Maç Bilgileri'),
                      const SizedBox(height: 16),

                      // Şehir Seçimi
                      _buildDropdownField(
                        label: 'Şehir',
                        value: _cityController.text.isEmpty
                            ? 'Şehir Seçin'
                            : _cityController.text,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Şehir Seçin'),
                              content: SizedBox(
                                width: double.maxFinite,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: [
                                    'İstanbul',
                                    'Ankara',
                                    'İzmir',
                                    'Bursa'
                                  ].length,
                                  itemBuilder: (context, index) {
                                    final city = [
                                      'İstanbul',
                                      'Ankara',
                                      'İzmir',
                                      'Bursa'
                                    ][index];
                                    return ListTile(
                                      title: Text(city),
                                      selected: city == _cityController.text,
                                      selectedTileColor:
                                          Colors.green.withOpacity(0.1),
                                      onTap: () {
                                        setState(() {
                                          _cityController.text = city;
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),

                      // Halısaha Adı
                      _buildTextField(
                        controller: _fieldNameController,
                        label: 'Halısaha Adı',
                        hint: 'Halısahanın tam adını girin',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen halısaha adı giriniz';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      _buildSectionTitle('Maç Detayları'),
                      const SizedBox(height: 16),

                      // Tarih ve Saat Seçimi
                      Row(
                        children: [
                          Expanded(
                            child: _buildDateField(
                              label: 'Tarih',
                              value: DateFormat('dd.MM.yyyy')
                                  .format(_selectedDate),
                              onTap: () => _selectDate(context),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildDateField(
                              label: 'Saat',
                              value: _selectedTime.format(context),
                              onTap: () => _selectTime(context),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Kişi Sayısı Seçimi
                      _buildDropdownField(
                        label: 'Kişi Sayısı',
                        value: '$_playerCount vs $_playerCount',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Kişi Sayısı Seçin'),
                              content: SizedBox(
                                width: double.maxFinite,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: [5, 7, 11].length,
                                  itemBuilder: (context, index) {
                                    final count = [5, 7, 11][index];
                                    return ListTile(
                                      title: Text('$count vs $count'),
                                      selected: count == _playerCount,
                                      selectedTileColor:
                                          Colors.green.withOpacity(0.1),
                                      onTap: () {
                                        setState(() {
                                          _playerCount = count;
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),

                      // Fiyat Seçimi
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fiyat: ${_price.toStringAsFixed(0)} TL',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Slider(
                              value: _price,
                              min: 0,
                              max: 1000,
                              divisions: 20,
                              activeColor: Colors.green,
                              label: _price.toStringAsFixed(0),
                              onChanged: (double value) {
                                setState(() {
                                  _price = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      _buildSectionTitle('İletişim Bilgileri'),
                      const SizedBox(height: 16),

                      // İletişim Bilgileri
                      _buildTextField(
                        controller: _contactInfoController,
                        label: 'İletişim Bilgileri',
                        hint:
                            'Telefon numaranızı veya iletişim bilgilerinizi girin',
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen iletişim bilgilerini giriniz';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Açıklama
                      _buildTextField(
                        controller: _descriptionController,
                        label: 'Açıklama',
                        hint: 'Maç hakkında detaylı bilgi verin (örn: seviye, özel istekler, vb.)',
                        maxLines: 4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen açıklama giriniz';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),

                      // İlanı Yayınla Butonu
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // TODO: İlanı kaydet
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'İlanı Yayınla',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
