import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? convertCurrencyHardcoded(
  double amount,
  String fromCurrency,
  String toCurrency,
) {
  // Define hardcoded exchange rates relative to USD
  final rates = {
    "USD": 1.0, // US Dollar
    "EUR": 0.917, // Euro
    "JPY": 151.97, // Japanese Yen
    "GBP": 0.77, // British Pound
    "CAD": 1.3888, // Canadian Dollar
    "AUD": 1.514, // Australian Dollar
    "INR": 74.0, // Indian Rupee
    "CNY": 7.098, // Chinese Yuan
    "BRL": 5.76 // Brazilian Real
    // Add more currencies as needed
  };

  // Convert amount to USD first, then to the target currency
  double amountInUSD = amount / rates[fromCurrency]!;
  double convertedAmount = amountInUSD * rates[toCurrency]!;

  return convertedAmount;
}

String updateTravelInfo(LatLng location) {
  // Function to calculate the distance between two points in kilometers
  double calculateDistance(LatLng loc1, LatLng loc2) {
    const earthRadiusKm = 6371.0;
    final dLat = (loc2.latitude - loc1.latitude) * (math.pi / 180);
    final dLon = (loc2.longitude - loc1.longitude) * (math.pi / 180);
    final lat1 = loc1.latitude * (math.pi / 180);
    final lat2 = loc2.latitude * (math.pi / 180);

    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.sin(dLon / 2) *
            math.sin(dLon / 2) *
            math.cos(lat1) *
            math.cos(lat2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadiusKm * c;
  }

  // Predefined locations with travel information
  final locations = {
    'France': LatLng(48.8566, 2.3522),
    'Japan': LatLng(35.6895, 139.6917),
    'Rhode Island': LatLng(41.6355823, -71.207705),
    'United Kingdom': LatLng(51.5074, -0.1278),
    'New York City': LatLng(40.7128, -74.0060),
    'India': LatLng(28.6139, 77.2090),
  };

  final travelInfo = {
    'France': '''
**France Travel Info**
- **Currency**: Euro (EUR)
- **Language**: French
- **Emergency Number**: 112
- **Time Zone**: Central European Time (CET)
- **Tipping Culture**: Service included in bill, extra appreciated
- **Popular Attractions**:
  - Eiffel Tower
  - Louvre Museum
  - Palace of Versailles
''',
    'Japan': '''
**Japan Travel Info**
- **Currency**: Japanese Yen (JPY)
- **Language**: Japanese
- **Emergency Number**: 110 (Police), 119 (Fire/Ambulance)
- **Time Zone**: Japan Standard Time (JST)
- **Tipping Culture**: No tipping, considered rude
- **Popular Attractions**:
  - Mount Fuji
  - Tokyo Skytree
  - Kyoto's Temples
''',
    'Rhode Island': '''
**Rhode Island Travel Info**
- **Currency**: United States Dollar (USD)
- **Language**: English
- **Emergency Number**: 911
- **Time Zone**: Eastern Time Zone (ET)
- **Tipping Culture**: ~15-20%
- **Popular Attractions**:
  - Newport Mansions
  - Providence WaterFire
  - Block Island
''',
    'United Kingdom': '''
**United Kingdom Travel Info**
- **Currency**: Pound Sterling (GBP)
- **Language**: English
- **Emergency Number**: 999
- **Time Zone**: Greenwich Mean Time (GMT)
- **Tipping Culture**: ~10-15% in restaurants, optional otherwise
- **Popular Attractions**:
  - Big Ben
  - Buckingham Palace
  - Tower of London
''',
    'New York City': '''
**New York City Travel Info**
- **Currency**: United States Dollar (USD)
- **Language**: English
- **Emergency Number**: 911
- **Time Zone**: Eastern Time Zone (ET)
- **Tipping Culture**: ~15-20% in restaurants
- **Popular Attractions**:
  - Statue of Liberty
  - Times Square
  - Central Park
''',
    'India': '''
**India Travel Info**
- **Currency**: Indian Rupee (INR)
- **Language**: Hindi, English
- **Emergency Number**: 112
- **Time Zone**: Indian Standard Time (IST)
- **Tipping Culture**: ~10% in restaurants, optional otherwise
- **Popular Attractions**:
  - Taj Mahal
  - Red Fort
  - India Gate
''',
  };

  // Find the closest location within a 500 km radius
  const radiusKm = 500.0;
  for (final entry in locations.entries) {
    final distance = calculateDistance(location, entry.value);
    if (distance <= radiusKm) {
      return travelInfo[entry.key]!;
    }
  }

  return '''
No specific travel information available for this location.
Input Location: ${location.latitude}, ${location.longitude}
''';
}
