//
//  tutorial2.swift
//  LibXlsxWriterSwiftSample
//
import Foundation
import xlsxwriter

class Tutorial2{
    let expenses = [
        Expense(item: "Rent", cost: 1000),
        Expense(item: "Gas", cost: 100),
        Expense(item: "Food", cost: 300),
        Expense(item: "Gym", cost: 50),
    ]
    
    func generate() -> URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        let fileURL = documentDirectory.appendingPathComponent("tutorial02.xlsx")
        
        //Create a new workbook.
        //Ditch first 6 characters, because they are of the form file://
        let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
       
        let worksheet = workbook_add_worksheet(workbook, nil)
        
        //Add a bold format to use to highlight cells
        let bold = workbook_add_format(workbook)
        format_set_bold(bold);
        //Add a number format for cells with money.
        let money = workbook_add_format(workbook)
        format_set_num_format(money, "$#,##0")
        
        //Write some data header.
        worksheet_write_string(worksheet, 0, 0, "Item", bold)
        worksheet_write_string(worksheet, 0, 1, "Cost", bold)
        
        //Start from the first cell. Rows and columns are zero indexed.
        var row = 0
        let col = 0
        //Iterate over the data and write it out element by element.
        for row in (0...3).reversed() {
            //Write from the first cell below the headers.
            worksheet_write_string(worksheet, lxw_row_t(row+1), lxw_col_t(col),     expenses[row].item, nil)
            worksheet_write_number(worksheet, lxw_row_t(row+1), lxw_col_t(col + 1), expenses[row].cost, money)
        }
        row = 5
        //Write a total using a formula.
        worksheet_write_string (worksheet, lxw_row_t(row), lxw_col_t(col), "Total", bold)
        worksheet_write_formula(worksheet, lxw_row_t(row), lxw_col_t(col + 1), "=SUM(B2:B5)", money)
        workbook_close(workbook)
        return fileURL
    }
}
