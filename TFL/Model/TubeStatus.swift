import Foundation
import SwiftUI

struct TubeStatus: Codable, Identifiable, Equatable {
    var id: String
    var name: String
    var lineStatuses: [LineStatus]
    var firstLineStatus: LineStatus? {
        lineStatuses.first
    }
    var tubeColor: Color {
        mapColor(with: name)
    }

    private func mapColor(with tubeName: String) -> Color {
        switch tubeName {
            case "Bakerloo": return Color(red: 136/255, green: 78/255, blue: 41/255)
            case "Central":  return Color(red: 218/255, green: 39/255, blue: 41/255)
            case "Circle": return Color(red: 254/255, green: 205/255, blue: 47/255)
            case "District": return Color(red: 12/255, green: 113/255, blue: 45/255)
            case "Hammersmith & City": return Color(red: 214/255, green: 154/255, blue: 175/255)
            case "Jubilee": return Color(red: 106/255, green: 114/255, blue: 120/255)
            case "Metropolitan": return Color(red: 116/255, green: 21/255, blue: 86/255)
            case "Northern": return Color.black
            case "Piccadilly": return Color(red: 5/255, green: 35/255, blue: 165/255)
            case "Victoria": return Color(red: 26/255, green: 161/255, blue: 224/255)
            case "Waterloo & City": return Color(red: 122/255, green: 208/255, blue: 189/255)
            default: return Color.random
        }
    }
}

struct LineStatus: Codable, Identifiable, Equatable {
    var id: Int
    var statusSeverityDescription: String
}
