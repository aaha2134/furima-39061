require 'rails_helper'

RSpec.describe User, type: :model do
before do
  @user = FactoryBot.build(:user)
end

  describe 'ユーザー新規登録' do

      context '新規登録できるとき'do
      it 'nicknameとemailとpasswordとpassword_confirmationとfirst_name_kanjiとlast_name_kanjiとfirst_name_kanjiとlast_name_kanjiとfirst_name_kanaとlast_name_kanaとbirth_dateが存在すれば登録できる' do
      expect(@user).to be_valid 
      end


    it 'nicknameが空では登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end


    it 'first_name_kanjiが空では登録できない' do
      @user.first_name_kanji = ''  # first_name_kanjiの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''  # first_name_kanaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''  # birth_dateの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')

    end

    

    it 'passwordが5文字以下では登録できない' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    
    
    it 'passwordは数字を使わないと登録できない' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordは英字を使わないと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
      end

    end
  end
end