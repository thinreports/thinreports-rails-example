# frozen_string_literal: true

require "test_helper"
require "pdf-reader"

class TasksReportTest < ActiveSupport::TestCase
  setup do
    @tasks = tasks(:one, :two)
  end

  test "should generate a PDF" do
    pdf_data = TasksReport.new(@tasks).generate
    pdf_reader = PDF::Reader.new(StringIO.new(pdf_data))

    assert_equal 1, pdf_reader.page_count

    @tasks.each do |task|
      assert_includes pdf_reader.page(1).text, task.name
    end
  end
end
