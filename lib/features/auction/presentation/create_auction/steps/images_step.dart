import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/theme/app_theme.dart';
import '../create_auction_provider.dart';

class ImagesStep extends ConsumerWidget {
  const ImagesStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createAuctionProvider);
    final notifier = ref.read(createAuctionProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upload Images',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Text(
            'Add up to 10 images of your item',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textMuted,
                ),
          ),
          const SizedBox(height: AppTheme.spacingXl),
          
          // Upload Button
          if (state.localImages.length < 10)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _pickImages(context, ref),
                icon: const Icon(Icons.add_photo_alternate),
                label: Text(
                  state.localImages.isEmpty
                      ? 'Add Photos'
                      : 'Add More Photos (${state.localImages.length}/10)',
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(AppTheme.spacingLg),
                ),
              ),
            ),
          
          if (state.imagesError != null)
            Padding(
              padding: const EdgeInsets.only(top: AppTheme.spacingSm),
              child: Text(
                state.imagesError!,
                style: const TextStyle(
                  color: AppTheme.errorColor,
                  fontSize: 12,
                ),
              ),
            ),
          
          const SizedBox(height: AppTheme.spacingLg),
          
          // Image Grid
          if (state.localImages.isNotEmpty)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: AppTheme.spacingSm,
                mainAxisSpacing: AppTheme.spacingSm,
                childAspectRatio: 1,
              ),
              itemCount: state.localImages.length,
              itemBuilder: (context, index) {
                final image = state.localImages[index];
                final isPrimary = index == 0;
                
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                      child: Image.file(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    
                    // Primary Badge
                    if (isPrimary)
                      Positioned(
                        top: 4,
                        left: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                          ),
                          child: const Text(
                            'PRIMARY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    
                    // Remove Button
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () => notifier.removeImage(index),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          
          if (state.localImages.isNotEmpty) ...[
            const SizedBox(height: AppTheme.spacingMd),
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              decoration: BoxDecoration(
                color: AppTheme.infoColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                border: Border.all(color: AppTheme.infoColor.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppTheme.infoColor,
                    size: 20,
                  ),
                  const SizedBox(width: AppTheme.spacingSm),
                  Expanded(
                    child: Text(
                      'The first image will be used as the primary image',
                      style: TextStyle(
                        color: AppTheme.infoColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _pickImages(BuildContext context, WidgetRef ref) async {
    final ImagePicker picker = ImagePicker();
    final notifier = ref.read(createAuctionProvider.notifier);
    
    final List<XFile> images = await picker.pickMultiImage();
    
    if (images.isNotEmpty) {
      final files = images.map((xFile) => File(xFile.path)).toList();
      notifier.addImages(files);
    }
  }
}
