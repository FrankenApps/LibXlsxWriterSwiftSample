//
//  dates_and_times01.swift
//  LibXlsxWriterSwiftSample
//

import Foundation
import xlsxwriter

class DatesAndTimes01{
    func generate() -> URL {
        //A number to display as a date.
        let number = 41333.5
        
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        let fileURL = documentDirectory.appendingPathComponent("date_and_times01.xlsx")
        
        let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
        let worksheet = workbook_add_worksheet(workbook, nil)
        //Add a format with date formatting.
        let format = workbook_add_format(workbook)
        format_set_num_format(format, "mmm d yyyy hh:mm AM/PM")
        //Widen the first column to make the text clearer.
        worksheet_set_column(worksheet, 0, 0, 20, nil)
        //Write the number without formatting.
        worksheet_write_number(worksheet, 0, 0, number, nil)  // 41333.5
        /* Write the number with formatting. Note: the worksheet_write_datetime()
         * function is preferable for writing dates and times. This is for
         * demonstration purposes only.
         */
        worksheet_write_number(worksheet, 1, 0, number, format)   // Feb 28 2013 12:00 PM

        workbook_close(workbook)
        
        return fileURL
    }
}
