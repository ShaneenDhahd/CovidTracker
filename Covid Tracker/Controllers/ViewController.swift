//
//  ViewController.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 04/11/2022.
//

import UIKit
import CoreData
class ViewController: UIViewController {
	
	@IBOutlet var pastCasesBtn: UIButton!
	@IBOutlet var hospitalized: UILabel!
	@IBOutlet var deaths: UILabel!
	@IBOutlet var negative: UILabel!
	@IBOutlet var infected: UILabel!
	@IBOutlet var pieView: UIView!
	
	var data: CovidModelElement!
	
	let pieChartView = PieChartView()
	
	var viewModel = HomeViewModel()
	var covidViewModel = CovidViewModel()

	var errorMsg = ""
	//var list = CovidModel()
	

	@IBOutlet var activityIndicator: UIActivityIndicatorView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initViewModel()
		
		viewModel.updateUI = { data, errorMsg in
			self.errorMsg = errorMsg
			self.data = data
			self.addChart()
			self.initViews()
		}
		
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	private func initViews() {

		if let infectedNumber = data.positive {
			infected.text = "\(infectedNumber)"
		}
		if let negativeNumber = data.positive {
			negative.text = "\(negativeNumber)"
		}
		if let hospitalNumber = data.positive {
			hospitalized.text = "\(hospitalNumber)"
		}
		if let deathNumber = data.positive {
			deaths.text = "\(deathNumber)"
		}
		if data != nil {
			pastCasesBtn.isEnabled = true
		}
	}
	
	
	func addChart() {
		DispatchQueue.main.async { [self] in
			pieChartView.segments = [
				LabelledSegment(color: #colorLiteral(red: 1.0, green: 0.121568627, blue: 0.28627451, alpha: 1.0), name: "",        value: data.positivePercentage),
				LabelledSegment(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), name: "",     value: data.negativePercentage),
				LabelledSegment(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), name: "",     value: data.deathPercentage)
			]
			
			pieChartView.segmentLabelFont = .systemFont(ofSize: 18)
			
			pieView.addSubview(pieChartView)
			pieChartView.frame = CGRect(
				x: 0, y: 0,
				width: pieView.frame.size.width, height: 180
			)
		}
	}
	
	//		tableView.delegate = self
	//		tableView.dataSource = self
	//		tableView.register(UINib(nibName: "CovidCell", bundle: nil), forCellReuseIdentifier: "customTableViewCell")
	
	
	func initViewModel(){
		
		viewModel.showError = {
			DispatchQueue.main.async { self.showAlert(self.errorMsg) }
		}
		viewModel.showLoading = {
			DispatchQueue.main.async { self.activityIndicator.startAnimating() }
		}
		viewModel.hideLoading = {
			DispatchQueue.main.async { self.activityIndicator.stopAnimating() }
		}
		errorMsg = viewModel.errorMsg
		viewModel.getData()
		covidViewModel.getData()
	}
}
//
//
//extension ViewController:UITableViewDelegate, UITableViewDataSource {
//	
//	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		return viewModel.items?.count ?? 0
//	}
//	
//	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		guard let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CovidCell else {
//			fatalError("Cell not exists in storyboard")
//		}
//		let cellVM = viewModel.getCellViewModel( at: indexPath )
//		cell.neg.text = ("\(cellVM.positive)")
//		return cell
//	}
//}
//
