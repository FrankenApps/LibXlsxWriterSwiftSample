//
//  format_num_format.swift
//  LibXlsxWriterSwiftSample
//

import Foundation
import xlsxwriter

class FormatNumFormat{
    func generate() -> URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        let fileURL = documentDirectory.appendingPathComponent("format_num_format.xlsx")
        
        let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
        let worksheet = workbook_add_worksheet(workbook, nil)
        //Widen the first column to make the text clearer
        worksheet_set_column(worksheet, 0, 0, 30, nil)
        //Add some formats
        let format01 = workbook_add_format(workbook)
        let format02 = workbook_add_format(workbook)
        let format03 = workbook_add_format(workbook)
        let format04 = workbook_add_format(workbook)
        let format05 = workbook_add_format(workbook)
        let format06 = workbook_add_format(workbook)
        let format07 = workbook_add_format(workbook)
        let format08 = workbook_add_format(workbook)
        let format09 = workbook_add_format(workbook)
        let format10 = workbook_add_format(workbook)
        let format11 = workbook_add_format(workbook)
        //Set some example number formats
        format_set_num_format(format01, "0.000")
        format_set_num_format(format02, "#,##0")
        format_set_num_format(format03, "#,##0.00")
        format_set_num_format(format04, "0.00")
        format_set_num_format(format05, "mm/dd/yy")
        format_set_num_format(format06, "mmm d yyyy")
        format_set_num_format(format07, "d mmmm yyyy")
        format_set_num_format(format08, "dd/mm/yyyy hh:mm AM/PM")
        format_set_num_format(format09, "0 \"dollar and\" .00 \"cents\"")
        //Write data using the formats
        worksheet_write_number(worksheet, 0, 0, 3.1415926, nil)       // 3.1415926
        worksheet_write_number(worksheet, 1, 0, 3.1415926, format01)  // 3.142
        worksheet_write_number(worksheet, 2, 0, 1234.56,   format02)  // 1,235
        worksheet_write_number(worksheet, 3, 0, 1234.56,   format03)  // 1,234.56
        worksheet_write_number(worksheet, 4, 0, 49.99,     format04)  // 49.99
        worksheet_write_number(worksheet, 5, 0, 36892.521, format05)  // 01/01/01
        worksheet_write_number(worksheet, 6, 0, 36892.521, format06)  // Jan 1 2001
        worksheet_write_number(worksheet, 7, 0, 36892.521, format07)  // 1 January 2001
        worksheet_write_number(worksheet, 8, 0, 36892.521, format08)  // 01/01/2001 12:30 AM
        worksheet_write_number(worksheet, 9, 0, 1.87,      format09)  // 1 dollar and .87 cents
        //Show limited conditional number formats
        format_set_num_format(format10, "[Green]General[Red]-GeneralGeneral")
        worksheet_write_number(worksheet, 10, 0, 123, format10)  // > 0 Green
        worksheet_write_number(worksheet, 11, 0, -45, format10)  // < 0 Red
        worksheet_write_number(worksheet, 12, 0,   0, format10)  // = 0 Default color
        //Format a Zip code
        format_set_num_format(format11, "00000")
        worksheet_write_number(worksheet, 13, 0, 1209, format11)
        workbook_close(workbook)
        
        return fileURL
    }
}
