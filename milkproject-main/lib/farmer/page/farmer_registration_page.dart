import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'farmer_home_page.dart';
// For picking document images

class FarmerRegistrationScreen extends StatefulWidget {
  const FarmerRegistrationScreen({super.key});

  @override
  _FarmerRegistrationScreenState createState() =>
      _FarmerRegistrationScreenState();
}

class _FarmerRegistrationScreenState extends State<FarmerRegistrationScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController =
      TextEditingController(); // Email field
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController cowsController = TextEditingController();
  XFile? _document; // To hold the selected document image
  bool _isPasswordVisible = false; // Control password visibility

  // Function to pick the document image (e.g., farmer's ID or farm document)
  Future<void> _pickDocument() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _document = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey, // Attach the form key for validation
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // "Farmer Registration" text
                  const Text(
                    'Farmer Registration',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Name Text Field
                  Row(
                    children: [
                      const Icon(Icons.person, size: 30, color: Colors.green),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Email Text Field
                  Row(
                    children: [
                      const Icon(Icons.email, size: 30, color: Colors.green),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Phone Text Field
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 30, color: Colors.green),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!RegExp(r'^\+?[0-9]{10,13}$').hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Password Text Field with Eye Icon
                  Row(
                    children: [
                      const Icon(Icons.lock, size: 30, color: Colors.green),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password Text Field with Eye Icon
                  Row(
                    children: [
                      const Icon(Icons.lock_outline,
                          size: 30, color: Colors.green),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: confirmPasswordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // How Many Cows Field
                  Row(
                    children: [
                      Image.asset('asset/cow (1).png', width: 30, height: 30,color: Colors.green,),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: cowsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'How many cows?',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the number of cows';
                            }
                            if (int.tryParse(value) == null ||
                                int.parse(value) <= 0) {
                              return 'Please enter a valid number of cows';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Upload Document Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3EA120),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 60.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _pickDocument,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.upload_file, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Upload Document (Optional)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // If a document is selected, show the document name
                  if (_document != null)
                    Text(
                      'Document Selected: ${_document!.name}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),

                  const SizedBox(height: 20),

                  // Full-Width Register Button
                  SizedBox(
                    width: double
                        .infinity, // This ensures the button is full width
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3EA120),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 60.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Validate the form before proceeding
                        if (_formKey.currentState?.validate() ?? false) {
                          // Handle successful registration logic
                          String name = nameController.text;
                          String email = emailController.text;
                          String phone = phoneController.text;
                          String cows = cowsController.text;
                          String password = passwordController.text;

                           Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FarmerChoiceScreen(),
                  ),
                );

                          // Example: print the data (you could send this to a server)
                          // FarmerAuthService().FarmerRegister(context: context, name: name, password: password, aadhar: aadhar, ration: ration, bank: bank, phone: phone, email: email)
                        } else {
                          // Show an error message if validation fails
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Please fill all fields correctly')),
                          );
                        }
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check_circle, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
        ),
      ),
    );
  }
}
