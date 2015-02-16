class AddTimestampsToVinos < ActiveRecord::Migration
  def change
     add_timestamps :vinos
  end
end
