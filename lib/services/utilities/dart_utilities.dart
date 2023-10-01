class DartUtilities {
  // Clean Text Utilities

  static String removeConsecutiveSpaces(String text) {
    for (var i = 0; i < text.length; i++) {
      if (text[i] == " ") {
        while (text[i + 1] == " ") {
          text = text.substring(0, i) + "" + text.substring(i + 1);
        }
      }
    }
    return text;
  }

  static String toTitleCase(String text) {
    return text
        .replaceAllMapped(
            RegExp(
                r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
            (Match m) =>
                "${m[0][0].toUpperCase()}${m[0].substring(1).toLowerCase()}")
        .replaceAll(RegExp(r'(_|-)+'), ' ');
  }

  static String fixNamingTerms(String text) {
    text = text.replaceAll(" -", " ");
    text = text.replaceAll(" /", " ");
    text = text.replaceAll("/ ", "/");
    text = text.replaceAll('_', '');
    text = text.replaceAll(',', '.');
    text = toTitleCase(text);
    text = text.replaceAll('gb', 'GB');
    text = text.replaceAll('Gb', 'GB');
    text = text.replaceAll('ram', 'RAM');
    text = text.replaceAll('Ram', 'RAM');
    text = text.replaceAll('Iphone', 'iPhone');
    text = text.replaceAll('IPhone', 'iPhone');
    text = text.replaceAll('Apple ', '');
    text = text.replaceAll('Se', 'SE');
    text = text.replaceAll('Xr', 'XR');
    text = text.replaceAll('Tv', 'TV');
    return text;
  }

  static String cleanText(String text) {
    text = DartUtilities.removeConsecutiveSpaces(text);
    text = DartUtilities.fixNamingTerms(text);
    return text;
  }

  // Retail Price Calculator Utilities

  static int addProfit(int price) {
    int afterProfit;
    if (price <= 100) {
      afterProfit = (price + price * 0.1).round();
    } else if (price <= 200) {
      afterProfit = (price + price * 0.05).round();
    } else if (price <= 300) {
      afterProfit = (price + price * 0.033).round();
    } else if (price <= 600) {
      afterProfit = (price + price * 0.025).round();
    } else if (price <= 1000) {
      afterProfit = (price + price * 0.02).round();
    } else if (price > 1000) {
      afterProfit = (price + price * 0.03).round();
    }
    return afterProfit;
  }

  static int addDeliveryCharge(int price) {
    while (price % 5 != 0) {
      price += 1;
    }
    return price;
  }

  static int calculateFinalPrice(int price) {
    int retailPrice = addProfit(price);
    int finalPrice = addDeliveryCharge(retailPrice);
    return finalPrice;
  }
}

void main() async {
  // Clean Text Testing
  print(DartUtilities.cleanText("A02     3/32GB"));

  // Retail Price Calculator Testing
  print(DartUtilities.calculateFinalPrice(82));
}
