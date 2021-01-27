class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, presence: true, length: { maximum: 15 }
  validates :birthday, presence: true
  
 with_options presence: true do
   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "お名前の(姓)には全角文字で入力して下さい"}
   validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "お名前の(名)には全角文字で入力して下さい"}
   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "お名前カナの(姓)には全角文字で入力して下さい"}
   validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "お名前カナの(名)には全角文字で入力して下さい"}
   validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'passwordには英字と数字の両方を含めて設定してください' }
 end

end
