class EmployeeSerializer < ActiveModel::Serializer
  attributes *[:id,:name, :age, :city, :state, :address ,:emails]
  # attributes :id
end
