# Mentor AI Productivity Partner
### "Distraction is like a parasite to the mind. If you don’t kill distraction, distraction will kill your dreams." -Some Giga Chad

## Why are we doing this?
We have very little time on this planet and we have lots of ideas to create and people to speak. We should not waste our precious time on scrolling reels which gives us dopamine a fake illusion of happiness. This project is aimed to create a world where we can grow enjoy and experience this life

## Downloads

[Android](https://github.com/prasannan-robots/Bablo/releases/download/v2.1.0/app-arm64-v8a-release.apk)

## How this works?
We get data from users and send them through ai model currently we use gpt3.5 to process the information and give you suggestions and criticism to make you grow. Do check the code

### Working Flow

- Users can write about themselves and their beliefs in the journal section.
- Users can enter their interests.
- Mentor analyzes your work and gives suggestions and recommendations to imporve your life
- Mentor fetches recommended YouTube videos based on the user's interests and journal.
- Recommended videos are displayed with titles and an embedded YouTube player.
- The app uses OpenAI's GPT-3.5 Turbo language model for AI interactions.

This is an open-source Flutter applicatio.n The app understands user goals, beliefs, and interests to offer personalized social media posts. The code provided includes both the Flutter front-end and Flask server back-end.

# Screenshots
### Home

![mentor-v2 1 0-Screenshot 2024-01-20 222539](https://github.com/Bablo-AD/Mentor/assets/64462247/9c521313-3b65-43a8-89d4-6c789aa29cbd)


### Daily journals

![Journal Page](https://github.com/Bablo-AD/Mentor/assets/64462247/16d15f5c-6b13-44bc-a3f7-e98b603b59fb)

### Ask quesitons and connect

![Chat Page](https://github.com/Bablo-AD/Mentor/assets/64462247/16d15f5c-6b13-44bc-a3f7-e98b603b59fb)


## Features

- User can write about themselves and their beliefs in the journal section.
- User can enter their interests.
- The app fetches recommended YouTube videos based on the user's interests and journal.
- Recommended videos are displayed with titles and an embedded YouTube player.
- The app uses OpenAI's GPT-3.5 Turbo language model for AI interactions.

## Prerequisites for devs

To run this application, you need the following:

- Flutter SDK installed
- Android Emulator or iOS Simulator
- Python with Flask installed
- YouTube Data API key
- OpenAI API key

## Getting Started

1. Clone the repository:

```shell
git clone <repository_url>
```

2. Set up the Flutter project by running the following command in the project directory:

```shell
flutter pub get
```
### Check [mentor-server](https://github.com/bablo-AD/Mentor-server) for python code

3. Configure the YouTube Data API key and OpenAI API key:
   - Replace the `DEVELOPER_KEY` variable in the `recommendation_system.py` file with your YouTube Data API key.
   - Set your OpenAI API key as an environment variable with the name `OPENAI_API_KEY`.

4. Start the Flask server by running the following command in the project directory:

```shell
python main.py
```

5. Launch the Flutter application on an Android emulator or iOS simulator:

```shell
flutter run
```

## Usage

1. On the home screen, the user can write about themselves and their beliefs in the journal section by tapping on it.
2. Enter your interests in the provided text field and tap the search button (magnifying glass icon) to fetch recommended YouTube videos.
3. Recommended videos will be displayed with titles and an embedded YouTube player.
4. Tap on a video to open it in the YouTube app or browser.
5. The recommendation section shows a text summary generated by the AI assistant.

## How It Works

The application uses Flutter for the front-end and Flask for the back-end server. The Flutter app sends requests to the Flask server, which interacts with the YouTube Data API and OpenAI's GPT-3.5 Turbo language model.

The Flutter code consists of two main screens:
- **HomePage**: Displays the journal section and the interest input field. It sends requests to fetch recommended YouTube videos.
- **JournalPage**: Allows the user to write in the journal section.

The Flask server code includes two API endpoints:
- `/recommendation_system/youtube_recommend`: Handles requests for fetching YouTube video recommendations. It takes the user's interests and journal as input, interacts with the recommendation system, and returns the recommended videos.
- `/recommendation_system/tools/journal2short_journal`: Converts the user's journal into a short journal using OpenAI's GPT-3.5 Turbo language model.

The recommendation system module (`recommendation_system.py`) interacts with the YouTube Data API and OpenAI's GPT-3.5 Turbo language model. It performs the following steps:
1. Converts the user's journal into a short journal using OpenAI's language model.
2. Uses the short journal and user's interests to query the YouTube Data API for videos.
3. Filters and ranks the queried videos using AI-powered interaction with OpenAI's language model.
4. Returns the recommended videos along with a text summary generated by the AI assistant.

Please ensure you have the necessary API keys and dependencies set up for the application to work correctly.

Feel free to explore and modify the code to enhance the functionality of the AI social media assistant app!
