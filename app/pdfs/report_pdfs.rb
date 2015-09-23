class ReportPdf < Prawn::Document
  def initialize
    super
    text "Report goes here"
  end
end