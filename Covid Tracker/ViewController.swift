//
//  ViewController.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 04/11/2022.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var tableView: UITableView!
	var viewModel = CovidViewModel()

	@IBOutlet var activityIndicator: UIActivityIndicatorView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initViewModel()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UINib(nibName: "CovidCell", bundle: nil), forCellReuseIdentifier: "customTableViewCell")
	}


	func initViewModel(){
		viewModel.reloadTableView = {
			DispatchQueue.main.async { self.tableView.reloadData() }
		}
		viewModel.showError = {
			DispatchQueue.main.async { self.showAlert("Ups, something went wrong.") }
		}
		viewModel.showLoading = {
			DispatchQueue.main.async { self.activityIndicator.startAnimating() }
		}
		viewModel.hideLoading = {
			DispatchQueue.main.async { self.activityIndicator.stopAnimating() }
		}
		viewModel.getData()
	}
}


extension ViewController:UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfCells
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CovidCell else {
			fatalError("Cell not exists in storyboard")
		}
		let cellVM = viewModel.getCellViewModel( at: indexPath )
		cell.neg.text = ("\(cellVM.negative)")
		return cell
	}
}

