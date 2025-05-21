class PdfMailer < ApplicationMailer
  default from: "from@example.com"
  layout "mailer"

  def send_report(user_email, pdf_path)
    attachments["Logs.pdf"] = File.read(pdf_path)
    # mail(to: user_email, subject: "Logs form blog")
    mail(to: "bjedrzejewski03@gmail.com", subject: "Logs form blog", body:"Report send")
  end
end
