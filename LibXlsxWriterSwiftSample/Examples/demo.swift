//
//  demo.swift
//  LibXlsxWriterSwiftSample
//
import Foundation
import UIKit
import xlsxwriter

class Demo{
    func generate() -> URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        let fileURL = documentDirectory.appendingPathComponent("demo.xlsx")
        
        //Create a new workbook.
        //Ditch first 6 characters, because they are of the form file://
        let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
        let worksheet = workbook_add_worksheet(workbook, nil)
        //Add a format.
        let format = workbook_add_format(workbook)
        //Set the bold property for the format
        format_set_bold(format)
        //Change the column width for clarity
        worksheet_set_column(worksheet, 0, 0, 20, nil)
        //Write some simple text
        worksheet_write_string(worksheet, 0, 0, "Hello", nil)
        //Text with formatting
        worksheet_write_string(worksheet, 1, 0, "World", format)
        //Write some numbers
        worksheet_write_number(worksheet, 2, 0, 123,     nil)
        worksheet_write_number(worksheet, 3, 0, 123.456, nil)
        //Insert an image
        var imageBuffer = getArrayOfBytesFromImage(imageData: (UIImage(named: "logo")?.jpegData(compressionQuality: .greatestFiniteMagnitude)!)! as NSData)
        worksheet_insert_image_buffer(worksheet, 1, 2, &imageBuffer, imageBuffer.count)
        workbook_close(workbook)
        
        return fileURL
    }
    
    func getArrayOfBytesFromImage(imageData:NSData) -> [UInt8]
    {
        //Determine array size
        let count = imageData.length / MemoryLayout.size(ofValue: UInt8())
        //Create an array of the appropriate size
        var bytes = [UInt8](repeating: 0, count: count)
        //Copy image data as bytes into the array
        imageData.getBytes(&bytes, length:count * MemoryLayout.size(ofValue: UInt8()))

        return bytes
    }
}
