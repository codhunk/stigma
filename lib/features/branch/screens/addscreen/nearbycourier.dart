import 'package:flutter/material.dart';
import 'package:stigma/utils/constants/colors.dart';

class NearByCourierScreen extends StatelessWidget {
  const NearByCourierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController locationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nearby Couriers',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white),
        ),
        backgroundColor: AppColors.borderSecondary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            // Branding
            Row(
              children: const [
                Icon(
                  Icons.local_shipping,
                  color: AppColors.borderSecondary,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  'ApnaParcel Logistics',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.borderSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Input Field
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                hintText: 'Enter your location or pin code',
                prefixIcon: const Icon(Icons.location_on),
                prefixIconColor: AppColors.borderSecondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Search Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.search, color: AppColors.textWhite),
                label: const Text('Find Nearby Couriers'),
                onPressed: () {
                  // TODO: Add API integration or map logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.borderSecondary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Nearby Couriers (Mock List)
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.store,
                        color: AppColors.borderSecondary,
                      ),
                      title: Text('Courier Partner ${index + 1}'),
                      subtitle: Text('Distance: ${1.5 + index} km'),
                      trailing: const Icon(
                        Icons.directions,
                        color: AppColors.borderSecondary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
