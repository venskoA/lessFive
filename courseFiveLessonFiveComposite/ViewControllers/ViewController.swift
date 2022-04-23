//
//  ViewController.swift
//  courseFiveLessonFiveComposite
//
//  Created by Andrey Vensko on 20.04.22.
//

import UIKit

class ViewController: UIViewController {
    private var tableView = UITableView()
    var allFolder: Folder?

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    /// numbers section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = allFolder?.falesInTisFolder.count else { return 0 }
        return count
    }

    /// create cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let modelCell = allFolder?.falesInTisFolder[indexPath.row]
        let nameCell: String? = modelCell?.name ?? "" + (modelCell?.countObject ?? "")

        cell.textLabel?.text = nameCell
        return cell
    }

    /// button click handling
    ///  transition on the new VC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        allFolder?.falesInTisFolder[indexPath.row].open(self)
    }

    /// name tableView
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allFolder?.name
    }
}

extension ViewController {
    /// create UI in this project
    private func createUI() {
        let addFolderButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFolder))
        let addFileButton = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(addFile))
        navigationItem.rightBarButtonItems = [addFolderButton, addFileButton]

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }

    /// button click handling
    @objc
    func addFolder() {
        if allFolder == nil {
            allFolder = Folder(name: "First folder")
        }

        AlertController().actionAllert(vc: self) { name in
            self.allFolder?.addNewFolder(name)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    /// button click handling
    @objc
    func addFile() {
        if allFolder == nil {
            allFolder = Folder(name: "First folder")
        }
        
        AlertController().actionAllert(vc: self) { name in
            self.allFolder?.addNewLeaf(name)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
