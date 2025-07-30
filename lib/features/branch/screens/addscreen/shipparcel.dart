import 'package:flutter/material.dart';
import 'package:stigma/utils/constants/colors.dart';


class ShipParcelScreen extends StatefulWidget {
  const ShipParcelScreen({super.key});

  @override
  State<ShipParcelScreen> createState() => _ShipParcelScreenState();
}

class _ShipParcelScreenState extends State<ShipParcelScreen> {
  final _formKey = GlobalKey<FormState>();

  final senderController = TextEditingController();
  final receiverController = TextEditingController();
  final weightController = TextEditingController();

  String deliveryType = 'Standard';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.borderSecondary,
        elevation: 2,
        title: const Text(
          'Nearby Courier Booking',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Sender Details'),
              _buildTextField(
                controller: senderController,
                label: 'Sender Name & Address',
                hintText: 'Enter sender information',
                validatorMsg: 'Please enter sender details',
              ),

              const SizedBox(height: 24),
              _buildSectionTitle('Receiver Details'),
              _buildTextField(
                controller: receiverController,
                label: 'Receiver Name & Address',
                hintText: 'Enter receiver information',
                validatorMsg: 'Please enter receiver details',
              ),

              const SizedBox(height: 24),
              _buildSectionTitle('Package Weight'),
              _buildTextField(
                controller: weightController,
                label: 'Weight (kg)',
                hintText: 'e.g. 2.5',
                validatorMsg: 'Please enter weight',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 24),
              _buildSectionTitle('Delivery Type'),
              _buildDeliveryDropdown(),

              const SizedBox(height: 32),
              _buildSubmitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16.5,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  /// Reusable TextField Widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required String validatorMsg,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (value) => value!.trim().isEmpty ? validatorMsg : null,
      ),
    );
  }

  /// Dropdown for Delivery Type
  Widget _buildDeliveryDropdown() {
    return DropdownButtonFormField<String>(
      value: deliveryType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: const [
        DropdownMenuItem(value: 'Standard', child: Text('Standard Delivery')),
        DropdownMenuItem(value: 'Express', child: Text('Express Delivery')),
        DropdownMenuItem(value: 'Same-Day', child: Text('Same-Day Delivery')),
      ],
      onChanged: (value) => setState(() => deliveryType = value!),
    );
  }

  /// Submit Button
  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Parcel booked successfully.'),
                backgroundColor: Colors.green,
              ),
            );
            // You can trigger API here
          }
        },
        icon: const Icon(Icons.local_shipping_rounded, color: Colors.white),
        label: const Text('Confirm & Book Parcel'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.borderSecondary,
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    senderController.dispose();
    receiverController.dispose();
    weightController.dispose();
    super.dispose();
  }
}
