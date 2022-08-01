require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it"Product correctly saves with all input params" do 
      @category = Category.new(name:"newCat")
      @category.save

      @product = Product.new(name:'prod', description:'some',category_id: @category.id,quantity:1,price:10)


      expect(@product.save).to be(true)
      
    end

    it"validates when name is nil" do
      @category = Category.new(name:"newCat")
      @category.save

      @product = Product.new(name:nil, description:'some desc',category_id: @category.id,quantity:1,price:10)

      expect(@product.save).to be(false)
      expect(@product.errors.full_messages).to include("Name can't be blank")
      
    end

    it"validates when price is not present" do
      @category = Category.new(name:"newCat")
      @category.save

      @product = Product.new(name:'prod', description:'some desc',category_id: @category.id,quantity:1, )

      expect(@product.save).to be(false)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    
    it"validates when quantity is not present" do
      @category = Category.new(name:"newCat")
      @category.save

      @product = Product.new(name:'prod', description:'some desc',category_id: @category.id,price:5)

      expect(@product.save).to be(false)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it"validates when category is nil" do
      @category = Category.new(name:"newCat")
      @category.save

      @product = Product.new(name:'prod', description:'some desc',category_id:nil, quantity:1, price:5)

      expect(@product.save).to be(false)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
