class ReportMailerService
  def sender(user, pdf_path)
    PdfMailer.send_report(user, pdf_path).deliver_later
  end
end