class CreateFreindships < ActiveRecord::Migration[5.2]
  def change
    create_table :freindships do |t|
    	t.integer :sender_id
    	t.integer :receiver_id

      t.timestamps
    end
  end
end
