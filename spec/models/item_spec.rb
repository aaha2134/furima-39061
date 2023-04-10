require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end
  
    describe '投稿情報の保存' do
  
  
        context '投稿が保存できるとき'do
        
          it 'product_name,description,category_id,condition_id,fee_id ,area_id,deliverytime_id,price,user,imageが存在すれば登録できる' do
          expect(@item).to be_valid 
          end
  
    end
  end




        context '投稿が保存できない場合' do
          it '商品画像が空では投稿できない' do
            @item.image = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Image can't be blank")
            

          end   
          
          

          it '商品名が空では投稿できない' do
            @item.product_name = ''  
            @item.valid?
            expect(@item.errors.full_messages).to include("Product name can't be blank")
            
          end

          

          it '商品説明が空では投稿できない' do
            @item.description = ''  
            @item.valid?
            expect(@item.errors.full_messages).to include("Description can't be blank")

          end



          it '商品カテゴリーが空では投稿できない' do
            @item.category_id = '1'  
            @item.valid?
            expect(@item.errors.full_messages).to include("Category must be other than 1")


          end



          it '商品の状態が空では投稿できない' do
            @item.condition_id = '1'  
            @item.valid?
            expect(@item.errors.full_messages).to include("Condition must be other than 1")



          end



          it '配送料の負担が空では投稿できない' do
            @item.fee_id = '1'  
            @item.valid?
            expect(@item.errors.full_messages).to include("Fee must be other than 1")


          end


          it '発送元の地域が空では投稿できない' do
            @item.area_id = '1'  
            @item.valid?
            expect(@item.errors.full_messages).to include("Area must be other than 1")

          end



          it '発送までの日数が空では投稿できない' do
            @item.deliverytime_id = '1'  
            @item.valid?
            expect(@item.errors.full_messages).to include("Deliverytime must be other than 1")

          end




          it '販売価格が空では投稿できない' do
            @item.price = ''  
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")


          end


          it '販売価格は300未満では投稿できない' do
            @item.price = 200 
            @item.valid?
            expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")


          end



          it '販売価格は10000000以上では投稿できない' do
            @item.price = 100000001 
            @item.valid?
            expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")


          end


          it '販売価格は半角数字でなければ投稿できない' do
            @item.price = 'aaa１'  
            @item.valid?
            expect(@item.errors.full_messages).to include("Price is not a number")

          end




          it 'userが紐づいていないと投稿できない' do
            @item.user = nil
            @item.price = 1000  
            @item.valid?
            expect(@item.errors.full_messages).to include("User must exist")

          end



          end



end
