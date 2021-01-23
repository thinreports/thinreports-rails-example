# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :due_date
      t.boolean :done

      t.timestamps
    end
  end
end
