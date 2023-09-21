require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
it 'saves successfully when all fields are set' do
      category = Category.create(name: 'TestCategory')
      product = Product.new(
        name: 'TestProduct',
        price: 10.99,
        quantity: 5,
        category: category
      )
      expect(product).to be_valid
    end

    # Example 2: Validate presence of name
    it 'is not valid without a name' do
      category = Category.create(name: 'TestCategory')
      product = Product.new(
        price: 10.99,
        quantity: 5,
        category: category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    # Example 3: Validate presence of price
    it 'is not valid without a price' do
      category = Category.create(name: 'TestCategory')
      product = Product.new(
        name: 'TestProduct',
        quantity: 5,
        category: category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    # Example 4: Validate presence of quantity
    it 'is not valid without a quantity' do
      category = Category.create(name: 'TestCategory')
      product = Product.new(
        name: 'TestProduct',
        price: 10.99,
        category: category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    # Example 5: Validate presence of category
    it 'is not valid without a category' do
      product = Product.new(
        name: 'TestProduct',
        price: 10.99,
        quantity: 5
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
