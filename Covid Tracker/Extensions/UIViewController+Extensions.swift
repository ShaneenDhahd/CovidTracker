 
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
