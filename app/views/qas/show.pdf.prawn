logopath = "#{Rails.root}/app/assets/images/logo.jpg"
pdf.font "Helvetica"

pdf.image logopath, :width => 100

float do
  move_up 25
  text "4DX report for #{current_user.name}", :size => 20, :style => :bold, :align => :right
end

pdf.move_down(5)

teams = [["Team Name", "Completed Item Percentage", "Total Number of All Items"]]
teams += @teams.map do |team|
  [
  team.name,
  team.qas.count > 0 ? ((team.qas.where(:completed => true).where("qas.created_at >= ?", 2.weeks.ago.utc).count / team.qas.count.to_f) * 100).to_i : 100,
  team.qas.count > 0 ? team.qas.count : 0
  ]
end

table(teams, :header => true,
             :column_widths => [340, 100, 100],
             :row_colors => ["F0F0F0", "FFFFCC"],
             :cell_style => { :border_color => "#004990"})

