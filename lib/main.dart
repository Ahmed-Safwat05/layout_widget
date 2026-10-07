import 'package:flutter/material.dart';

void main() {
  runApp(const FacebookProfile());
}

class FacebookProfile extends StatelessWidget {
  const FacebookProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Profile',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF18191A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF242526),
        ),
      ),
      home: const FacebookProfileScreen(),
    );
  }
}

class FacebookProfileScreen extends StatefulWidget {
  const FacebookProfileScreen({super.key});

  @override
  State<FacebookProfileScreen> createState() => _FacebookProfileScreenState();
}

class _FacebookProfileScreenState extends State<FacebookProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Scaffold(
      // 1. Navigation Bar Responsive
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: const Color(0xFF242526),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: Logo & Search Bar
              Row(
                children: [
                  const Icon(Icons.facebook, color: Colors.blue, size: 40),
                  const SizedBox(width: 8),
                  if (!isMobile)
                    Container(
                      width: 240,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3A3B3C),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Search Facebook',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    )
                  else
                    _buildCircleIcon(Icons.search),
                ],
              ),

              // Center Navigation Tabs
              if (!isMobile)
                Row(
                  children: const [
                    _NavBarIconButton(icon: Icons.home, isSelected: true),
                    _NavBarIconButton(icon: Icons.ondemand_video),
                    _NavBarIconButton(icon: Icons.storefront),
                    _NavBarIconButton(icon: Icons.groups),
                    _NavBarIconButton(icon: Icons.sports_esports),
                  ],
                ),

              // Right Action Icons
              Row(
                children: [
                  _buildCircleIcon(Icons.chat),
                  const SizedBox(width: 8),
                  Badge(
                    label: const Text('1'),
                    backgroundColor: Colors.red,
                    child: _buildCircleIcon(Icons.notifications),
                  ),
                  const SizedBox(width: 8),
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // 2. Responsive Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              color: const Color(0xFF242526),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1050),
                  child: Column(
                    children: [
                      // Cover Image Container with Stack for Avatar and Button
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Cover Photo
                          Container(
                            height: isMobile ? 200 : 320,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(8),
                              ),
                            ),
                            child: const Center(
                              child: Icon(Icons.landscape,
                                  size: 100, color: Colors.grey),
                            ),
                          ),

                          // Edit Cover Photo Button
                          Positioned(
                            bottom: 16,
                            right: 16,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.camera_alt,
                                  size: 18, color: Colors.black),
                              label: Text(
                                isMobile ? '' : 'Edit cover photo',
                                style: const TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),

                          // Profile Avatar (Positioned Overlapping Bottom of Cover)
                          Positioned(
                            left: isMobile ? (screenWidth / 2) - 70 : 32,
                            bottom: -30, // ينزل تحت حافة الكوفر بـ 30px
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF242526),
                                  width: 4,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: isMobile ? 60 : 80,
                                backgroundColor: Colors.blueAccent,
                                child: Icon(Icons.person,
                                    size: isMobile ? 60 : 80,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Profile Info Row (Name, Details & Buttons)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Flex(
                          direction:
                          isMobile ? Axis.vertical : Axis.horizontal,
                          crossAxisAlignment: isMobile
                              ? CrossAxisAlignment.center
                              : CrossAxisAlignment.end,
                          children: [
                            // Offset for Profile Avatar in Desktop
                            if (!isMobile) const SizedBox(width: 180),

                            // User Details
                            Expanded(
                              flex: isMobile ? 0 : 1,
                              child: Column(
                                crossAxisAlignment: isMobile
                                    ? CrossAxisAlignment.center
                                    : CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Ahmed Safwat',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    '1.5M followers • 1 following',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: isMobile
                                        ? MainAxisAlignment.center
                                        : MainAxisAlignment.start,
                                    children: const [
                                      Icon(Icons.school,
                                          size: 16, color: Colors.grey),
                                      SizedBox(width: 6),
                                      Flexible(
                                        child: Text(
                                          'Faculty of Computers and Informatics Zagazig University',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 13),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            if (isMobile) const SizedBox(height: 16),

                            // Action Buttons
                            Row(
                              mainAxisAlignment: isMobile
                                  ? MainAxisAlignment.center
                                  : MainAxisAlignment.start,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.dashboard,
                                      size: 18, color: Colors.white),
                                  label: const Text('Dashboard',
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit,
                                      size: 18, color: Colors.white),
                                  label: const Text('Edit',
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      const Color(0xFF3A3B3C)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),
                      const Divider(height: 32, color: Colors.grey),

                      // TabBar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          indicatorColor: Colors.blue,
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.grey,
                          tabs: const [
                            Tab(text: 'Posts'),
                            Tab(text: 'About'),
                            Tab(text: 'Reels'),
                            Tab(text: 'Photos'),
                            Tab(text: 'Friends'),
                            Tab(text: 'More'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Main Content Section Responsive Layout
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1050),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 800) {
                      // Web View (Two Columns Layout)
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 360,
                            child: _buildLeftColumn(),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildRightColumn(),
                          ),
                        ],
                      );
                    } else {
                      // Mobile View (Single Column Layout)
                      return Column(
                        children: [
                          _buildLeftColumn(),
                          const SizedBox(height: 16),
                          _buildRightColumn(),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Left Column Widgets (Details & Photos)
  Widget _buildLeftColumn() {
    return Column(
      children: [
        _buildSectionCard(
          title: 'Personal details',
          child: Column(
            children: [
              _buildDetailRow(Icons.location_on, 'Lives in Minya El-Qamh'),
              _buildDetailRow(Icons.home, 'From Minya El-Qamh'),
              _buildDetailRow(Icons.cake, 'September 27, 2005'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildSectionCard(
          title: 'Photos',
          child: SizedBox(
            height: 200,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[800],
                  child: const Icon(Icons.image, color: Colors.grey),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Right Column Widgets (Create Post & Posts List)
  Widget _buildRightColumn() {
    return Column(
      children: [
        _buildSectionCard(
          title: "What's on your mind?",
          child: Column(
            children: [
              const Divider(color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPostOption(Icons.videocam, 'Live', Colors.red),
                  _buildPostOption(Icons.photo_library, 'Photo', Colors.green),
                  _buildPostOption(Icons.movie, 'Reel', Colors.pink),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: const Color(0xFF242526),
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Ahmed Safwat',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'October 4, 2023 • 🌎',
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 250,
                      width: double.infinity,
                      color: Colors.grey[800],
                      child: const Icon(
                        Icons.image,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Helper Methods
  static Widget _buildCircleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFF3A3B3C),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  static Widget _buildSectionCard(
      {required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF242526),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  static Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildPostOption(IconData icon, String label, Color color) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class _NavBarIconButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const _NavBarIconButton({required this.icon, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 56,
      decoration: BoxDecoration(
        border: isSelected
            ? const Border(bottom: BorderSide(color: Colors.blue, width: 3))
            : null,
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.grey,
        size: 28,
      ),
    );
  }
}