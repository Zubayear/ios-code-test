import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        
        let url = URL(string: "http://182.160.97.214:81/api/v1/user")
        guard let requestUrl = url else { fatalError() }
        
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        if username.text != "" && password.text != "" {
            let postString = "email=\(username.text ?? "")&password=\(password.text ?? "")";
            
            let alert = UIAlertController(title: "Sorry", message: "This user isn't valid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            request.httpBody = postString.data(using: String.Encoding.utf8);
            
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if error != nil {
                    //                    print("Error took place \(error)")
                    return
                }
                
                if let data = data, let _ = String(data: data, encoding: .utf8) {
                    
                    let decoder = JSONDecoder()
                    //                    print(dataString)
                    let value = try! decoder.decode(User.self, from: data)
                    if value.message == "Successful" {
                        DispatchQueue.main.async {
                            self.password.text = ""
                            self.performSegue(withIdentifier: "nextScreen", sender: self)
                        }
                        
                    } else {
                        DispatchQueue.main.async {
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                    }
                }
                
            }
            task.resume()
        } else {
            let alert = UIAlertController(title: "Sorry", message: "All fields are required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
}

