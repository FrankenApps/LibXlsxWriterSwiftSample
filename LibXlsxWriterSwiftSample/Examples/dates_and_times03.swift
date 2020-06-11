//
//  dates_and_times03.swift
//  LibXlsxWriterSwiftSample
//

import Foundation
import xlsxwriter

class DatesAndTimes03{
    func generate() -> URL {
        //A number to display as a date.
        var datetime = lxw_datetime(year: 2013, month: 1, day: 23, hour: 12, min: 30, sec: 5.123)
        
        //Examples date and time formats. In the output file compare how changing the format strings changes the appearance of the date.
        let date_formats = [
            "dd/mm/yy",
            "mm/dd/yy",
            "dd m yy",
            "d mm yy",
            "d mmm yy",
            "d mmmm yy",
            "d mmmm yyy",
            "d mmmm yyyy",
            "dd/mm/yy hh:mm",
            "dd/mm/yy hh:mm:ss",
            "dd/mm/yy hh:mm:ss.000",
            "hh:mm",
            "hh:mm:ss",
            "hh:mm:ss.000",
        ]
        
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        let fileURL = documentDirectory.appendingPathComponent("date_and_times03.xlsx")
        
        let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
        let worksheet = workbook_add_worksheet(workbook, nil)

        //Add a bold format.
        let bold = workbook_add_format(workbook)
        format_set_bold(bold)
        //Write the column headers.
        worksheet_write_string(worksheet, 0, 0, "Formatted date", bold)
        worksheet_write_string(worksheet, 0, 1, "Format", bold)
        //Widen the first column to make the text clearer.
        worksheet_set_column(worksheet, 0, 1, 20, nil)
        //Write the same date and time using each of the above formats.
        var row = 0
        for i in 0..<14 {
            row+=1
            //Create a format for the date or time.
            let format  = workbook_add_format(workbook)
            format_set_num_format(format, date_formats[i])
            format_set_align(format, UInt8(LXW_ALIGN_LEFT.rawValue))
            //Write the datetime with each format.
            worksheet_write_datetime(worksheet, lxw_row_t(row), 0, &datetime, format)
            //Also write the format string for comparison
            worksheet_write_string(worksheet, lxw_row_t(row), 1, date_formats[i], nil)
        }

        workbook_close(workbook)
        
        return fileURL
    }
}
