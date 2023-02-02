import Foundation

class MyDateFormatter {
    
    static func toString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
}
