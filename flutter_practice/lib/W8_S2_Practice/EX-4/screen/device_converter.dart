import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/device.dart';
import '../model/deviceConverter.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final controller = TextEditingController();
  double convertedAmount = 0;
  Device? selectedDevice = Converter.devices[0];

  
  void updateConversion() {
    final amount = double.tryParse(controller.text)??0;
    setState(() {
      convertedAmount = Converter.convertTo(amount, selectedDevice!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: [
            const Icon(Icons.money, size: 60, color: Colors.white),
            const Text("Converter", style: TextStyle(color: Colors.white, fontSize: 30)),
            const SizedBox(height: 50),
            const Text("Amount in dollars:",style: TextStyle(fontSize: 30)),
            CustomBox(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: InputBorder.none, 
                ),
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton(
              value: selectedDevice,
              hint: const Text("Euro", style: TextStyle(fontSize: 30)),
              items: Converter.devices.map((device) {
                return DropdownMenuItem<Device>(
                  value: device,
                  child: Text(device.name.toUpperCase()),
                );
              }).toList(),
              onChanged: (selectedDevices) {
                setState(() {
                  selectedDevice = selectedDevices;
                });
              },
            ),
            const SizedBox(height: 30),
      
            ElevatedButton(
              onPressed: updateConversion,
              child: const Text("OK"),
            ),
            const SizedBox(height: 30),
            const Text("Amount in selected device:", style: TextStyle(fontSize: 30)),
            CustomBox(
              child: Text(
                convertedAmount.toStringAsFixed(0),
                style: const TextStyle(fontSize: 18,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomBox extends StatelessWidget {
  final Widget child;

  const CustomBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60, 
      padding: const EdgeInsets.symmetric(horizontal: 13), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black, 
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.centerLeft, 
        child: child,
      ),
    );
  }
}
