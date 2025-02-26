import PDFKit
import AppKit

class PDFGenerator {
    static func generatePDF(for devis: Devis) -> Data? {
        let pdfData = NSMutableData()
        let pdfConsumer = CGDataConsumer(data: pdfData as CFMutableData)!
        var mediaBox = CGRect(x: 0, y: 0, width: 612, height: 792) // Format A4
        let pdfContext = CGContext(consumer: pdfConsumer, mediaBox: &mediaBox, nil)!

        pdfContext.beginPDFPage(nil)
        
        let clientNom: String
        if let client = devis.client {
            clientNom = client.nom ?? "Client inconnu"
        } else {
            clientNom = "Client inconnu"
        }

        let montantFormatted = String(format: "%.2f", devis.montantTTC ?? 0.0)
        let text = "Devis pour \(clientNom)\nMontant TTC : \(montantFormatted) €"
        let attributes: [NSAttributedString.Key: Any] = [.font: NSFont.systemFont(ofSize: 16)]
        let attributedText = NSAttributedString(string: text, attributes: attributes)

        let textRect = CGRect(x: 50, y: 700, width: 500, height: 50)
        attributedText.draw(in: textRect)

        pdfContext.endPDFPage()
        pdfContext.closePDF()
        
        return pdfData as Data
    }
}
