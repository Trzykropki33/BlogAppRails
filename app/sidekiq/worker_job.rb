class WorkerJob
  include Sidekiq::Job

  def perform(user_email)
    posts = Post.all
    g = PdfGenerator.new
    file_name = g.generate_pdf(posts)
    file_name = "./app/services/pdfs/#{file_name}"
    puts file_name

    PdfMailer.send_report(user_email,file_name).deliver_now
  end
end
