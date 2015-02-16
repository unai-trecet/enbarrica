class AddTimestampsToDenominaciones < ActiveRecord::Migration
  def change
    add_timestamps :denominaciones
  end
end
