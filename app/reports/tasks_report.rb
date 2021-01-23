# frozen_string_literal: true

class TasksReport < BaseReport
  def initialize(tasks)
    @tasks = tasks
  end

  private

  attr_reader :tasks

  def template_name
    'tasks'
  end

  def build
    tasks.each do |task|
      report.list.add_row do |row|
        row.values no: task.id,
                    name: task.name,
                    due_date: task.due_date,
                    state: task.done? ? 'done' : 'yet'
        row.item(:name).style(:color, 'red') unless task.done?
      end
    end
  end
end
