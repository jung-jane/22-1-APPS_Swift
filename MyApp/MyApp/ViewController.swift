
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var midLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func onButtonClick(_ sender: Any) {
        view.backgroundColor = .red;
        midLabel.text = "To be or not to be";
        midLabel.textColor = .white;
    
    }
}

