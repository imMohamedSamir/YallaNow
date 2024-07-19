import 'dart:developer';

import 'package:flutter/material.dart';

class Request {
  final int id;
  final String description;

  Request({required this.id, required this.description});
}

class RequestList extends StatefulWidget {
  const RequestList({super.key});

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  List<Request> requests = [];
  int requestId = 0;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  void addRequest(String description) {
    setState(() {
      requests.add(Request(id: requestId++, description: description));
      _listKey.currentState?.insertItem(requests.length - 1);
    });
  }

  void removeRequest(int id) {
    int index = requests.indexWhere((request) => request.id == id);
    if (index != -1) {
      Request request = requests.removeAt(index);
      _listKey.currentState?.removeItem(index, (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: RequestItem(
            key: ValueKey(request.id),
            request: request,
            onComplete: () {},
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              addRequest('Request ${requests.length + 1}');
            },
          ),
        ],
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: requests.length,
        itemBuilder: (context, index, animation) {
          final request = requests[index];
          return SizeTransition(
            sizeFactor: animation,
            child: RequestItem(
              key: ValueKey(request.id),
              request: request,
              onComplete: () => removeRequest(request.id),
            ),
          );
        },
      ),
    );
  }
}

class RequestItem extends StatefulWidget {
  final Request request;
  final VoidCallback onComplete;

  const RequestItem(
      {super.key, required this.request, required this.onComplete});

  @override
  State<RequestItem> createState() => _RequestItemState();
}

class _RequestItemState extends State<RequestItem>
    with TickerProviderStateMixin {
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onComplete();
        }
      });

    _progressController.forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: widget.key,
      title: Text(widget.request.description),
      subtitle: AnimatedBuilder(
        animation: _progressController,
        builder: (context, child) {
          return LinearProgressIndicator(
            value: _progressController.value,
          );
        },
      ),
    );
  }
}
