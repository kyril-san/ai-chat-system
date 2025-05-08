class ChatModel {
  final String id;
  final String user;
  final String message;

  const ChatModel({
    required this.id,
    required this.user,
    required this.message,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      user: json['output']?[0]?['role'] ?? 'Unknown',
      message: json['output']?[0]?['content']?[0]?['text'] ?? 'No response',
    );
  }
}

/* Used to simulate how the Ui would look like to the user
List<ChatModel> tempchatList = [
  ChatModel(id: '1', user: 'user', message: 'I would like to report a bug.'),
  ChatModel(
    id: '2',
    user: 'user',
    message: 'Hello, I need help with my account.',
  ),
  ChatModel(id: '3', user: 'user', message: 'Thanks for the support.'),
  ChatModel(
    id: '4',
    user: 'system',
    message:
        'System initialized successfully. Double checking how long I can get the text to go and I jsut want to ensure full flexibility with the app',
  ),
  ChatModel(id: '5', user: 'user', message: 'Thanks for the support.'),
  ChatModel(id: '6', user: 'system', message: 'Session timeout occurred.'),
  ChatModel(
    id: '7',
    user: 'user',
    message: 'Hello, I need help with my account.',
  ),
  ChatModel(
    id: '8',
    user: 'system',
    message: 'System initialized successfully.',
  ),
  ChatModel(
    id: '9',
    user: 'system',
    message: 'Bug report submitted successfully.',
  ),
  ChatModel(
    id: '10',
    user: 'system',
    message: 'That feature is currently unavailable.',
  ),
  ChatModel(id: '11', user: 'user', message: 'Thanks for the support.'),
  ChatModel(id: '12', user: 'user', message: 'Perfect, have a great day!'),
  ChatModel(
    id: '13',
    user: 'system',
    message: 'Bug report submitted successfully.',
  ),
  ChatModel(id: '14', user: 'system', message: 'Session timeout occurred.'),
  ChatModel(id: '15', user: 'system', message: 'Dark mode has been enabled.'),
  ChatModel(id: '16', user: 'system', message: 'Session timeout occurred.'),
  ChatModel(id: '17', user: 'system', message: 'Session timeout occurred.'),
  ChatModel(id: '18', user: 'user', message: 'Perfect, have a great day!'),
  ChatModel(id: '19', user: 'user', message: 'I would like to report a bug.'),
  ChatModel(id: '20', user: 'system', message: 'New user session started.'),
];
*/
