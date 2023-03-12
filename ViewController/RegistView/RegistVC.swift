//
//  RegistVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class RegistVC: UIViewController {

    @IBOutlet weak var registBtn: UIControl!
    @IBOutlet weak var backButton: UIControl!
     
    @IBOutlet weak var collectionView: UICollectionView!
     
    @IBOutlet weak var textField1Container: UIView!
    
    @IBOutlet weak var textField2Container: UIView!
   
    @IBOutlet weak var category: UIControl!
    let picker = UIImagePickerController()
    var list: [UIImage] = []
    @IBOutlet weak var tag: UIControl!
    
    
    @IBAction func registBtn(_ sender: Any) {
//        let vc1 = Detail(productId: <#Int#>)
//        self.navigationController?.pushViewController(vc1, animated: true)
    }
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func categoryBtn(_ sender: Any) {
        let vc1 = CategoryVC()
        self.navigationController?.pushViewController(vc1, animated: true)
    }
    
    
    @IBAction func tagBtn(_ sender: Any) {
        let vc2 = TagVC()
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    
    
    
    @IBAction func backBtnAction(_ sender: Any) {
         
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.sourceType = .photoLibrary // 앨범에서 가져옴
        self.picker.allowsEditing = true // 수정 가능 여부
        self.picker.delegate = self // picker delegate
//        picker.delegate = self
        collectionView.register(UINib(nibName: "PickerColCell", bundle: nil), forCellWithReuseIdentifier: "PickerColCell")
        self.navigationController?.isNavigationBarHidden = true
      
        myLabel.text = "-구매 시기\n\n-브랜드/모델명\n\n제품의 상태(사용감,하자 유무 등)\n\n* 서로가 믿고 거래할 수 있도록,자세한 정보와 다양한\n\n각도의 상품 사진을 올려주세요."
        
        let underlineTextField = UnderlineTextField(frame: .zero)
        underlineTextField.textField.placeholder = "상품명"
        underlineTextField.price.isHidden = true
        underlineTextField.checkImage.isHidden = true
        underlineTextField.translatesAutoresizingMaskIntoConstraints = false
        textField1Container.addSubview(underlineTextField)
        textField1Container.addConstraints([
            underlineTextField.leadingAnchor.constraint(equalTo: textField1Container.leadingAnchor),
            underlineTextField.trailingAnchor.constraint(equalTo: textField1Container.trailingAnchor),
            underlineTextField.topAnchor.constraint(equalTo: textField1Container.topAnchor),
            underlineTextField.bottomAnchor.constraint(equalTo: textField1Container.bottomAnchor)
        ])
        
        
        let underlineTextField2 = UnderlineTextField(frame: .zero)
        underlineTextField2.textField.placeholder = "￦ 가격"
        underlineTextField2.price.text = "배송비포함"
        underlineTextField2.checkImage.image = UIImage(named:"whiteCheck")
        underlineTextField2.translatesAutoresizingMaskIntoConstraints = false
         
        textField2Container.addSubview(underlineTextField2)
        textField2Container.addConstraints([
            underlineTextField2.leadingAnchor.constraint(equalTo: textField2Container.leadingAnchor),
            underlineTextField2.trailingAnchor.constraint(equalTo: textField2Container.trailingAnchor),
            underlineTextField2.topAnchor.constraint(equalTo: textField2Container.topAnchor),
            underlineTextField2.bottomAnchor.constraint(equalTo: textField2Container.bottomAnchor)
        ])
    }
   
    @objc
    func imageControlAction(_ sender: UIControl) {
        let buttonPosition: CGPoint = sender.convert(.zero, to: self.collectionView)
        let indexPath: IndexPath = self.collectionView.indexPathForItem(at: buttonPosition) ?? IndexPath()
        
        if indexPath.row == 0 {
            self.present(self.picker, animated: true)
        }
    }
    
    @objc
    func deleteControlAction(_ sender: UIControl) {
        let buttonPosition: CGPoint = sender.convert(.zero, to: self.collectionView)
        let indexPath: IndexPath = self.collectionView.indexPathForItem(at: buttonPosition) ?? IndexPath()
        
        list.remove(at: indexPath.row - 1)
        collectionView.reloadData()
    }
}

extension RegistVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count + 1
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickerColCell", for: indexPath as IndexPath) as? PickerColCell
        if indexPath.row == 0 {
            cell?.bind(image: nil)
        } else {
            cell?.bind(image: list[indexPath.row - 1])
        }
        cell?.imageControl.addTarget(self, action: #selector(imageControlAction(_:)), for: .touchUpInside)
        cell?.control.addTarget(self, action: #selector(deleteControlAction(_:)), for: .touchUpInside)
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 80
        let height: CGFloat = 80 // collectionViewCell 높이
        
        return CGSize(width: width, height: height)
    }
}

extension RegistVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false) { () in
            // 이미지를 이미지 뷰에 표시
            if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                self.list.append(img)
                self.collectionView.reloadData()
            }
        }
    }
}
