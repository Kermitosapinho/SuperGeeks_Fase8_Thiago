class Gain < ApplicationRecord
 validate_presence_of :description, :user_id 
end
