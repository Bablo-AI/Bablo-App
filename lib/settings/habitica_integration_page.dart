import '../home/make_request.dart';
import 'package:flutter/material.dart';

import '../core/loader.dart';
import '../core/widget.dart';

class HabiticaIntegrationPage extends StatefulWidget {
  const HabiticaIntegrationPage({Key? key}) : super(key: key);

  @override
  _HabiticaIntegrationPageState createState() =>
      _HabiticaIntegrationPageState();
}

class _HabiticaIntegrationPageState extends State<HabiticaIntegrationPage> {
  final _formKey = GlobalKey<FormState>();
  final Loader _loader = Loader();

  final TextEditingController _habiticaUserIdController =
      TextEditingController();
  final TextEditingController _habiticaApiKeyController =
      TextEditingController();

  void _saveSettings() async {
    if (_formKey.currentState!.validate()) {
      // Retrieve the input values
      String habiticaUserId = _habiticaUserIdController.text;
      String habiticaApiKey = _habiticaApiKeyController.text;

      // Test the API key and user ID
      bool isValid =
          await HabiticaData.testHabiticaAPI(habiticaUserId, habiticaApiKey);
      if (!isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid Habitica API Key or User ID')),
        );
        return;
      }

      // Encrypt and save the data locally
      _loader.saveHabiticaDetails(habiticaUserId, habiticaApiKey);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('API Key and User ID saved')),
      );
      Navigator.pop(context);
    }
  }

  void _loadSettings() async {
    Map<String, String?> details = await _loader.loadHabiticaDetails();
    _habiticaUserIdController.text = details['userId'] ?? '';
    _habiticaApiKeyController.text = details['apiKey'] ?? '';
  }

  @override
  void dispose() {
    _habiticaUserIdController.dispose();
    _habiticaApiKeyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return CoreScaffold(
        title: "Mentor/Settings/Habitica",
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CoreText(text: 'What is Habitica?'),
                const SizedBox(height: 8.0),
                const CoreText(
                  text:
                      'Habitica is a habit-tracking app that helps you improve your productivity and turn your tasks and goals into a game. To connect with Habitica, you need to provide your Habitica User ID and API Key.',
                ),
                const SizedBox(height: 16.0),
                const CoreText(
                  text: "To find your API Token",
                  style: TextStyle(
                    color: Color.fromARGB(255, 50, 204, 102),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const CoreText(
                  text: '1. For the website: User Icon > Settings > API.',
                ),
                const SizedBox(height: 8.0),
                const CoreText(
                  text:
                      '2. For iOS/Android App: Menu > API > API Token (tap on it to copy it to your clipboard).',
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _habiticaUserIdController,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 50, 204, 102)),
                  decoration: const InputDecoration(
                    labelText: 'Habitica User ID',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 50, 204, 102)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 50, 204, 102)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 50, 204, 102)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid Habitica User ID';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _habiticaApiKeyController,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 50, 204, 102)),
                  decoration: const InputDecoration(
                    labelText: 'Habitica API Key',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 50, 204, 102)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 50, 204, 102)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 50, 204, 102)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid Habitica API Key';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                CoreElevatedButton(label: "Save", onPressed: _saveSettings),
                const SizedBox(height: 16.0),
                const CoreText(
                  text: "You can leave this by pressing the back key",
                ),
              ],
            ),
          ),
        )));
  }
}
