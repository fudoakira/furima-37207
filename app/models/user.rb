class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,
            format: { with: VALID_PASSWORD_REGEX,
             message: 'must be entered in single-byte alphanumerical characters'}
  VALID_FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true,
            format: { with: VALID_FIRST_NAME_REGEX,
             message: 'must be entered in full-width (kanji, hiragana, katakana)'}
  VALID_LAST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, presence: true,
            format: { with: VALID_LAST_NAME_REGEX,
             message: 'must be entered in full-width (kanji, hiragana, katakana)'}
  VALID_FIRST_NAME_HURIGANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_name_hurigana, presence: true,
            format: { with: VALID_FIRST_NAME_HURIGANA_REGEX,
             message: 'must be entered in full-width (katakana)'}
  VALID_LAST_NAME_HURIGANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_hurigana, presence: true,
            format: { with: VALID_LAST_NAME_HURIGANA_REGEX,
             message: 'must be entered in full-width (katakana)'}
  validates :birthday, presence: true
end
