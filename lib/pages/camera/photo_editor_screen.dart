import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/photo_model.dart';

class PhotoEditorScreen extends ConsumerStatefulWidget {
  final String imagePath;

  const PhotoEditorScreen({super.key, required this.imagePath});

  @override
  ConsumerState<PhotoEditorScreen> createState() => _PhotoEditorScreenState();
}

class _PhotoEditorScreenState extends ConsumerState<PhotoEditorScreen> {
  FilterType _selectedFilter = FilterType.none;
  bool _isProcessing = false;

  final List<FilterType> _availableFilters = [FilterType.none, FilterType.sepia, FilterType.blackAndWhite, FilterType.vintage, FilterType.vibrant, FilterType.cool, FilterType.warm, FilterType.dramatic, FilterType.soft];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main content
          Column(
            children: [
              // Image preview section
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 60, left: 16, right: 16, bottom: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        // Original image
                        Positioned.fill(child: Image.file(File(widget.imagePath), fit: BoxFit.cover)),

                        // Filter overlay
                        if (_selectedFilter != FilterType.none)
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(color: _getFilterColor(), backgroundBlendMode: _getBlendMode()),
                            ),
                          ),

                        // Processing overlay
                        if (_isProcessing)
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 40, height: 40, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white), strokeWidth: 3)),
                                    SizedBox(height: 16),
                                    Text(
                                      'Processing...',
                                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              // Filter selection section
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const Icon(Icons.tune_rounded, color: Colors.white, size: 20),
                            const SizedBox(width: 8),
                            const Text(
                              'Filters',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(_selectedFilter.displayName, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14)),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Filter list
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: _availableFilters.length,
                          itemBuilder: (context, index) {
                            final filter = _availableFilters[index];
                            final isSelected = filter == _selectedFilter;

                            return _buildFilterItem(filter, isSelected);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Custom app bar
          _buildCustomAppBar(context),
        ],
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).padding.top + 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0.8), Colors.transparent]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Back button
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 20),
                  ),
                ),

                const Spacer(),

                // Title
                const Text(
                  'Edit Photo',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const Spacer(),

                // Next button
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(color: _isProcessing ? Colors.grey.withOpacity(0.5) : Colors.blue, borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: _isProcessing ? null : _saveAndContinue,
                    style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                    child: Text(
                      'Next',
                      style: TextStyle(color: _isProcessing ? Colors.grey : Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterItem(FilterType filter, bool isSelected) {
    return GestureDetector(
      onTap: () => _selectFilter(filter),
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            // Filter preview
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: isSelected ? Colors.white : Colors.transparent, width: 2),
                boxShadow: isSelected ? [BoxShadow(color: Colors.white.withOpacity(0.3), blurRadius: 8, spreadRadius: 1)] : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image.file(File(widget.imagePath), fit: BoxFit.cover, width: 64, height: 64),
                    if (filter != FilterType.none)
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(color: _getFilterColor(filter), backgroundBlendMode: _getBlendMode(filter)),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Filter name
            Text(
              filter.displayName,
              style: TextStyle(color: isSelected ? Colors.white : Colors.white.withOpacity(0.7), fontSize: 12, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _selectFilter(FilterType filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  Future<void> _saveAndContinue() async {
    setState(() {
      _isProcessing = true;
    });

    try {
      // Simulate processing time
      await Future.delayed(const Duration(seconds: 2));

      // In a real implementation, you would apply the filter to the image
      // and save it to a new file

      if (mounted) {
        // Navigate to NFT minting screen or back to home
        Navigator.of(context).pop({'imagePath': widget.imagePath, 'filter': _selectedFilter});
      }
    } catch (e) {
      _showError('Failed to process image: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
    }
  }

  Color? _getFilterColor([FilterType? filter]) {
    final filterType = filter ?? _selectedFilter;
    switch (filterType) {
      case FilterType.sepia:
        return Colors.brown.withAlpha(30);
      case FilterType.blackAndWhite:
        return Colors.grey.withAlpha(80);
      case FilterType.vintage:
        return Colors.orange.withAlpha(20);
      case FilterType.vibrant:
        return Colors.purple.withAlpha(10);
      case FilterType.cool:
        return Colors.blue.withAlpha(20);
      case FilterType.warm:
        return Colors.orange.withAlpha(20);
      case FilterType.dramatic:
        return Colors.black.withAlpha(30);
      case FilterType.soft:
        return Colors.white.withAlpha(10);
      default:
        return null;
    }
  }

  BlendMode? _getBlendMode([FilterType? filter]) {
    final filterType = filter ?? _selectedFilter;
    switch (filterType) {
      case FilterType.sepia:
        return BlendMode.multiply;
      case FilterType.blackAndWhite:
        return BlendMode.saturation;
      case FilterType.vintage:
        return BlendMode.overlay;
      case FilterType.vibrant:
        return BlendMode.screen;
      case FilterType.cool:
        return BlendMode.overlay;
      case FilterType.warm:
        return BlendMode.overlay;
      case FilterType.dramatic:
        return BlendMode.multiply;
      case FilterType.soft:
        return BlendMode.screen;
      default:
        return null;
    }
  }
}
