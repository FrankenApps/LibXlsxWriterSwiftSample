//
//  ExampleListPage.swift
//  LibXlsxWriterSwiftSample
//

import UIKit
import QuickLook

class ExampleListPage: UITableViewController, QLPreviewControllerDelegate {
    var examples: [Example]!
    lazy var previewItem = NSURL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let licenseIcon = UIImage(systemName: "doc.plaintext")
        let licenseButton = UIBarButtonItem(image: licenseIcon, style: .plain, target: self, action: #selector(showLicensePage))
        
        self.navigationItem.rightBarButtonItem = licenseButton
        
        let exampleListGenerator = ExampleListGenerator()
        examples = exampleListGenerator.generate()
        
        self.title = "LibXlsxWriter - Examples"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "none")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "none", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        let currentItem = examples[indexPath.row]
        
        //StackView
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .equalCentering
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(stackView)
        
        //Title label
        let titleLabel = UILabel()
        titleLabel.text = currentItem.title
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        
        //Subtitle label
        let subTitleLabel = UILabel()
        subTitleLabel.text = currentItem.subtitle
        subTitleLabel.font = .systemFont(ofSize: 18)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(subTitleLabel)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: cell.contentView.leftAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 5),
            stackView.heightAnchor.constraint(equalTo: cell.contentView.heightAnchor, constant: -5),
        ])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.generateExcelFile(item: self.examples[indexPath.row], inQuickLook: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let codeAction = UIContextualAction(style: .normal, title: "View Code") {  (contextualAction, view, boolValue) in
            self.showCode(item: self.examples[indexPath.row])
        }
        codeAction.backgroundColor = .systemYellow
        codeAction.image = UIImage(systemName: "chevron.left.slash.chevron.right")
        
        let shareAction = UIContextualAction(style: .normal, title: "Share File") {  (contextualAction, view, boolValue) in
            self.generateExcelFile(item: self.examples[indexPath.row], inQuickLook: false)
        }
        shareAction.backgroundColor = .systemBlue
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        let swipeActions = UISwipeActionsConfiguration(actions: [codeAction, shareAction])

        return swipeActions
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func showCode(item: Example) {
        let codePage = ItemCodePage()
        codePage.item = item
        self.navigationController?.pushViewController(codePage, animated: true)
    }
    
    func generateExcelFile(item: Example, inQuickLook: Bool){
        let fileUrl = item.generateFunction()
        if inQuickLook {
            displayExcelFile(fileUrl: fileUrl)
        }
        else{
            self.shareExcelFile(fileUrl: fileUrl)
        }
    }
    
    func displayExcelFile(fileUrl: URL){
        let previewController = QLPreviewController()
        self.previewItem = fileUrl as NSURL
        
        previewController.dataSource = self
        self.present(previewController, animated: true)
        
        previewController.delegate = self
    }
    
    func previewControllerWillDismiss(_ controller: QLPreviewController){
        self.removeTemporaryFile(fileUrl: self.previewItem as URL)
    }
    
    func shareExcelFile(fileUrl: URL) {
        var filesToShare = [Any]()
        filesToShare.append(fileUrl)
        let activityViewController = UIActivityViewController(activityItems: filesToShare, applicationActivities: [])
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)

        self.present(activityViewController, animated: true)
        
        activityViewController.completionWithItemsHandler = { activity, completed, items, error in
            self.removeTemporaryFile(fileUrl: fileUrl)
            self.dismiss(animated: false, completion: nil) //File needs to be recreated; reflect in UI
        }
    }
    
    func removeTemporaryFile(fileUrl: URL) {
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(at: fileUrl)
        } catch {
            print("Could not delete temporary file: \(error)")
        }
    }
    
    @objc func showLicensePage(){
        self.navigationController?.pushViewController(LicensesPage(), animated: true)
    }
}

extension ExampleListPage: QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        return self.previewItem as QLPreviewItem
    }
}
