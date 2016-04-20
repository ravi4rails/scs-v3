json.array!(@students) do |student|
  json.extract! student, :id, :blood_group, :relegion, :category
  json.url student_url(student, format: :json)
end
