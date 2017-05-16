//
//  ViewController.swift
//  ios-horizontal-pickerview-demo
//
//  Created by Eiji Kushida on 2017/05/16.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    let items = ["月", "火", "水", "木", "金", "土", "日"]
    let pickerHeight: CGFloat = 100
    let pickerWidth: CGFloat = 66

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHorizontal()
        pickerView.delegate = self
    }

    /// ピッカーを90度回転させる
    func setupHorizontal() {
        pickerView.showsSelectionIndicator = true
        pickerView.translatesAutoresizingMaskIntoConstraints = true

        let rotationAngle = CGFloat(-90 * (Double.pi / 180))
        pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)

        let y = pickerView.frame.origin.y
        pickerView.frame = CGRect(x: -100,
                                  y: y,
                                  width: view.frame.width + 200,
                                  height: pickerHeight)
    }
}

// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }

    /// PickerViewをカスタマイズする
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {

        let view = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: pickerHeight,
                                        height: 100))
        view.addSubview(setupLabel(row: row))
        return view
    }

    /// Pickerに表示するラベルを設定する
    ///
    /// - Parameter row: Pickerの行数
    /// - Returns: Pickerに表示するラベル
    func setupLabel(row: Int) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0,
                                          y: 0,
                                          width: pickerHeight,
                                          height: 100))
        label.text = items[row]
        label.textColor = UIColor.black
        label.textAlignment = .center

        let rotationAngle = CGFloat(90 * (Double.pi / 180))
        label.transform = CGAffineTransform(rotationAngle: rotationAngle)
        return label
    }

    func pickerView(_ pickerView: UIPickerView,
                    rowHeightForComponent component: Int) -> CGFloat {
        return pickerWidth
    }

    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        print(items[row])
    }
}
