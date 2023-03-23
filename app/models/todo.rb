class Todo < ApplicationRecord

    enum status: [:CREATED, :IN_PROGRESS, :CANCELED, :COMPLETED]
    enum priority: [:LOW, :MEDIUM, :HIGH]

    # DATA => title min => title max => 25, is not empty, contains a fullstop
    # description => min => 40, is not empty

    validates :title, length: {minimum:5, maximum:25}, presence: true
    validates :description, presence: true, length: {minimum: 40}

    
end
