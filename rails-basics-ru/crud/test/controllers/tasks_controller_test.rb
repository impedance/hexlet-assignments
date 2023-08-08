# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest


  test 'it renders all tasks' do
    get tasks_url
    assert_response :success
  end

  test 'it renders one task' do
    task = Task.create(
      name: Faker::Hacker.verb,
      creator: Faker::Name.name,
      completed: true
    )
    get task_path(task)
    assert_response :success
  end

  test 'it renders form for creation' do
    get new_task_path
    assert_response :success
  end

  test 'it creates new task' do
    task_name = Faker::Hacker.verb
    task_data = { task: { name: task_name, creator: Faker::Name.name, completed: true } }

    post tasks_path, params: task_data
    assert_redirected_to tasks_path
    created_task = Task.find_by(name: task_name)
    assert_equal task_name, created_task.name
  end

  test 'it renders task editing form' do
    task = Task.create(
      name: Faker::Hacker.verb,
      creator: Faker::Name.name,
      completed: true
    )
    get edit_task_path(task)
    assert_response :success
  end

  test 'it updates task' do
    task = Task.create(
      name: Faker::Hacker.verb,
      creator: Faker::Name.name,
      completed: true
    )

    updated_name = Faker::Name.name
    patch task_path(task), params: { task: { name: updated_name, creator: 'Another' } }
    assert_redirected_to task_path(task)
    updated_task = Task.find(task.id)
    assert_equal updated_task.name, updated_name
  end

  test 'it deletes task' do
    task = Task.create(
      name: Faker::Hacker.verb,
      creator: Faker::Name.name,
      completed: true
    )

    delete task_path(task)
    assert_redirected_to tasks_path
    assert_empty Task.where(id: task.id), 'Task should be deleted'
  end
end
