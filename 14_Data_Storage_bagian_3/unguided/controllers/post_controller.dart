import 'package:get/get.dart';
import '../service/api_service.dart';

class PostController extends GetxController {
  var posts = [].obs;
  var isLoading = false.obs;

  final ApiService _apiService = ApiService();

  void fetchPosts() async {
    try {
      isLoading.value = true;
      await _apiService.fetchPosts();
      posts.value = _apiService.posts;
    } finally {
      isLoading.value = false;
    }
  }

  void createPost() async {
    try {
      isLoading.value = true;
      await _apiService.createPost();
      fetchPosts(); // Refresh data
    } finally {
      isLoading.value = false;
    }
  }

  void updatePost() async {
    try {
      isLoading.value = true;
      await _apiService.updatePost();
      fetchPosts();
    } finally {
      isLoading.value = false;
    }
  }

  void deletePost() async {
    try {
      isLoading.value = true;
      await _apiService.deletePost();
      fetchPosts();
    } finally {
      isLoading.value = false;
    }
  }
}
