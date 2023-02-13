//
//  String+Extension.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 10.02.2023.
//

import Foundation

enum DateFormats {
    
    case publishedBackendData   //"2023-01-19"
    case publishedData          // Jan 19, 2023
    case updateBackendData      // "2023-01-31 18:20:25"
    case updateData             // Jan 31, 2023
    
    var value: String {
        switch self {
        case .publishedBackendData: return "yyyy-MM-dd"
        case .publishedData: return "MMM d, yyyy"
        case .updateBackendData: return "yyyy-MM-dd HH:mm:ss"
        case .updateData: return "MMM d, yyyy"
        }
    }
}

extension String {
    
    func convertDateString(fromDateFormat: String, toDateFormat: String, local: String = "en_US") -> String? {
        return convert(dateString: self, fromDateFormat: fromDateFormat, toDateFormat: toDateFormat, local: local)
    }
    
    func convert(dateString: String, fromDateFormat: String, toDateFormat: String, local: String) -> String? {
        let fromDateFormatter = DateFormatter()
        fromDateFormatter.dateFormat = fromDateFormat
        fromDateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        if let fromDateObject = fromDateFormatter.date(from: dateString) {
            let toDateFormatter = DateFormatter()
            toDateFormatter.dateFormat = toDateFormat
            toDateFormatter.calendar = Calendar.current
            toDateFormatter.timeZone = TimeZone.current
            toDateFormatter.locale = Locale(identifier: local)
            let newDateString = toDateFormatter.string(from: fromDateObject)
            return newDateString
        }

        return nil
    }
}
