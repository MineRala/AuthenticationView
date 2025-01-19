//
//  Color+Ext.swift
//  AuthenticationView
//
//  Created by Mine Rala on 20.01.2025.
//

import SwiftUI

extension Color {
    init(hex: String, alpha: Double = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        // Eğer '#' varsa onu kaldır
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }

        // HEX kodunun uzunluğu 6 (RRGGBB) olmalı
        guard hexSanitized.count == 6 else {
            // Geçersiz HEX kodu durumunda varsayılan siyah renk döndür
            self.init(red: 0, green: 0, blue: 0, opacity: alpha)
            return
        }

        // HEX kodunu RGB bileşenlerine ayır
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        // HEX kodunu RGB'ye çevir
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        // Renk oluştur
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
