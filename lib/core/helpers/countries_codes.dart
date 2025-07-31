const countryToPhoneCode = {
  "AE": "+971", // United Arab Emirates
  "BH": "+973", // Bahrain
  "DZ": "+213", // Algeria
  "EG": "+20", // Egypt
  "IQ": "+964", // Iraq
  "JO": "+962", // Jordan
  "KW": "+965", // Kuwait
  "LB": "+961", // Lebanon
  "LY": "+218", // Libya
  "MA": "+212", // Morocco
  "MR": "+222", // Mauritania
  "OM": "+968", // Oman
  "PS": "+970", // Palestine
  "QA": "+974", // Qatar
  "SA": "+966", // Saudi Arabia
  "SD": "+249", // Sudan
  "SO": "+252", // Somalia
  "SY": "+963", // Syria
  "TN": "+216", // Tunisia
  "YE": "+967", // Yemen
  "DJ": "+253", // Djibouti
  "KM": "+269", // Comoros
  "US": "+1", // United States
  "CN": "+86", // China
  "JP": "+81", // Japan
  "DE": "+49", // Germany
  "IN": "+91", // India
  "GB": "+44", // United Kingdom
  "FR": "+33", // France
  "IT": "+39", // Italy
  "BR": "+55", // Brazil
  "RU": "+7", // Russia
  "KR": "+82", // South Korea
  "AU": "+61", // Australia
  "ES": "+34", // Spain
  "MX": "+52", // Mexico
  "ID": "+62", // Indonesia
  "NL": "+31", // Netherlands
  "TR": "+90", // Turkey
  "CH": "+41", // Switzerland
  "SE": "+46", // Sweden
  "PL": "+48", // Poland
  "BE": "+32", // Belgium
  "NO": "+47", // Norway
  "AT": "+43", // Austria
  "IL": "+972", // Israel
  "DK": "+45", // Denmark
  "FI": "+358", // Finland
  "SG": "+65", // Singapore
  "HK": "+852", // Hong Kong
  "TW": "+886", // Taiwan
  "TH": "+66", // Thailand
  "MY": "+60", // Malaysia
  "PH": "+63", // Philippines
  "VN": "+84", // Vietnam
  "ZA": "+27", // South Africa
  "NG": "+234", // Nigeria
  "AR": "+54", // Argentina
  "CL": "+56", // Chile
  "CO": "+57", // Colombia
  "PE": "+51", // Peru
  "VE": "+58", // Venezuela
  "UA": "+380", // Ukraine
  "PK": "+92", // Pakistan
  "BD": "+880", // Bangladesh
  "IR": "+98", // Iran
  "CZ": "+420", // Czech Republic
  "PT": "+351", // Portugal
  "NZ": "+64", // New Zealand
  "GR": "+30", // Greece
  "HU": "+36", // Hungary
};

String countryCodeToEmoji(String countryCode) {
  const int base = 0x1F1E6;
  return countryCode
      .toUpperCase()
      .codeUnits
      .map((c) => String.fromCharCode(base + c - 65))
      .join();
}
