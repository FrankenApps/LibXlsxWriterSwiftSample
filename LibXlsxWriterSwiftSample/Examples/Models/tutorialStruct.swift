//
//  tutorialStruct.swift
//  LibXlsxWriterSwiftSample
//

import xlsxwriter

// Some data we want to write to the worksheet.
struct Expense {
    let item: String!
    let cost: Double!
    var datetime: lxw_datetime? = nil
    
    init(item: String, cost: Double) {
        self.item = item
        self.cost = cost
    }
    
    init(item: String, cost: Double, datetime: lxw_datetime) {
        self.item = item
        self.cost = cost
        self.datetime = datetime
    }
}
