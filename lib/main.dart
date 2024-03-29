import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NextScreen(),
    );
  }
}

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  
  int _currentIndex = 0;

  final List<String> images = [
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
  ];

  final List<String> fitur1 = [
    'images/f1.png',
    'images/f2.png',
    'images/f3.png',
    'images/f4.png'
  ];
  final List<String> fitur2 = [
    'images/f5.png',
    'images/f6.png',
    'images/1.jpg',
    'images/2.jpg'
  ];

  final List<String> ft1 = [
    'Resume Medis', 'Cari Obat', 'Cari Dokter', 'Pengingat Minum Obat',
  ];
  final List<String> ft2 = [
    'Diari Kesehatan', 'Buat Janji', 'Fitur', 'Fitur',
  ];

  final List<String> articles = [
    'images/a1.jpg', 'images/a2.jpg', 'images/a3.jpg'
  ];

  final List<String> judul = [
    'Makanan Sehat untuk Puasa', 'Olahraga', 'Menjaga Kesehatan Jantung'
  ];

  final List<String> categories = [
    'Makanan', 'Gaya Hidup', 'Jantung'
  ];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
          
          // gambar di atas
          Image.asset(
            'images/top.png',
            height: 209, // Sesuaikan dengan tinggi gambar yang diinginkan
            width: MediaQuery.of(context).size.width, // Lebar gambar mengisi layar penuh
            fit: BoxFit.cover, // Menyesuaikan gambar dengan lebar dan tinggi yang telah ditentukan
          ),
          
          // fitur
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: fitur1.asMap().entries.map((entry) {
              String image = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Atur posisi ke atas
                  children: [
                    ClipOval(
                      child: Image.asset(
                        image,
                        height: 65,
                        width: 65,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 88, // Sesuaikan dengan lebar gambar
                      height: 45,
                      // color: Colors.black12,
                      child: Text(
                        ft1[entry.key],
                        style: TextStyle(
                          fontSize: 12, 
                          fontFamily: 'Poppins', 
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF37363B), 
                          letterSpacing: 0.05),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: fitur2.asMap().entries.map((entry) {
              String image = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Atur posisi ke atas
                  children: [
                    ClipOval(
                      child: Image.asset(
                        image,
                        height: 65,
                        width: 65,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 88, // Sesuaikan dengan lebar gambar
                      height: 45,
                      child: Text(
                        ft2[entry.key],
                        style: TextStyle(
                          fontSize: 12, 
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500, 
                          color: Color(0xFF37363B), 
                          letterSpacing: 0.05),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          
          SizedBox(height: 20),
          // carousel
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: false,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          
          SizedBox(height: 20),
          // dot di bawah carousel
          AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: images.length,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              spacing: 5,
              dotColor: Colors.grey,
              activeDotColor: Color(0xFF4A707A),
              paintStyle: PaintingStyle.fill,
            ),
          ),
        
          SizedBox(height: 20),
          // artikel
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 21,),
            Text(
              'Artikel Kesehatan', 
              style: TextStyle(
                fontSize: 25, 
                fontFamily: 'Poppins', 
                fontWeight: FontWeight.w600,
                color: Color(0xFF4A707A),
                letterSpacing: 0.08,
              ),
            ),
          ],
          ),
          SizedBox(height: 10),
          Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Lihat Semua',
              style: TextStyle(
                fontSize: 12, // Sesuaikan dengan ukuran teks yang diinginkan
                fontFamily: 'Poppins', 
                fontWeight: FontWeight.w500,
                color: Color(0xFF4A707A),
                letterSpacing: 0.05,
              ),
            ),
            SizedBox(width: 21,),
          ],
          ),
          SizedBox(height: 15,),
          Column(
          children: articles.asMap().entries.map((entry) {
            String imagePath = entry.value; 
            int index = entry.key; // Ambil indeks gambar saat ini
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 21),
                      Container(
                        height: 88,
                        width: 88,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5), // Tambahkan borderRadius di dalam BoxDecoration
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5), // Untuk memastikan gambar terpotong sesuai dengan borderRadius
                          child: Image.asset(
                            imagePath, // Gunakan imagePath langsung
                            height: 65,
                            width: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 15), // Tambahkan ruang horizontal di antara gambar dan teks
                      Expanded(
                        child: Container(
                          height: 88, 
                          width: double.infinity, // Lebar container mengikuti lebar yang tersedia
                          // color: Colors.amber,
                          padding: EdgeInsets.all(8.0), // Beri padding agar teks terlihat lebih baik
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0), // Atur padding untuk kontainer kategori
                                decoration: BoxDecoration(
                                  color: Color(0xFF94B0B7), // Warna latar belakang kontainer kategori
                                  borderRadius: BorderRadius.circular(15), // Atur border radius untuk kontainer kategori
                                ),
                                child: Text(
                                  '${categories[index]}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF37363B), // Warna teks kategori
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.05,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4), // Spacer vertikal antara teks
                              Text(
                                judul[index], // Mengambil judul dari list berdasarkan index gambar saat ini
                                style: TextStyle(
                                  fontSize: 12, // Mengatur ukuran teks judul
                                  color: Color(0xFF37363B),
                                  fontWeight: FontWeight.w600, // Membuat teks judul menjadi tebal
                                  letterSpacing: 0.08,
                                ),
                                maxLines: 1, // Hanya menampilkan satu baris untuk judul
                                overflow: TextOverflow.ellipsis, // Mengatur overflow jika teks terlalu panjang
                              ),
                              SizedBox(height: 4), // Spacer vertikal antara teks
                              Text(
                                'Deskripsi',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                                maxLines: 2, // Hanya menampilkan dua baris untuk deskripsi
                                overflow: TextOverflow.ellipsis, // Mengatur overflow jika teks terlalu panjang
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0), // Atur jarak horizontal dari divider
                    child: Divider(color: Color(0xFFDDDDDA),), // Tambahkan garis divider di antara setiap item
                  ), // Tambahkan garis divider di antara setiap item
                ],
              ),
            );
          }).toList(),
        ),
        ],
      ),
      ),

      // bottom navbar
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color(0xFF7697A0),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_hospital),
            label: 'Cari Dokter',
          ),
          NavigationDestination(
            icon: Icon(Icons.medical_services),
            label: 'Cari Obat',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

