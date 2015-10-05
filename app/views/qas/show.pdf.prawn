require 'prawn/table'

pdf.text "4DX report for #{current_user.name}", :size => 30, :style => :bold

pdf.move_down(30)

teams = @teams.map do |team|
  [
  team.name,
  team.qas.count > 0 ? ((team.qas.where(:completed => true).count / team.qas.count.to_f) * 100).to_i : 0
  ]
end

pdf.table teams