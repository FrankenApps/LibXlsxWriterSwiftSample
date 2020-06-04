//
//  format_font.swift
//  LibXlsxWriterSwiftSample
//

import Foundation
import xlsxwriter

class FormatFont{
    func generate() -> URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        let fileURL = documentDirectory.appendingPathComponent("format_font.xlsx")
        
        let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
        let worksheet = workbook_add_worksheet(workbook, nil)
        //Widen the first column to make the text clearer
        worksheet_set_column(worksheet, 0, 0, 20, nil)
        //Add some formats.
        let format1 = workbook_add_format(workbook)
        let format2 = workbook_add_format(workbook)
        let format3 = workbook_add_format(workbook)
        //Set the bold property for format 1
        format_set_bold(format1)
        //Set the italic property for format 2
        format_set_italic(format2)
        //Set the bold and italic properties for format 3
        format_set_bold  (format3)
        format_set_italic(format3)
        //Write some formatted strings
        worksheet_write_string(worksheet, 0, 0, "This is bold",    format1)
        worksheet_write_string(worksheet, 1, 0, "This is italic",  format2)
        worksheet_write_string(worksheet, 2, 0, "Bold and italic", format3)
        //Close the workbook, save the file and free any memory
        workbook_close(workbook)
        
        return fileURL
    }
}
