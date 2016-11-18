class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :name
    	t.string :company
    	t.string :mobile
    	t.string :email
    	t.string :website

        t.timestamps
        #t.datetime :created_at
        #t.datetime :updated_at
    end
  end
end

# integer -creates a column for integer, float - creates a column for decimal numbers, 
# text = like string but it not restricted to 255 char, allots dynamically, boolean, date, time, datetime
