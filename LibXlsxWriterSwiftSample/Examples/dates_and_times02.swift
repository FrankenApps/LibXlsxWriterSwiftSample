//
//  dates_and_times02.swift
//  LibXlsxWriterSwiftSample
//

import Foundation
import xlsxwriter

class DatesAndTimes02{
    func generate() -> URL {
        //A number to display as a date.
        var datetime = lxw_datetime(year: 2013, month: 2, day: 28, hour: 12, min: 0, sec: 0.0)
        
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        let fileURL = documentDirectory.appendingPathComponent("date_and_times02.xlsx")
        
        let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
        let worksheet = workbook_add_worksheet(workbook, nil)

        //Add a format with date formatting.
        let format = workbook_add_format(workbook)
        format_set_num_format(format, "mmm d yyyy hh:mm AM/PM")
        //Widen the first column to make the text clearer.
        worksheet_set_column(worksheet, 0, 0, 20, nil)
        //Write the datetime without formatting.
        worksheet_write_datetime(worksheet, 0, 0, &datetime, nil)  // 41333.5
        //Write the datetime with formatting.
        worksheet_write_datetime(worksheet, 1, 0, &datetime, format)  // Feb 28 2013 12:00 PM

        workbook_close(workbook)
        
        return fileURL
    }
}
