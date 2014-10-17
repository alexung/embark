class Request < ActiveRecord::Base
  belongs_to :ride
  belongs_to :requestor, class_name: "User"
end
