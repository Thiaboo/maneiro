//
//  ViewController.swift
//  De Bar em Bar
//
//  Created by Jonathan on 29/01/20.
//  Copyright © 2020 hbsis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nomeBarTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var avaliacaoSlider: UISlider!
    @IBOutlet weak var nomeBarLabel: UILabel!
    @IBOutlet weak var barImageView: UIImageView!
    @IBOutlet weak var ratingBar: RatingBar!
    
    private var imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeBarTextField.delegate = self
        enderecoTextField.delegate = self
        telefoneTextField.delegate = self
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        print("AE, CRIADO O BAR MANINHO")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var nomeCampo : String!
        
        switch textField {
        case nomeBarTextField:
            nomeCampo = "Bar"
            break
        case enderecoTextField:
            nomeCampo = "Endereço"
            break
        default:
            nomeCampo = "Outro campo"
        }
        
        nomeBarLabel.text = nomeBarTextField.text
        
        print(nomeCampo + textField.text!)
        
        return true
    }
    
    
    @IBAction func didClickedImageView(_ sender: UITapGestureRecognizer) {
        print("Clicou")
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.mediaTypes = ["public.image"]
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Deu errado, mermão")
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.editedImage] as? UIImage {
            barImageView.contentMode = .scaleAspectFill
            barImageView.image = pickedImage
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
