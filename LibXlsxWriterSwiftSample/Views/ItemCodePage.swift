//
//  ItemCodePage.swift
//  LibXlsxWriterSwiftSample
//

import UIKit
import Sourceful

class ItemCodePage: UIViewController{
    var item: Example!
    let lexer = SwiftLexer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Code"
        
        let codeArea = SyntaxTextView()
        codeArea.theme = DefaultSourceCodeTheme()
        codeArea.delegate = self
        codeArea.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(codeArea)
        
        NSLayoutConstraint.activate([
            codeArea.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 5),
            codeArea.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            codeArea.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 5),
            codeArea.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        codeArea.insertText(item.code)
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
}

extension ItemCodePage: SyntaxTextViewDelegate {
    
    func didChangeText(_ syntaxTextView: SyntaxTextView) {
        
        
    }
    
    func didChangeSelectedRange(_ syntaxTextView: SyntaxTextView, selectedRange: NSRange) {
        
        
    }
    
    func lexerForSource(_ source: String) -> Lexer {
        return self.lexer
    }
}
