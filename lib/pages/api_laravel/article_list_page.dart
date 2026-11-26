import 'package:example/services/api_exception.dart';
import 'package:flutter/material.dart';

import '../../models/article_model.dart';
import '../../services/article_service.dart';
import '../../services/auth_service.dart';
import 'article_form_page.dart';
import 'login_page.dart';

class ArticleListPage extends StatefulWidget {
  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  final _auth = AuthService();
  final _articleService = ArticleService();
  late Future<List<ArticleModel>> _futureArticles;

  @override
  void initState() {
    super.initState();
    _futureArticles = _articleService.getAll();
  }

  void _reload() {
    setState(() {
      _futureArticles = _articleService.getAll();
    });
  }

  Future<void> _refresh() async {
    _reload();
    try {
      await _futureArticles;
    } catch (_) {
      // error sudah ditampilkan oleh FutureBuilder
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _openForm([ArticleModel? article]) async {
    final changed = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => ArticleFormPage(article: article)),
    );
    if (changed == true && mounted) _reload();
  }

  Future<void> _delete(ArticleModel article) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Hapus artikel?'),
        content: Text('"${article.title}" akan dihapus permanen.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      await _articleService.delete(article.id);
      if (!mounted) return;
      _showMessage('Artikel dihapus');
      _reload();
    } on ApiException catch (e) {
      if (mounted) _showMessage(e.message);
    } catch (_) {
      if (mounted) _showMessage('Terjadi kesalahan tak terduga');
    }
  }

  Future<void> _logout() async {
    await _auth.logout();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (_) => false,
    );
  }

  Widget _buildThumbnail(String? url) {
    const size = 56.0;

    if (url == null) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.article_outlined),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: size,
          height: size,
          color: Colors.grey.shade200,
          child: const Icon(Icons.broken_image_outlined),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artikel Saya'),
        actions: [
          IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openForm(),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<ArticleModel>>(
        future: _futureArticles,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snap.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(snap.error.toString(), textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _reload,
                      child: const Text('Coba lagi'),
                    ),
                    TextButton(
                      onPressed: _logout,
                      child: const Text('Kembali ke Login'),
                    ),
                  ],
                ),
              ),
            );
          }

          final articles = snap.data!;

          return RefreshIndicator(
            onRefresh: _refresh,
            child: articles.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(
                        height: 300,
                        child: Center(
                          child: Text(
                            'Belum ada artikel. Tekan + untuk menulis.',
                          ),
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: articles.length,
                    itemBuilder: (context, i) {
                      final a = articles[i];
                      return Card(
                        child: ListTile(
                          leading: _buildThumbnail(a.imageUrl),
                          title: Text(a.title),
                          subtitle: Text(
                            a.content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () => _openForm(a),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => _delete(a),
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
