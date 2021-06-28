public enum Color {
    case hex(String)
    case named(String)
    case rgb(red: Int, green: Int, blue: Int)
    case rgba(red: Int, green: Int, blue: Int, alpha: Int)
    case hsl(hue: Int, saturation: Int, lightness: Int)
    case hsla(hue: Int, saturation: Int, lightness: Int, alpha: Int)
}

extension Color: CustomStringConvertible {
    public var description: String {
        switch self {
        case .hex(let hexString):
            if hexString.starts(with: "#") {
                return hexString
            }
            return "#\(hexString)"
        case .named(let name):
            return name
        case .rgb(red: let red, green: let green, blue: let blue):
            let red = min(255, max(0, red))
            let green = min(255, max(0, green))
            let blue = min(255, max(0, blue))
            return "rgb(\(red), \(green), \(blue))"
        case .rgba(red: let red, green: let green, blue: let blue, alpha: let alpha):
            let red = min(255, max(0, red))
            let green = min(255, max(0, green))
            let blue = min(255, max(0, blue))
            let alpha = min(100, max(0, alpha))
            return "rgba(\(red), \(green), \(blue), \(alpha))"
        case .hsl(hue: let hue, saturation: let saturation, lightness: let lightness):
            let hue = min(360, max(0, hue))
            let saturation = min(100, max(0, saturation))
            let lightness = min(100, max(0, lightness))
            return "hsl(\(hue), \(saturation)%, \(lightness)%)"
        case .hsla(hue: let hue, saturation: let saturation, lightness: let lightness, alpha: let alpha):
            let hue = min(360, max(0, hue))
            let saturation = min(100, max(0, saturation))
            let lightness = min(100, max(0, lightness))
            let alpha = min(100, max(0, alpha))
            return "hsla(\(hue), \(saturation)%, \(lightness)%, \(alpha))"
        }
    }
}
