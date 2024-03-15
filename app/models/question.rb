class Question < ApplicationRecord
    def option(index)
      options.split(",")[index]
    end
  end