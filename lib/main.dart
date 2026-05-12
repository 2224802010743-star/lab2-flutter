import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 2 Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainMenuPage(),
    );
  }
}

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 2 - Main Menu'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Chọn phần bài lab muốn xem:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          buildMenuButton(
            context,
            title: 'Part 1 - Layout Widgets',
            subtitle: 'Column, Row, Stack, Container, SizedBox',
            page: const Part1Page(),
          ),
          buildMenuButton(
            context,
            title: 'Part 2 - Responsive Layout',
            subtitle: 'MediaQuery và giao diện responsive',
            page: const Part2Page(),
          ),
          buildMenuButton(
            context,
            title: 'Part 3 - Named Routes Navigation',
            subtitle: 'Chuyển màn hình giữa Home và Second',
            page: const Part3HomePage(),
          ),
          buildMenuButton(
            context,
            title: 'Part 4 - Form Application',
            subtitle: 'Form nhập liệu và thông báo đăng ký',
            page: const Part4Page(),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Widget page,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: const Icon(Icons.arrow_forward_ios),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.open_in_new),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}

class Part1Page extends StatelessWidget {
  const Part1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part 1 - Layout Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "I'm in a Column and centered. Below is a Row.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 80, height: 80, color: Colors.red),
                const SizedBox(width: 10),
                Container(width: 80, height: 80, color: Colors.green),
                const SizedBox(width: 10),
                Container(width: 80, height: 80, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  width: 250,
                  height: 120,
                  color: Colors.yellow,
                ),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Stacked on Yellow Box',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Part2Page extends StatelessWidget {
  const Part2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget body;

    if (screenWidth < 600) {
      body = Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.amber[200],
              child: const Center(child: Text('Body')),
            ),
          ),
          Container(
            height: 80,
            color: Colors.green[200],
            child: const Center(child: Text('Navigation')),
          ),
        ],
      );
    } else if (screenWidth < 840) {
      body = Row(
        children: [
          Container(
            width: 100,
            color: Colors.green[200],
            child: const Center(child: Text('Navigation')),
          ),
          Expanded(
            child: Container(
              color: Colors.amber[200],
              child: const Center(child: Text('Body')),
            ),
          ),
        ],
      );
    } else {
      body = Row(
        children: [
          Container(
            width: 120,
            color: Colors.green[200],
            child: const Center(child: Text('Navigation')),
          ),
          Expanded(
            child: Container(
              color: Colors.amber[200],
              child: const Center(child: Text('Body')),
            ),
          ),
          Container(
            width: 180,
            color: Colors.orange[100],
            child: const Center(child: Text('Pane')),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Part 2 - Responsive Layout'),
      ),
      body: body,
    );
  }
}

class Part3HomePage extends StatelessWidget {
  const Part3HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part 3 - Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Part3SecondPage(),
              ),
            );
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class Part3SecondPage extends StatelessWidget {
  const Part3SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part 3 - Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

class Part4Page extends StatefulWidget {
  const Part4Page({super.key});

  @override
  State<Part4Page> createState() => _Part4PageState();
}

class _Part4PageState extends State<Part4Page> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void register() {
    final fullName =
        '${firstNameController.text} ${lastNameController.text}'.trim();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Registration Successful'),
        content: Text('Welcome, $fullName'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part 4 - Form Application'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              child: Icon(Icons.person, size: 45),
            ),
            const SizedBox(height: 20),
            buildTextField(
              label: 'First Name',
              controller: firstNameController,
            ),
            buildTextField(
              label: 'Last Name',
              controller: lastNameController,
            ),
            buildTextField(
              label: 'Email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            buildTextField(
              label: 'Phone Number',
              controller: phoneController,
              keyboardType: TextInputType.phone,
            ),
            buildTextField(
              label: 'Address',
              controller: addressController,
            ),
            buildTextField(
              label: 'Password',
              controller: passwordController,
              obscureText: true,
            ),
            buildTextField(
              label: 'Confirm Password',
              controller: confirmPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: register,
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}