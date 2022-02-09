# frozen_string_literal: true

require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    check "Done" if @task.done

    select_task_due_date @task.due_date

    fill_in "Name", with: @task.name
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "updating a Task" do
    visit tasks_url
    click_on "Edit", match: :first

    check "Done" if @task.done
    select_task_due_date @task.due_date
    fill_in "Name", with: @task.name
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "destroying a Task" do
    visit tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task was successfully destroyed"
  end

  test 'downloading a PDF of the index' do
    visit tasks_url
    click_on 'Print'

    assert_includes page.response_headers['Content-Type'], 'application/pdf'
  end

  test 'downloading a PDF of Task' do
    visit tasks_url
    click_on 'Show', match: :first
    click_on 'Print'

    assert_includes page.response_headers['Content-Type'], 'application/pdf'
  end

  private

  def select_task_due_date(due_date)
    select due_date.year, from: 'task[due_date(1i)]'
    select due_date.strftime('%B'), from: 'task[due_date(2i)]'
    select due_date.day, from: 'task[due_date(3i)]'
  end
end
