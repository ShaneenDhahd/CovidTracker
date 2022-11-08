 
import UIKit

extension UIViewController {
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension Int? {
	func getPercentage(of total: Int) -> CGFloat {
		if let current = self {
			let percentage = (CGFloat(current) / CGFloat(total)) * 100
			return CGFloat(percentage)
		} else {
			return 0
		}
	}
}

extension Int {
	func format() -> String? {
		let numberFormatter = NumberFormatter.toOneDecimalPlace
		numberFormatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
		numberFormatter.groupingSeparator = "."
		numberFormatter.numberStyle = .decimal
		return numberFormatter.string(from: self as NSNumber)
	}
}

extension Int {
	func dateFormat() -> String? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyyMMdd"
		guard let date = dateFormatter.date(from: "\(self)") else { return "" }
		dateFormatter.dateFormat = "yyyy-MM-dd"
		dateFormatter.locale = Locale(identifier: "EN")
		return dateFormatter.string(from: date)
	}
}
