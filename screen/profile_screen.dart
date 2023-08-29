import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/screen/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SizedBox(width: 50),
                UserProfileImage(),
                SizedBox(width: 25),
                ProfileFollowInfo(),
              ],
            )
          ),          
          Divider(),
          UserProfileButtons(),
        ],
      ),
    );
  }
}

class UserProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Expanded(
          child: ListTile(
            leading: Icon(Icons.grid_on),
            title: Text('게시물'),
            onTap: () {

            },
          ),
        ),

        Expanded(
          child: ListTile(
            leading: Icon(Icons.chat_bubble),
            title: Text('댓글'),
            onTap: () {

            },
          ),
        ),

        Expanded(
          child: ListTile(
            leading: Icon(Icons.favorite),
            title: Text('좋아요'),
            onTap: () {

            },
          ),
        ),
      ],
    );
  }
}

class ProfileFollowInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('게시물', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('254'),
          ],
        ),
        SizedBox(width: 30),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileRecommendedList(),
              ),
            );
          },
          child: Column(
            children: [
              Text('팔로워', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('10M'),
            ],
          ),
        ),
        SizedBox(width: 30),
        Column(
          children: [
            Text('팔로우', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('6'),
          ],
        ),
        SizedBox(width: 30),
      ],
    );
  }
}


class ProfileRecommendedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Text('회원님을 위한 추천', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          ProfileCardsList(),
        ],
      ),
    );
  }
}

class ProfileCardsList extends StatelessWidget {
  final List<ProfileData> profiles = [
    ProfileData('사용자1', 'https://placekitten.com/200/200'),
    ProfileData('사용자2', 'https://placekitten.com/200/201'),
    ProfileData('사용자3', 'https://placekitten.com/200/202'),
    ProfileData('사용자3', 'https://placekitten.com/200/202'),
    ProfileData('사용자3', 'https://placekitten.com/200/202'),
    ProfileData('사용자3', 'https://placekitten.com/200/202'),
    ProfileData('사용자3', 'https://placekitten.com/200/202'),
    ProfileData('사용자3', 'https://placekitten.com/200/202'),
    ProfileData('사용자3', 'https://placekitten.com/200/202'),
    ProfileData('사용자3', 'https://placekitten.com/200/202'),
    ProfileData('사용자3', 'https://placekitten.com/200/202'),
    ProfileData('사용자3', 'https://placekitten.com/200/202'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: profiles.length,
        itemBuilder: (BuildContext context, int index) {
          return ProfileCard(profile: profiles[index]);
        },
      )
    );
  }
}

class ProfileCard extends StatelessWidget {
  final ProfileData profile;

  ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 200,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(profile.profileImageUrl),
          ),
          SizedBox(height: 8),
          Text(profile.username),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {

            },
            child: Text('팔로우'),
          ),
          SizedBox(height: 8)
        ],
      ),
    );
  }
}

class ProfileData {
  final String username;
  final String profileImageUrl;

  ProfileData(this.username, this.profileImageUrl);
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: ListView(
        children: [
          for (var settingGroup in settingsList)
            ListTile(
              title: Text(settingGroup['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SettingsDetailScreen(settingGroup: settingGroup),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class SettingsDetailScreen extends StatefulWidget {
  final Map<String, dynamic> settingGroup;

  SettingsDetailScreen({required this.settingGroup});

  @override
  _SettingsDetailScreenState createState() => _SettingsDetailScreenState();
}

class _SettingsDetailScreenState extends State<SettingsDetailScreen> {
  List<Map<String, dynamic>> settingValueList = [];

  @override
  void initState() {
    super.initState();
    settingValueList = List.from(widget.settingGroup['valueList']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.settingGroup['title']),
      ),
      body: Column(
        children: [
          for (var setting in settingValueList)
            ListTile(
              title: Text(setting['title']),
              trailing: Switch(
                value: setting['value'],
                onChanged: (value) {
                  setState(() {
                    setting['value'] = value;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> settingsList = [
  {
    'title': '설정 및 개인정보',
    'valueList': [
      {'title': '설정 1', 'value': false},
      {'title': '설정 2', 'value': false},
      // ... 추가 설정 값
    ]
  },
  {
    'title': '내 활동',
    'valueList': [
      {'title': '설정 1', 'value': false},
      {'title': '설정 2', 'value': false},
      // ... 추가 설정 값
    ]
  },
  {
    'title': '보관',
    'valueList': [
      {'title': '설정 1', 'value': false},
      {'title': '설정 2', 'value': false},
      // ... 추가 설정 값
    ]
  },
  {
    'title': '즐겨 찾기',
    'valueList': [
      {'title': '설정 1', 'value': false},
      {'title': '설정 2', 'value': false},
      // ... 추가 설정 값
    ]
  },
];