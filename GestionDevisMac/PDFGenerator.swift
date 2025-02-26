import PDFKit
import AppKit

class PDFGenerator {
    static func generatePDF(for devis: Devis) -> Data? {
        let pdfData = NSMutableData()
        let pdfConsumer = CGDataConsumer(data: pdfData as CFMutableData)!
        var mediaBox = CGRect(x: 0, y: 0, width: 612, height: 792) // Format A4
        let pdfContext = CGContext(consumer: pdfConsumer, mediaBox: &mediaBox, nil)!

        pdfContext.beginPDFPage(nil)
        
        let text = "Devis pour \(devis.client.nom)\nMontant TTC : \(devis.montantTTC) €"
        let attributes: [NSAttributedString.Key: Any] = [.font: NSFont.systemFont(ofSize: 16)]
        let attributedText = NSAttributedString(string: text, attributes: attributes)

        let textRect = CGRect(x: 50, y: 700, width: 500, height: 50)
        attributedText.draw(in: textRect)

        pdfContext.endPDFPage()
        pdfContext.closePDF()
        
        return pdfData as Data
    }
}
