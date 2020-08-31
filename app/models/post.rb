class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_title_clickbait, if: :title

    def is_title_clickbait
        if !self.title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
            errors.add(:title, "No clickbait!")
        end
    end

end
