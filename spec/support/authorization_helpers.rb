module AuthorizationHelpers
  def define_permission!(user, action, thing)
    Permissions.create!(:user => user,
                        :action => action,
                        :thing => thing)
  end
end

RSpec.configure do |c|
  c.include AuthorizationHelpers
end

