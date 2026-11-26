import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/article_model.dart';
import '../../services/api_exception.dart';
import '../../services/article_service.dart';

class ArticleFormPage extends StatefulWidget {
  final ArticleModel? article;

  const ArticleFormPage({super.key, this.article});

  @override
  State<ArticleFormPage> createState() => _ArticleFormPageState();
}

class _ArticleFormPageState extends State<ArticleFormPage> {
  late final TextEditingController _titleC;
  late final TextEditingController _contentC;
  final _service = ArticleService();
  final _picker = ImagePicker();

  XFile? _pickedImage;
  Uint8List? _pickedBytes;
  bool _removeExisting = false;
  bool _loading = false;

  bool get _isEdit => widget.article != null;

  String? get _existingUrl => _removeExisting ? null : widget.article?.imageUrl;

  bool get _hasImage => _pickedBytes != null || _existingUrl != null;

  @override
  void initState() {
    super.initState();
    _titleC = TextEditingController(text: widget.article?.title);
    _contentC = TextEditingController(text: widget.article?.content);
  }

  @override
  void dispose() {
    _titleC.dispose();
    _contentC.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pick(ImageSource source) async {
    try {
      final picked = await _picker.pickImage(
        source: source,
        maxWidth: 1280,
        imageQuality: 80,
      );
      if (picked == null) return;

      final bytes = await picked.readAsBytes();
      if (!mounted) return;

      setState(() {
        _pickedImage = picked;
        _pickedBytes = bytes;
        _removeExisting = false;
      });
    } catch (_) {
      if (mounted) _showMessage('Gagal mengambil foto');
    }
  }

  void _showSourceSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Pilih dari galeri'),
              onTap: () {
                Navigator.pop(context);
                _pick(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Ambil dengan kamera'),
              onTap: () {
                Navigator.pop(context);
                _pick(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _removeImage() {
    setState(() {
      _pickedImage = null;
      _pickedBytes = null;
      _removeExisting = widget.article?.imageUrl != null;
    });
  }

  Future<void> _save() async {
    final title = _titleC.text.trim();
    final content = _contentC.text.trim();

    if (title.isEmpty || content.isEmpty) {
      _showMessage('Judul dan isi wajib diisi');
      return;
    }

    setState(() => _loading = true);
    try {
      if (_isEdit) {
        await _service.update(
          widget.article!.id,
          title: title,
          content: content,
          image: _pickedImage,
          removeImage: _removeExisting,
        );
      } else {
        await _service.create(
          title: title,
          content: content,
          image: _pickedImage,
        );
      }
      if (!mounted) return;
      Navigator.pop(context, true);
    } on ApiException catch (e) {
      if (mounted) _showMessage(e.message);
    } catch (_) {
      if (mounted) _showMessage('Terjadi kesalahan tak terduga');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Widget _buildPreview() {
    Widget content;

    if (_pickedBytes != null) {
      content = Image.memory(_pickedBytes!, fit: BoxFit.cover);
    } else if (_existingUrl != null) {
      content = Image.network(
        _existingUrl!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            const Center(child: Icon(Icons.broken_image_outlined, size: 40)),
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
      );
    } else {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add_photo_alternate_outlined, size: 40),
            SizedBox(height: 8),
            Text('Tambah foto sampul'),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: _loading ? null : _showSourceSheet,
      child: Container(
        height: 180,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: content,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isEdit ? 'Edit Artikel' : 'Tulis Artikel')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPreview(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: _loading ? null : _showSourceSheet,
                  icon: const Icon(Icons.image_outlined),
                  label: Text(_hasImage ? 'Ganti foto' : 'Pilih foto'),
                ),
                if (_hasImage)
                  TextButton.icon(
                    onPressed: _loading ? null : _removeImage,
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Hapus foto'),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _titleC,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _contentC,
              minLines: 6,
              maxLines: 12,
              decoration: const InputDecoration(
                labelText: 'Isi artikel',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loading ? null : _save,
              child: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(_isEdit ? 'Simpan Perubahan' : 'Terbitkan'),
            ),
          ],
        ),
      ),
    );
  }
}
