class PdfGenerator
  require 'prawn'
  def generate_pdf(posts)
    file_name="Logs_#{DateTime.now.strftime("%Y%m%d_%H%M%S").to_s}.pdf"
    Prawn::Document.generate("./app/services/pdfs/#{file_name}") do |pdf|
      # pdf.font_families.update(
      #   "Lato" => {
      #     normal: "./fonts/Lato/Lato-Regular.ttf",
      #     bold: "./fonts/Lato/Lato-Bold.ttf"
      #   }
      # )
      # pdf.font('Lato')
      posts.each do |post|
        draw_post_log(pdf,post)
      end
    end
    file_name
  end

  def draw_post_log(pdf,post)
    pdf.text("#{post.Title}", size:16)
    pdf.text("#{post.content}", size:12)
    pdf.text("#{post.user_id}", size:8)
    pdf.text("#{post.created_at}", size:8)

    post.comments.each do |comment|
      pdf.text("#{comment.user_id}", size:10)
      pdf.text("#{comment.content}", size:10)
      pdf.text("#{comment.created_at}", size:10)
    end
  end
end