import 'package:flutter/material.dart';

import '../models/note.dart';
import '../services/note_storage.dart';

class EditScreen extends StatefulWidget {
  final Note? note;

  const EditScreen({super.key, this.note});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final NoteStorage _storage = NoteStorage();
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController =
        TextEditingController(text: widget.note?.content ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _saveIfNeeded() async {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty && content.isEmpty) {
      return;
    }

    final now = DateTime.now();
    final existing = widget.note;
    final note = Note(
      id: existing?.id ?? now.microsecondsSinceEpoch.toString(),
      title: title,
      content: content,
      createdAt: existing?.createdAt ?? now,
      updatedAt: now,
    );

    await _storage.upsertNote(note);
  }

  Future<bool> _handleWillPop() async {
    await _saveIfNeeded();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              await _saveIfNeeded();
              if (!mounted) return;
              Navigator.of(context).pop();
            },
          ),
          title:
              Text(widget.note == null ? 'Tạo ghi chú' : 'Chỉnh sửa ghi chú'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Tiêu đề',
                  border: InputBorder.none,
                  filled: false,
                ),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                    hintText: 'Nội dung ghi chú...',
                    border: InputBorder.none,
                    filled: false,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
