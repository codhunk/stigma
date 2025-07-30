import 'package:flutter/material.dart';

class ParcelCalculator extends StatefulWidget {
  @override
  _ParcelCalculatorState createState() => _ParcelCalculatorState();
}

class _ParcelCalculatorState extends State<ParcelCalculator> {
  // Sample data for Countries, States, and Districts
  final Map<String, List<String>> statesByCountry = {
    "India": ["Uttar Pradesh", "Maharashtra", "Karnataka"],
    "USA": ["California", "Texas", "Florida"],
  };

  final Map<String, List<String>> districtsByState = {
    "Uttar Pradesh": ["Noida", "Lucknow", "Varanasi"],
    "Maharashtra": ["Mumbai", "Pune", "Nagpur"],
    "Karnataka": ["Bangalore", "Mysore", "Mangalore"],
    "California": ["Los Angeles", "San Francisco", "San Diego"],
    "Texas": ["Houston", "Austin", "Dallas"],
    "Florida": ["Miami", "Orlando", "Tampa"],
  };

  // Sample data for Book Districts (You can add more logic as per your requirements)
  final Map<String, List<String>> bookDistrictsByDistrict = {
    "Noida": ["Sector 62", "Sector 50", "Sector 18"],
    "Mumbai": ["Bandra", "Andheri", "Dadar"],
    "Bangalore": ["Koramangala", "Indiranagar", "Whitefield"],
    "Los Angeles": ["Hollywood", "Santa Monica", "Downtown"],
    "Houston": ["Downtown", "Midtown", "Sugar Land"],
  };

  String? selectedCountry;
  String? selectedState;
  String? selectedDistrict;
  String? selectedBookDistrict;

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _widthController = TextEditingController();

  double _calculatedAmount = 0;

  // Function to calculate the parcel amount
  void _calculateParcelAmount() {
    final weight = double.tryParse(_weightController.text) ?? 0;
    final height = double.tryParse(_heightController.text) ?? 0;
    final width = double.tryParse(_widthController.text) ?? 0;

    if (weight > 0 &&
        height > 0 &&
        width > 0 &&
        selectedCountry != null &&
        selectedState != null &&
        selectedDistrict != null &&
        selectedBookDistrict != null) {
      // Basic formula for calculation (you can adjust it as needed)
      _calculatedAmount = (weight * 2) + (height * width * .4);
      setState(() {});

      // Show the calculated amount in a dialog
      _showCalculatedAmountDialog();
    } else {
      // Display a message if any field is invalid
      _calculatedAmount = 0;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter valid details for all fields"),
          backgroundColor: Color(0xff800020),
        ),
      );
    }
  }

  void _showCalculatedAmountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xfff9f9f9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 30),
              SizedBox(width: 10),
              Text(
                'Calculation Successful',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // color: Color(0xff800020),
                  color: Colors.green,
                ),
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'The calculated amount for your parcel is:',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  '₹${_calculatedAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff800020),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff800020),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Parcel Amount Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff800020),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 30),
            Text(
              'Select Country, State, District, and Book District',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff800020).withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Country Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Country',
                labelStyle: TextStyle(
                  color: Color(0xff800020).withOpacity(0.8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              value: selectedCountry,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountry = newValue;
                  selectedState = null; // Reset state and district
                  selectedDistrict = null;
                  selectedBookDistrict = null; // Reset book district
                });
              },
              items:
                  statesByCountry.keys.map((String country) {
                    return DropdownMenuItem<String>(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
            ),

            SizedBox(height: 20),

            // State Dropdown
            if (selectedCountry != null)
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'State',
                  labelStyle: TextStyle(
                    color: Color(0xff800020).withOpacity(0.8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: selectedState,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedState = newValue;
                    selectedDistrict = null; // Reset district
                    selectedBookDistrict = null; // Reset book district
                  });
                },
                items:
                    selectedCountry != null
                        ? statesByCountry[selectedCountry]!.map((String state) {
                          return DropdownMenuItem<String>(
                            value: state,
                            child: Text(state),
                          );
                        }).toList()
                        : [],
              ),

            SizedBox(height: 20),

            // District Dropdown
            if (selectedState != null)
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'District',
                  labelStyle: TextStyle(
                    color: Color(0xff800020).withOpacity(0.8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: selectedDistrict,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDistrict = newValue;
                    selectedBookDistrict = null; // Reset book district
                  });
                },
                items:
                    selectedState != null
                        ? districtsByState[selectedState]!.map((
                          String district,
                        ) {
                          return DropdownMenuItem<String>(
                            value: district,
                            child: Text(district),
                          );
                        }).toList()
                        : [],
              ),

            SizedBox(height: 20),

            // Book District Dropdown
            if (selectedDistrict != null)
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Book District',
                  labelStyle: TextStyle(
                    color: Color(0xff800020).withOpacity(0.8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: selectedBookDistrict,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBookDistrict = newValue;
                  });
                },
                items:
                    selectedDistrict != null
                        ? bookDistrictsByDistrict[selectedDistrict]!.map((
                          String bookDistrict,
                        ) {
                          return DropdownMenuItem<String>(
                            value: bookDistrict,
                            child: Text(bookDistrict),
                          );
                        }).toList()
                        : [],
              ),

            SizedBox(height: 20),

            // Weight, Height, Width Textfields
            _buildInputField('Weight (kg)', _weightController),
            _buildInputField('Height (cm)', _heightController),
            _buildInputField('Width (cm)', _widthController),
            SizedBox(height: 20),

            // Calculate Button Section
            ElevatedButton(
              onPressed: _calculateParcelAmount,
              child: Text(
                'Calculate Amount',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff800020),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            // SizedBox(height: 20),

            // // Result Section
            // Text(
            //   'Calculated Amount: ₹${_calculatedAmount.toStringAsFixed(2)}',
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black87,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }

  // Helper method to build input fields
  Widget _buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Color(0xff800020)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xff800020), width: 2),
          ),
        ),
        style: TextStyle(fontSize: 18, color: Colors.black87),
      ),
    );
  }
}
