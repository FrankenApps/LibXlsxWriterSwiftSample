//
//  tutorial1.swift
//  LibXlsxWriterSwiftSample
//
import Foundation
import xlsxwriter

class Tutorial1{
    let expenses = [
        Expense(item: "Rent", cost: 1000),
        Expense(item: "Gas", cost: 100),
        Expense(item: "Food", cost: 300),
        Expense(item: "Gym", cost: 50),
    ]
    
    func generate() -> URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        let fileURL = documentDirectory.appendingPathComponent("tutorial01.xlsx")
        
        //Create a new workbook.
        //Ditch first 6 characters, because they are of the form file://
        let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
       
        let worksheet = workbook_add_worksheet(workbook, nil)
        //Start from the first cell. Rows and columns are zero indexed.
        var row = 0
        let col = 0
        //Iterate over the data and write it out element by element.
        for row in (0...3).reversed() {
            worksheet_write_string(worksheet, lxw_row_t(row), lxw_col_t(col),     expenses[row].item, nil)
            worksheet_write_number(worksheet, lxw_row_t(row), lxw_col_t(col + 1), expenses[row].cost, nil)
        }
        row = 4
        //Write a total using a formula.
        worksheet_write_string (worksheet, lxw_row_t(row), lxw_col_t(col), "Total", nil)
        worksheet_write_formula(worksheet, lxw_row_t(row), lxw_col_t(col + 1), "=SUM(B1:B4)", nil)
        workbook_close(workbook)
        return fileURL
    }
}
