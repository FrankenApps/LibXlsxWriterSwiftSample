//
//  hello.swift
//  LibXlsxWriterSwiftSample
//
import Foundation
import xlsxwriter

class Hello{
    func generate() -> URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        let fileURL = documentDirectory.appendingPathComponent("hello_world.xlsx")
        
        let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
        let worksheet = workbook_add_worksheet(workbook, nil)
        worksheet_write_string(worksheet, 0, 0, "Hello", nil)
        worksheet_write_number(worksheet, 1, 0, 123, nil)
        workbook_close(workbook)
        
        return fileURL
    }
}
