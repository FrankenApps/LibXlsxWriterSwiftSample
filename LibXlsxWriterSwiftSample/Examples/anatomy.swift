//
//  anatomy.swift
//  LibXlsxWriterSwiftSample
//
import Foundation
import xlsxwriter

class Anatomy{
    func generate() -> URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        let fileURL = documentDirectory.appendingPathComponent("anatomy.xlsx")
        
        //Create a new workbook.
        //Ditch first 6 characters, because they are of the form file://
        let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
        //Add a worksheet with a user defined sheet name.
        let worksheet1 = workbook_add_worksheet(workbook, "Demo")
        //Add a worksheet with Excel's default sheet name: Sheet2.
        let worksheet2 = workbook_add_worksheet(workbook, nil)
        //Add some cell formats.
        let myformat1 = workbook_add_format(workbook)
        let myformat2 = workbook_add_format(workbook)
        //Set the bold property for the first format.
        format_set_bold(myformat1)
        //Set a number format for the second format.
        format_set_num_format(myformat2, "$#,##0.00")
        //Widen the first column to make the text clearer.
        worksheet_set_column(worksheet1, 0, 0, 20, nil)
        //Write some unformatted data.
        worksheet_write_string(worksheet1, 0, 0, "Peach", nil)
        worksheet_write_string(worksheet1, 1, 0, "Plum", nil)
        //Write formatted data.
        worksheet_write_string(worksheet1, 2, 0, "Pear", myformat1)
        //Formats can be reused.
        worksheet_write_string(worksheet1, 3, 0, "Persimmon", myformat1)
        //Write some numbers.
        worksheet_write_number(worksheet1, 5, 0, 123, nil)
        worksheet_write_number(worksheet1, 6, 0, 4567.555, myformat2)
        //Write to the second worksheet.
        worksheet_write_string(worksheet2, 0, 0, "Some text", myformat1)
        //Close the workbook, save the file and free any memory.
        let error = workbook_close(workbook)
        //Check if there was any error creating the xlsx file.
        if (error.rawValue != LXW_NO_ERROR.rawValue){
            print("Error in workbook_close().\nError %d = %s\n", error, lxw_strerror(error)!)
        }
        
        return fileURL
    }
}
