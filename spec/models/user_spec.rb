require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,password,password_confirmation,first_name,last_name,first_name_hurigana,last_name_hurigana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameに半角文字が含まれていると登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name must be entered in full-width (kanji, hiragana, katakana)')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameに半角文字が含まれていると登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name must be entered in full-width (kanji, hiragana, katakana)')
      end
      it 'first_name_huriganaが空では登録できない' do
        @user.first_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hurigana can't be blank")
      end
      it 'first_name_huriganaに半角文字が含まれていると登録できない' do
        @user.first_name_hurigana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name hurigana must be entered in full-width (katakana)')
      end
      it 'first_name_huriganaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_hurigana = 'Ｔあ郎：'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name hurigana must be entered in full-width (katakana)')
      end
      it 'last_name_huriganaが空では登録できない' do
        @user.last_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name hurigana can't be blank")
      end
      it 'last_name_huriganaに半角文字が含まれていると登録できない' do
        @user.last_name_hurigana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name hurigana must be entered in full-width (katakana)')
      end
      it 'last_name_huriganaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_hurigana = '山Ｄあ；'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name hurigana must be entered in full-width (katakana)')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '英字のみのpasswordでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must be entered in single-byte alphanumerical characters')
      end
      it '数字のみのpasswordでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must be entered in single-byte alphanumerical characters')
      end
      it '全角文字を含むpasswordでは登録できない' do
        @user.password = 'Ａaa111'
        @user.password_confirmation = 'Ａaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must be entered in single-byte alphanumerical characters')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end
  end
end
