import 'package:flutter/material.dart';

const Color kPrimary = Color(0xFF2D7D6F);
const Color kPrimaryLight = Color(0xFFE8F5F3);
const Color kTextDark = Color(0xFF1A1A2E);

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        shadowColor: Colors.black12,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kTextDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: kTextDark,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                56 -
                MediaQuery.of(context).padding.top,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    'ผู้จัดทำ',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: kPrimary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // SAU Logo
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Logosau-02.png/250px-Logosau-02.png',
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Icon(Icons.school,
                            size: 50, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'มหาวิทยาลัยเอเชียอาคเนย์',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 32),

                  // Profile avatar
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kPrimary, width: 3),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: kPrimaryLight,
                      child:
                          const Icon(Icons.person, size: 50, color: kPrimary),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Student info card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildInfoRow('รหัสนักศึกษา', '6819M10002'),
                        _buildInfoRow('ชื่อ-นามสกุลนักศึกษา', 'วิษณุ มังคลา'),
                        _buildInfoRow(
                            'อีเมลนักศึกษา', 'S6819M10002@live.sau.ac.th'),
                        _buildInfoRow('ชื่อสาขาวิชา', 'วิศวกรรมคอมพิวเตอร์'),
                        _buildInfoRow('ชื่อคณะ', 'วิศวกรรมศาสตร์'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: kPrimary,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, color: kTextDark),
            ),
          ),
        ],
      ),
    );
  }
}
