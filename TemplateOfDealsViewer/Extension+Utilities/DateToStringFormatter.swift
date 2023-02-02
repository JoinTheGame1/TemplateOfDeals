import Foundation

class DateToStringFormatter {
    
    func toString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
