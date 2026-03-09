import 'package:flutter/material.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
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
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // SAU LOGO
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Logosau-02.png/250px-Logosau-02.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'มหาวิทยาลัยเอเชียอาคเนย์',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 32),

                  // Profile Deverloper
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child:
                        const Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // Student infomattion
                  _buildInfoRow('รหัสนักศึกษา', '6819M10002'),
                  _buildInfoRow('ชื่อ-นามสกุลนักศึกษา', 'วิษณุ มังคลา'),
                  _buildInfoRow('อีเมลนักศึกษา', 'S6819M10002@live.sau.ac.th'),
                  _buildInfoRow('ชื่อสาขาวิชา', 'วิศวกรรมคอมพิวเตอร์'),
                  _buildInfoRow('ชื่อคณะ', 'วิศวกรรมศาสตร์'),
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
      child: Text(
        '$label: $value',
        style: const TextStyle(fontSize: 14, color: Colors.black87),
        textAlign: TextAlign.center,
      ),
    );
  }
}
