require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "sports")
    end

    test "categoria deve ser valida" do
        assert @category.valid?
    end

    test "nome deve estar presente" do
        @category.name = " "
        assert_not @category.valid?
    end

    test "nome deve ser unico" do
        @category.save
        category2 = Category.new(name: "sports")
        assert_not category2.valid?
    end

    test "nome nao deve ser muito longo" do
        @category.name = "a" * 26
        assert_not @category.valid?
    end

    test "nome nao deve ser muito curto" do
        @category.name = "aa"
        assert_not @category.valid?
    end

end