import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const PremiumIslamicApp());
}

class PremiumIslamicApp extends StatelessWidget {
  const PremiumIslamicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مواقيت الصلاة والقرآن الكريم',
      theme: ThemeData(
        primaryColor: const Color(0TemplateColor.olive),
        fontFamily: 'Cairo', // يفضل إضافة خط عربي أنيق في ملف pubspec.yaml
      ),
      home: const MainDashboardScreen(),
    );
  }
}

// ثوابت الألوان المطلوبة (زيتوني وذهبي)
class TemplateColor {
  static const int olive = 0xFF3D5230;      // أخضر زيتوني فاخر
  static const int gold = 0xFFD4AF37;       // ذهبي ملكي
  static const int lightGold = 0xFFF9F6EE;  // خلفية ذهبية فاتحة جداً مريحة للعين
}

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({Key? key}) : super(key: key);

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  // متغيرات التحكم بالمنطقة والتعديل اليدوي
  String selectedRegion = "دمشق، سوريا";
  Map<String, String> prayerTimes = {
    "الفجر": "04:32 م",
    "الظهر": "12:45 م",
    "العصر": "04:15 م",
    "المغرب": "07:30 م",
    "العشاء": "09:00 م",
  };

  int _selectedIndex = 0;

  // دالة لتعديل وقت الأذان يدوياً
  void _editPrayerTime(String prayerName) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((pickedTime) {
      if (pickedTime != null) {
        setState(() {
          prayerTimes[prayerName] = pickedTime.format(context);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // الواجهات المختلفة للتطبيق
    final List<Widget> screens = [
      _buildHomeScreen(),
      _buildCompassScreen(),
      _buildQuranScreen(),
      _buildSettingsScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color(TemplateColor.lightGold),
      appBar: AppBar(
        backgroundColor: const Color(TemplateColor.olive),
        title: const Text(
          'تطبيق الميقات والنور',
          style: TextStyle(color: Color(TemplateColor.gold), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(TemplateColor.gold),
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(TemplateColor.olive),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'القبلة'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'القرآن'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'الإعدادات'),
        ],
      ),
    );
  }

  // 1. الواجهة الرئيسية (الساعة، مواقيت الصلاة، الزخارف)
  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // لوحة علوية تحتوي على زخارف وهلال ومآذن (تم تمثيلها برمزيات بصرية متقنة)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(TemplateColor.olive),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.brightness_3, color: Color(TemplateColor.gold), size: 40), // هلال
                    Text("🕌", style: TextStyle(fontSize: 40)), // رمز المآذن
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  selectedRegion,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "12:23 م",
                  style: TextStyle(color: Color(TemplateColor.gold), fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "الوقت المتبقي للأذان القادم: 04:20:15",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          // قائمة مواقيت الصلاة مع إمكانية التعديل
          Padding(
            padding: const EdgeInsets.horizontal(15),
            child: Column(
              children: prayerTimes.keys.map((prayer) {
                return Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(TemplateColor.gold), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.notifications_active, color: Color(TemplateColor.olive)),
                    title: Text(prayer, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(TemplateColor.olive))),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(prayerTimes[prayer]!, style: const TextStyle(color: Color(TemplateColor.gold), fontWeight: FontWeight.bold, fontSize: 16)),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.grey, size: 20),
                          onPressed: () => _editPrayerTime(prayer),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // 2. واجهة بوصلة جهة القبلة
  Widget _buildCompassScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "بوصلة تحديد اتجاه القبلة",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(TemplateColor.olive)),
          ),
          const SizedBox(height: 30),
          // محاكاة بصرية لمؤشر البوصلة الدوار والقبلة
          Transform.rotate(
            angle: math.pi / 4, // محاكاة لزاوية الكعبة الحقيقية عبر الحساسات
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(TemplateColor.gold), width: 8),
                    color: const Color(TemplateColor.olive),
                  ),
                ),
                const Icon(Icons.navigation, size: 100, color: Color(TemplateColor.gold)),
                const Positioned(
                  top: 20,
                  child: Text("🕋", style: TextStyle(fontSize: 30)),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text("يرجى وضع الهاتف بشكل مسطح للحصول على أدق نتيجة", style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  // 3. واجهة القرآن الكريم كاملاً مع تلاوات الشيوخ
  Widget _buildQuranScreen() {
    final List<String> surahs = ["الفاتحة", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام", "الأعراف"]; // نموذج للمصحف كاملاً
    return ListView.builder(
      itemCount: surahs.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(TemplateColor.gold),
              child: Text("${index + 1}", style: const TextStyle(color: Color(TemplateColor.olive))),
            ),
            title: Text(surahs[index], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("عدد الآيات: جاهز للقراءة والتلاوة"),
            trailing: IconButton(
              icon: const Icon(Icons.play_circle_fill, color: Color(TemplateColor.olive), size: 32),
              onPressed: () {
                // مشغل الصوت للشيخ المختار
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("جاري تشغيل سورة ${surahs[index]} بصوت الشيخ المختار...")),
                );
              },
            ),
          ),
        );
      },
    );
  }

  // 4. واجهة الإعدادات (أصوات الشيوخ، نغمات المنبه والاستيقاظ، تعديل المنطقة)
  Widget _buildSettingsScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Text("إعدادات الأذان والمنبه", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(TemplateColor.olive))),
          const Divider(color: Color(TemplateColor.gold)),
          
          // تخصيص صوت مؤذن الصلاة
          ListTile(
            title: const Text("صوت مؤذن الصلاة (أصوات الشيوخ)"),
            subtitle: const Text("الشيخ عبد الباسط عبد الصمد"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // قائمة الاختيار بين الشيوخ (المنشاوي، العفاسي، مصطفى إسماعيل...)
            },
          ),
          
          // تخصيص نغمة منبه الاستيقاظ
          ListTile(
            title: const Text("نغمة منبه الاستيقاظ"),
            subtitle: const Text("نغمة الفجر الروحانية (قابلة للتبديل)"),
            trailing: const Icon(Icons.music_note, color: Color(TemplateColor.gold)),
            onTap: () {
              // كود لتبديل النغمات
            },
          ),
          
          // تعديل المنطقة الجغرافية
          ListTile(
            title: const Text("المنطقة الجغرافية / تحديد الموقع"),
            subtitle: Text(selectedRegion),
            trailing: const Icon(Icons.location_on, color: Color(TemplateColor.olive)),
            onTap: () {
              // هنا يمكن ربط الـ GPS أو كتابة المدينة يدوياً
              setState(() {
                selectedRegion = "اللاذقية، سوريا"; // مثال على التعديل
              });
            },
          ),
        ],
      ),
    );
  }
}

