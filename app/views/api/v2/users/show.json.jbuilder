json.extract! @user, :id, :name, :email, :rut, :user_type, :suspended
json.set! :name_test, @evaluation.name
json.extract!  @lastTest, :grade
