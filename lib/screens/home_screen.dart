import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Örnek paylaşımlar
  final List<Map<String, dynamic>> _posts = [
    {
      'type': 'goal',
      'userName': 'Ahmet Yılmaz',
      'userImage': 'https://randomuser.me/api/portraits/men/1.jpg',
      'videoUrl': 'https://example.com/video1.mp4',
      'thumbnailUrl':
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      'description': 'Dabakoğlu Halısaha\'da attığım muhteşem gol!',
      'likes': 45,
      'comments': 12,
      'timeAgo': '2 saat önce',
      'halisahaName': 'Dabakoğlu Halısaha',
      'isLiked': false,
    },
    {
      'type': 'tournament',
      'userName': 'Barbaros Halısaha',
      'userImage': 'https://randomuser.me/api/portraits/men/3.jpg',
      'imageUrl':
          'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=800',
      'title': 'Mini Çanakkale Futbol Turnuvası',
      'description':
          '8 takımın katılımıyla gerçekleşecek turnuvamızda sizleri de aramızda görmekten mutluluk duyarız!',
      'date': '15 Nisan 2024',
      'time': '14:00',
      'location': 'Barbaros Halısaha',
      'price': '1000 TL',
      'teamCount': '8 Takım',
      'likes': 89,
      'comments': 34,
      'timeAgo': '1 gün önce',
      'isLiked': false,
      'details': {
        'format': '5\'er kişilik takımlar',
        'duration': '2 gün',
        'prize': '1. Takım: 3000 TL\n2. Takım: 2000 TL\n3. Takım: 1000 TL',
        'rules': [
          'Her takım en az 8, en fazla 12 oyuncu kaydedebilir',
          'Maçlar 2x15 dakika olarak oynanacak',
          'Her takım en az 1 hakem görevlendirmelidir',
          'Kırmızı kart gören oyuncu turnuvadan ihraç edilir',
        ],
      },
    },
    {
      'type': 'goal',
      'userName': 'Mehmet Demir',
      'userImage': 'https://randomuser.me/api/portraits/men/2.jpg',
      'videoUrl': 'https://example.com/video2.mp4',
      'thumbnailUrl':
          'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=800',
      'description': 'TR Cup\'ta attığım voli gol!',
      'likes': 78,
      'comments': 23,
      'timeAgo': '5 saat önce',
      'halisahaName': 'TR Cup Halısaha',
      'isLiked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Topla',
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
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.white),
            onPressed: () {
              _showAddPostDialog(context);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Yenileme işlemi
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            final post = _posts[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kullanıcı Bilgileri
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(post['userImage']),
                    ),
                    title: Text(
                      post['userName'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(post['timeAgo']),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        _showOptionsDialog(context);
                      },
                    ),
                  ),

                  if (post['type'] == 'goal') ...[
                    // Video Thumbnail
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: post['thumbnailUrl'],
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              height: 300,
                              color: Colors.grey[300],
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 300,
                              color: Colors.grey[300],
                              child: const Icon(Icons.error),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),

                    // Açıklama
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post['description'],
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            post['halisahaName'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else if (post['type'] == 'tournament') ...[
                    // Turnuva Görseli
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: post['imageUrl'],
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          height: 200,
                          color: Colors.grey[300],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 200,
                          color: Colors.grey[300],
                          child: const Icon(Icons.error),
                        ),
                      ),
                    ),

                    // Turnuva Detayları
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post['title'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            post['description'],
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildTournamentInfo(
                            Icons.calendar_today,
                            '${post['date']} - ${post['time']}',
                          ),
                          const SizedBox(height: 8),
                          _buildTournamentInfo(
                            Icons.location_on,
                            post['location'],
                          ),
                          const SizedBox(height: 8),
                          _buildTournamentInfo(
                            Icons.people,
                            post['teamCount'],
                          ),
                          const SizedBox(height: 8),
                          _buildTournamentInfo(
                            Icons.attach_money,
                            post['price'],
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              _showTournamentDetails(context, post);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Detayları Gör'),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Etkileşim Butonları
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        _buildInteractionButton(
                          icon: post['isLiked']
                              ? Icons.favorite
                              : Icons.favorite_border,
                          label: '${post['likes']}',
                          color: post['isLiked'] ? Colors.red : null,
                          onTap: () {
                            setState(() {
                              post['isLiked'] = !post['isLiked'];
                              post['likes'] += post['isLiked'] ? 1 : -1;
                            });
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildInteractionButton(
                          icon: Icons.comment_outlined,
                          label: '${post['comments']}',
                          onTap: () {
                            _showCommentsDialog(context);
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildInteractionButton(
                          icon: Icons.share_outlined,
                          label: 'Paylaş',
                          onTap: () {
                            // Paylaşma işlemi
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTournamentInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  void _showTournamentDetails(
      BuildContext context, Map<String, dynamic> tournament) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tournament['title']),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Turnuva Formatı',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(tournament['details']['format']),
              const SizedBox(height: 16),
              const Text(
                'Süre',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(tournament['details']['duration']),
              const SizedBox(height: 16),
              const Text(
                'Ödüller',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(tournament['details']['prize']),
              const SizedBox(height: 16),
              const Text(
                'Kurallar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...tournament['details']['rules'].map((rule) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• '),
                        Expanded(child: Text(rule)),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kapat'),
          ),
          ElevatedButton(
            onPressed: () {
              // Turnuvaya katılma işlemi
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Katıl'),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 4),
            Text(label),
          ],
        ),
      ),
    );
  }

  void _showAddPostDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Paylaşım Yap'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Kamera ile video çekme
              },
              icon: const Icon(Icons.videocam),
              label: const Text('Video Çek'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // Galeriden video seçme
              },
              icon: const Icon(Icons.photo_library),
              label: const Text('Galeriden Seç'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // Turnuva paylaşma
              },
              icon: const Icon(Icons.emoji_events),
              label: const Text('Turnuva Paylaş'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
        ],
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Seçenekler'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Bildir'),
              onTap: () {
                Navigator.pop(context);
                // Bildirme işlemi
              },
            ),
            ListTile(
              leading: const Icon(Icons.block),
              title: const Text('Kullanıcıyı Engelle'),
              onTap: () {
                Navigator.pop(context);
                // Engelleme işlemi
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCommentsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Yorumlar'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3, // Örnek yorum sayısı
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: const Text('Kullanıcı Adı'),
                subtitle: const Text('Harika bir gol olmuş!'),
                trailing: Text(
                  '${index + 1} saat önce',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Yorum yaz...',
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  // Yorum gönderme işlemi
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
