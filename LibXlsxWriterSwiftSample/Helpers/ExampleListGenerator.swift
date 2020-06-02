//
//  ExampleListGenerator.swift
//  LibXlsxWriterSwiftSample
//

import Foundation

class ExampleListGenerator {
    func generate() -> [Example] {
        var exampleList = [Example]()
        
        let helloExample = Example(id: 0,
                                   title: "hello.swift",
                                   subtitle: "A simple hello world example",
                                   code: """
                                   let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
                                   let fileURL = documentDirectory.appendingPathComponent("hello_world.xlsx")
                                   
                                   let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
                                   let worksheet = workbook_add_worksheet(workbook, nil)
                                   worksheet_write_string(worksheet, 0, 0, "Hello", nil)
                                   worksheet_write_number(worksheet, 1, 0, 123, nil)
                                   workbook_close(workbook)
                                   """,
                                   generateFunction: Hello().generate)
        exampleList.append(helloExample)
        
        let anatomyExample = Example(id: 1,
                                     title: "anatomy.swift",
                                     subtitle: "The anatomy of a libxlsxwriter program",
                                     code: """
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
                                     """,
                                     generateFunction: Anatomy().generate)
        exampleList.append(anatomyExample)
        
        let demoExample = Example(id: 2,
                                  title: "demo.swift",
                                  subtitle: "Demo of some of the libxlsxwriter features",
                                  code: """
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
                                  //Change the column width for clarity.
                                  worksheet_set_column(worksheet, 0, 0, 20, nil)
                                  //Write some simple text
                                  worksheet_write_string(worksheet, 0, 0, "Hello", nil)
                                  //Text with formatting.
                                  worksheet_write_string(worksheet, 1, 0, "World", format)
                                  //Write some numbers
                                  worksheet_write_number(worksheet, 2, 0, 123,     nil)
                                  worksheet_write_number(worksheet, 3, 0, 123.456, nil)
                                  //Insert an image
                                  var imageBuffer = getArrayOfBytesFromImage(imageData: (UIImage(named: "logo")?.jpegData(compressionQuality: .greatestFiniteMagnitude)!)! as NSData)
                                  worksheet_insert_image_buffer(worksheet, 1, 2, &imageBuffer, imageBuffer.count)
                                  workbook_close(workbook)

                                  ...

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
                                  """,
                                  generateFunction: Demo().generate)
        exampleList.append(demoExample)
        
        return exampleList
    }
}
