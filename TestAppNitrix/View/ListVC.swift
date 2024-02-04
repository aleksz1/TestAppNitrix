//
//  ListVC.swift
//  TestAppNitrix
//
//  Created by Иван on 02.02.2024.
//

import UIKit

class ListVC: UIViewController {

    private var movies: [String] = ["Movie 1", "Movie 2", "Movie 3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
}

extension ListVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row]
        return cell
    }

}
