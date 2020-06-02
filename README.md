# LibXlsxWriterSwiftSample
This repository contains a Xcode example project showing how to use the libxlsxwriter CocoaPod with Swift for iOS.

## Goal of this Repository
While using most of the c API from Swift is pretty straight forward, in some cases there are some modifications needed, in order to get everything working together.
This repository aims to provide some examples on how to deal with such cases in Swift 5.

## Basic Setup
If you want to use this Pod in your own project, all you have to do is to add this
```
pod 'libxlsxwriter', '~> 0.9'
```
line to your Podfile and run `pod install`. In your Swift source file you can now import
```
import xlsxwriter
```
and use it's various c functions.

## Basic Example
A basic example on how to generate a .xlsx file and save it to the app's documents directory would look like that:
```swift
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
