//
//  RecordsViewController.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 08/11/2022.
//

import UIKit

class RecordsViewController: UIViewController {

	@IBOutlet var tableView: UITableView!
	
	var viewModel = CovidViewModel()

	
	override func viewDidLoad() {
        super.viewDidLoad()
				tableView.delegate = self
				tableView.dataSource = self
				tableView.register(UINib(nibName: "CovidCell", bundle: nil), forCellReuseIdentifier: "covidCell")
		initViewModel()

        // Do any additional setup after loading the view.
    }
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.navigationBar.isHidden = false
	}
	func initViewModel(){
		viewModel.reloadTableView = {
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
		viewModel.showError = {
			DispatchQueue.main.async { self.showAlert("Ups, something went wrong.") }
		}
//		viewModel.showLoading = {
//			DispatchQueue.main.async { self.activityIndicator.startAnimating() }
//		}
//		viewModel.hideLoading = {
//			DispatchQueue.main.async { self.activityIndicator.stopAnimating() }
//		}
		viewModel.getData()
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RecordsViewController:UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.items?.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "covidCell", for: indexPath) as? CovidCell else {
			fatalError("Cell not exists in storyboard")
		}
		let cellItem = viewModel.getCellViewModel( at: indexPath )
		cell.initCell(cellItem)
		//cell.neg.text = ("\(cellVM.positive)")
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		160
	}
	
	func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		false
	}
	
}
