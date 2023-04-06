class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :password, presence: true, length:{ minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
         validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角のみで入力してください"}
         validates :last_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角のみで入力してください"}
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: "は全角カタカナで入力してください" }
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: "は全角カタカナで入力してください" }
         validates :birth_date, presence: true
        #  has_many :items
        #  has_many :orders
end
