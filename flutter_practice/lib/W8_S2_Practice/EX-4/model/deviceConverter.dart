import 'device.dart';
class Converter {
  static  List<Device> devices = [
    Device(name: 'Euro', conversionRate: 0.95),
    Device(name: 'Riels', conversionRate: 4049.39),
    Device(name: 'Dong', conversionRate: 25403.02),
  ];

  static double getConversionRate(Device device) {
    return device.conversionRate;
  }

  static double convertTo(double dollarAmount, Device selectedDevice) {
    return dollarAmount * getConversionRate(selectedDevice);
  }
}
